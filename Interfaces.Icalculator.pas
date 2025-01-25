unit Interfaces.ICalculator;

interface

type
  ICalculator = interface
    ['{12345678-1234-1234-1234-1234567890AB}']
    procedure EnterValue(AValue: Double);
    procedure SetOperator(AOperator: Char);
    function GetResult: Double;
    procedure Clear;
  end;

implementation

end.

