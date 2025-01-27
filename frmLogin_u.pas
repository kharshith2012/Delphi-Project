unit frmLogin_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frmDashboard_u, frmContact_u;
  function AddNumbers(A, B: Integer): Integer; stdcall; external 'AddNumberDll.dll';

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    txtUser: TEdit;
    Edit2: TEdit;
    Login: TButton;
    btnCancel: TButton;
    procedure LoginClick(Sender: TObject);
    procedure LoginTest;
    function LoginPassword():string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.LoginClick(Sender: TObject);
var
  Sum: Integer;
begin
// Call the functions from the DLL
  Sum := AddNumbers(10, 20);

  // Display the results
  ShowMessage('Sum: ' + IntToStr(Sum));

  var n:string := 'testing';
  txtUser.text:=n;
  Edit2.text:=LoginPassword();
//  frmLogin.Close;
  frmContact.Show;
end;

procedure TfrmLogin.LoginTest;
begin
  var n:string := 'testing';
end;

function TfrmLogin.LoginPassword():string;
begin
  var n:string := 'testing password';
  LoginPassword:= n;
end;
end.
