unit FirstWindowsService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs;

 type
  TCPUUsage = record
    IdleTime: Int64;
    KernelTime: Int64;
    UserTime: Int64;
  end;

type
  TSystemMonitorService = class(TService)
  private
    TimerHandle: THandle;
    procedure MonitorSystem;
    procedure WriteLog(const Msg: string);
    function GetCPUUsage: Integer;
  public
    function GetServiceController: TServiceController; override;
  protected
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
  end;

var
  SystemMonitorService: TSystemMonitorService;

implementation

{$R *.dfm}

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  SystemMonitorService.Controller(CtrlCode);
end;

function TSystemMonitorService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TSystemMonitorService.ServiceStart(Sender: TService; var Started: Boolean);
begin
  WriteLog('Service started.');
  TimerHandle := SetTimer(0, 0, 60000, nil); // Run every 60 seconds
   if TimerHandle <> 0 then
  begin
    WriteLog('Timer created successfully.');
    Started := True;
  end
  else
  begin
    WriteLog('Failed to create timer.');
    Started := False;
  end;
end;

procedure TSystemMonitorService.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  if TimerHandle <> 0 then
    KillTimer(0, TimerHandle);
  WriteLog('Service stopped.');
  Stopped := True;
end;

procedure TSystemMonitorService.MonitorSystem;
var
  CpuUsage: Integer;
  MemoryStatus: TMemoryStatusEx;
begin
  // Get CPU Usage
  CpuUsage := GetCPUUsage;

  // Get Memory Usage
  MemoryStatus.dwLength := SizeOf(MemoryStatus);
  if GlobalMemoryStatusEx(MemoryStatus) then
    WriteLog(Format('Memory Usage: %d%%, Total: %d MB, Available: %d MB',
      [MemoryStatus.dwMemoryLoad, MemoryStatus.ullTotalPhys div 1024 div 1024,
      MemoryStatus.ullAvailPhys div 1024 div 1024]));

  // Log CPU Usage
  if CpuUsage >= 0 then
    WriteLog(Format('CPU Usage: %d%%', [CpuUsage]))
  else
    WriteLog('Unable to calculate CPU usage.');
end;

procedure TSystemMonitorService.WriteLog(const Msg: string);
var
  LogFile: TextFile;
  LogFileName: string;
begin
  LogFileName := ExtractFilePath(ParamStr(0)) + 'SystemMonitorLog.txt';
  AssignFile(LogFile, LogFileName);
  try
    if FileExists(LogFileName) then
      Append(LogFile)
    else
      Rewrite(LogFile);
    Writeln(LogFile, Format('%s - %s', [DateTimeToStr(Now), Msg]));
  finally
    CloseFile(LogFile);
  end;
end;

function TSystemMonitorService.GetCPUUsage: Integer;
var
  IdleTime, KernelTime, UserTime: TFileTime;
  PrevTimes, CurrTimes: TCPUUsage;
  DeltaIdle, DeltaKernel, DeltaUser, TotalDelta: Int64;
begin
  Result := -1; // Default: Unable to calculate

  // First Reading
  if not GetSystemTimes(IdleTime, KernelTime, UserTime) then
    Exit;

  PrevTimes.IdleTime := Int64(IdleTime.dwLowDateTime) or (Int64(IdleTime.dwHighDateTime) shl 32);
  PrevTimes.KernelTime := Int64(KernelTime.dwLowDateTime) or (Int64(KernelTime.dwHighDateTime) shl 32);
  PrevTimes.UserTime := Int64(UserTime.dwLowDateTime) or (Int64(UserTime.dwHighDateTime) shl 32);

  // Wait and take Second Reading
  Sleep(100);
  if not GetSystemTimes(IdleTime, KernelTime, UserTime) then
    Exit;

  CurrTimes.IdleTime := Int64(IdleTime.dwLowDateTime) or (Int64(IdleTime.dwHighDateTime) shl 32);
  CurrTimes.KernelTime := Int64(KernelTime.dwLowDateTime) or (Int64(KernelTime.dwHighDateTime) shl 32);
  CurrTimes.UserTime := Int64(UserTime.dwLowDateTime) or (Int64(UserTime.dwHighDateTime) shl 32);

  // Calculate deltas
  DeltaIdle := CurrTimes.IdleTime - PrevTimes.IdleTime;
  DeltaKernel := CurrTimes.KernelTime - PrevTimes.KernelTime;
  DeltaUser := CurrTimes.UserTime - PrevTimes.UserTime;

  TotalDelta := DeltaKernel + DeltaUser;

  if TotalDelta > 0 then
    Result := 100 - Round((DeltaIdle * 100) / TotalDelta);
end;

end.

