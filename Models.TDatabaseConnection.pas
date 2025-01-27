unit Models.TDatabaseConnection;

interface

uses
  System.SysUtils, Data.Win.ADODB, Data.DB;

type
  TDatabaseConnection = class
  private
    FADOConnection: TADOConnection;
    function GetConnection: TADOConnection;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Connect;
    property Connection: TADOConnection read GetConnection;
  end;

implementation

{ TDatabaseConnection }

constructor TDatabaseConnection.Create;
begin
  FADOConnection := TADOConnection.Create(nil);
  if FADOConnection = nil then
    raise Exception.Create('Failed to create ADO Connection.');
   FADOConnection.LoginPrompt := False;
  FADOConnection.ConnectionString := 'Provider=SQLOLEDB;Data Source=LAPTOP-P52VT313;Initial Catalog=EmployeeDB;User ID=sa;Password=admin@123;';
  end;

destructor TDatabaseConnection.Destroy;
begin
  FADOConnection.Free;
  inherited;
end;

procedure TDatabaseConnection.Connect;
begin
  if not FADOConnection.Connected then
    FADOConnection.Open;
end;

function TDatabaseConnection.GetConnection: TADOConnection;
begin
  Result := FADOConnection;
end;

end.

