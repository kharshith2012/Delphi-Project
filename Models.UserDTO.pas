unit Models.UserDTO;

interface

uses
  Interfaces.IDTO;

type
  TUserDTO = class(TInterfacedObject, IUserDTO)
  private
    FID: Integer;
    FName: string;
    function GetID: Integer;
    procedure SetID(const Value: Integer);
    function GetName: string;
    procedure SetName(const Value: string);
  public
    property ID: Integer read GetID write SetID;
    property Name: string read GetName write SetName;
  end;

implementation

{ TUserDTO }

function TUserDTO.GetID: Integer;
begin
  Result := FID;
end;

procedure TUserDTO.SetID(const Value: Integer);
begin
  FID := Value;
end;

function TUserDTO.GetName: string;
begin
  Result := FName;
end;

procedure TUserDTO.SetName(const Value: string);
begin
  FName := Value;
end;

end.

