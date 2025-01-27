unit View.User;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Controller.UserController;

type
  TfrmUser = class(TForm)
    Label1: TLabel;
    edtUserName: TEdit;
    btnSave: TButton;
    btnCancel: TBitBtn;
    pnlUser: TPanel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    btnLoadUser: TButton;
    edtUserID: TEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure btnLoadUserClick(Sender: TObject);
 private
    FUserController: TUserController;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmUser: TfrmUser;

implementation

{$R *.dfm}

{ TfrmUser }

constructor TfrmUser.Create(AOwner: TComponent);
begin
  inherited;
  FUserController := TUserController.Create;
end;

destructor TfrmUser.Destroy;
begin
  FUserController.Free;
  inherited;
end;

procedure TfrmUser.btnLoadUserClick(Sender: TObject);
begin
 FUserController.LoadUser(StrToInt(edtUserID.Text));
 edtUserName.Text := FUserController.User.UserDTO.Name;
end;

procedure TfrmUser.btnSaveClick(Sender: TObject);
begin
  FUserController.User.UserDTO.Name := edtUserName.Text;
  FUserController.SaveUser;
end;

end.
