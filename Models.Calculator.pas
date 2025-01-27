unit Models.Calculator;

interface

uses
  System.SysUtils, Interfaces.ICalculator, System.Generics.Collections;

type
  TCalculator = class(TInterfacedObject, ICalculator)
  private
    FExpression: string;
    function EvaluateExpression(const AExpression: string): Double;
  public
    constructor Create;
    procedure EnterValue(AValue: Double);
    procedure SetOperator(AOperator: Char);
    function GetResult: Double;
    procedure Clear;
  end;

implementation

uses
  System.Math;

{ TCalculator }

constructor TCalculator.Create;
begin
  FExpression := '';
end;

procedure TCalculator.Clear;
begin
  FExpression := '';
end;

procedure TCalculator.EnterValue(AValue: Double);
begin
  FExpression := FExpression + FloatToStr(AValue);
end;

procedure TCalculator.SetOperator(AOperator: Char);
begin
  if not CharInSet(AOperator, ['+', '-', '*', '/']) then
    raise Exception.Create('Invalid operator');

  FExpression := FExpression + AOperator;
end;

function TCalculator.GetResult: Double;
begin
  Result := EvaluateExpression(FExpression);
  FExpression := FloatToStr(Result); // Store the result as the new base value
end;
function TCalculator.EvaluateExpression(const AExpression: string): Double;
var
  Values: TStack<Double>;
  Operators: TStack<Char>;
  I: Integer;

  function GetPrecedence(AOperator: Char): Integer;
  begin
    case AOperator of
      '+', '-': Result := 1;
      '*', '/': Result := 2;
    else
      Result := 0;
    end;
  end;

  procedure PerformOperation;
  var
    B, A: Double;
    Op: Char;
  begin
    if (Values.Count < 2) or (Operators.Count < 1) then
      raise Exception.Create('Invalid expression');

    B := Values.Pop;
    A := Values.Pop;
    Op := Operators.Pop;

    case Op of
      '+': Values.Push(A + B);
      '-': Values.Push(A - B);
      '*': Values.Push(A * B);
      '/':
        if B = 0 then
          raise Exception.Create('Division by zero')
        else
          Values.Push(A / B);
    end;
  end;

begin
  Values := TStack<Double>.Create;
  Operators := TStack<Char>.Create;

  try
    I := 1;
    while I <= Length(AExpression) do
    begin
      if CharInSet(AExpression[I], ['0'..'9', '.']) then
      begin
        // Parse numeric value
        var NumStr := '';
        while (I <= Length(AExpression)) and CharInSet(AExpression[I], ['0'..'9', '.']) do
        begin
          NumStr := NumStr + AExpression[I];
          Inc(I);
        end;
        Values.Push(StrToFloat(NumStr));
      end
      else if CharInSet(AExpression[I], ['+', '-', '*', '/']) then
      begin
        // Parse operator
        while (Operators.Count > 0) and
              (GetPrecedence(Operators.Peek) >= GetPrecedence(AExpression[I])) do
        begin
          PerformOperation;
        end;
        Operators.Push(AExpression[I]);
        Inc(I);
      end
      else
        Inc(I); // Skip unrecognized characters
    end;

    // Finalize operations
    while Operators.Count > 0 do
    begin
      PerformOperation;
    end;

    if Values.Count = 1 then
      Result := Values.Pop
    else
      raise Exception.Create('Invalid expression');
  finally
    Values.Free;
    Operators.Free;
  end;
end;

end.

