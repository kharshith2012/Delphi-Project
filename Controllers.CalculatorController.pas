unit Controllers.CalculatorController;

interface

uses
  Interfaces.ICalculator, Models.Calculator;

type
  TCalculatorController = class
  private
    FCalculator: ICalculator;
  public
    constructor Create;
    function GetCalculator: ICalculator;
  end;

implementation

{ TCalculatorController }

constructor TCalculatorController.Create;
begin
  FCalculator := TCalculator.Create;
end;

function TCalculatorController.GetCalculator: ICalculator;
begin
  Result := FCalculator;
end;

end.

