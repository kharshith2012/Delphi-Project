unit Interfaces.IDTO;

interface

type
  // Define an interface for the DTO
  IUserDTO = interface
    ['{A1234567-B123-C123-D123-E123456789AB}']  // A unique GUID for the interface
    function GetID: Integer;
    procedure SetID(const Value: Integer);
    function GetName: string;
    procedure SetName(const Value: string);
    property ID: Integer read GetID write SetID;
    property Name: string read GetName write SetName;
  end;

implementation

end.

