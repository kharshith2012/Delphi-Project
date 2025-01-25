unit frmCalculator1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Controllers.CalculatorController, Interfaces.ICalculator;

type
  TForm1 = class(TForm)
    Display: TEdit;
    btn9: TButton;
    BtnEquals: TButton;
    btn0: TButton;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    Button10: TButton;
    Add: TButton;
    Subtract: TButton;
    Multiply: TButton;
    BtnDivide: TButton;
    procedure NumberClick(Sender: TObject);
    procedure OperatorClick(Sender: TObject);
    procedure EqualsClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
  private
    FController: TCalculatorController;
    FCalculator: ICalculator;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  var
  CalculatorForm: TForm1;

implementation
constructor TCalculatorForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FController := TCalculatorController.Create;
  FCalculator := FController.GetCalculator;
end;

destructor TCalculatorForm.Destroy;
begin
  FController.Free;
  inherited;
end;

procedure TCalculatorForm.NumberClick(Sender: TObject);
begin
  FCalculator.EnterValue(StrToInt((Sender as TButton).Caption));
  Display.Text := Display.Text + (Sender as TButton).Caption;
end;

procedure TCalculatorForm.OperatorClick(Sender: TObject);
begin
  FCalculator.SetOperator((Sender as TButton).Caption[1]);
  Display.Text := Display.Text + ' ' + (Sender as TButton).Caption + ' ';
end;

procedure TCalculatorForm.EqualsClick(Sender: TObject);
begin
  Display.Text := FloatToStr(FCalculator.GetResult);
end;

procedure TCalculatorForm.ClearClick(Sender: TObject);
begin
  FCalculator.Clear;
  Display.Text := '';
end;
{$R *.dfm}

end.
