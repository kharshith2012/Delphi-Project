unit frmContact_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.Samples.Spin, Vcl.ComCtrls, View.User, frmCalculator_u;

type
  TfrmContact = class(TForm)
    pnlContactDetails: TPanel;
    pnlPersonalInfo: TPanel;
    pnlAddress: TPanel;
    pnlAction: TPanel;
    pnlContact: TPanel;
    txtFirstName: TEdit;
    txtSurName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cmbGender: TComboBox;
    Image1: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    txtStreet: TEdit;
    txtCity: TEdit;
    txtCountry: TEdit;
    txtPostalCode: TEdit;
    btnShow: TButton;
    Label9: TLabel;
    Label10: TLabel;
    txtTelephone: TEdit;
    txtEmail: TEdit;
    chbSendNewsLletter: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    SpinEdit1: TSpinEdit;
    RichEdit1: TRichEdit;
    procedure btnShowClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContact: TfrmContact;

implementation

{$R *.dfm}

procedure TfrmContact.BitBtn4Click(Sender: TObject);
begin
  frmCalculator.Show
end;

procedure TfrmContact.btnShowClick(Sender: TObject);
begin
  frmUser.Show;
end;

end.
