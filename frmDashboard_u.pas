unit frmDashboard_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls;

type
  TfrmDashboard = class(TForm)
    Menu: TMainMenu;
    Home1: TMenuItem;
    About1: TMenuItem;
    Help1: TMenuItem;
    Exit1: TMenuItem;
    Exit2: TMenuItem;
    Exit3: TMenuItem;
    Manger1: TMenuItem;
    eamLeads1: TMenuItem;
    Executives1: TMenuItem;
    Revenue: TMemo;
    procedure Manger1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDashboard: TfrmDashboard;

implementation

{$R *.dfm}

procedure TfrmDashboard.Manger1Click(Sender: TObject);
begin
    ShowMessage('Selected file: ');
end;

end.
