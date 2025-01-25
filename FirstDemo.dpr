program FirstDemo;

uses
  Vcl.Forms,
  frmLogin_u in 'frmLogin_u.pas' {frmLogin},
  frmDashboard_u in 'frmDashboard_u.pas' {frmDashboard},
  frmContact_u in 'frmContact_u.pas' {frmContact},
  Models.User in 'Models.User.pas',
  Models.TDatabaseConnection in 'Models.TDatabaseConnection.pas',
  View.User in 'View.User.pas' {frmUser},
  Controller.UserController in 'Controller.UserController.pas',
  Models.UserDTO in 'Models.UserDTO.pas',
  Interfaces.IDTO in 'Interfaces.IDTO.pas',
  Interfaces.Icalculator in 'Interfaces.Icalculator.pas',
  Models.Calculator in 'Models.Calculator.pas',
  Controllers.CalculatorController in 'Controllers.CalculatorController.pas',
  frmCalculator_u in 'frmCalculator_u.pas' {frmCalculator};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmDashboard, frmDashboard);
  Application.CreateForm(TfrmContact, frmContact);
  Application.CreateForm(TfrmUser, frmUser);
  Application.CreateForm(TfrmCalculator, frmCalculator);
  Application.Run;
end.
