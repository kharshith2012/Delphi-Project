unit Controller.UserController;

interface

uses
  Models.User, Models.TDatabaseConnection;

type
  TUserController = class
  private
    FUser: TUser;
    FDatabaseConnection: TDatabaseConnection;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadUser(UserID: Integer);
    procedure SaveUser;
    property User: TUser read FUser;
  end;

implementation

{ TUserController }

constructor TUserController.Create;
begin
  FDatabaseConnection := TDatabaseConnection.Create;
  FDatabaseConnection.Connect;
  FUser := TUser.Create(FDatabaseConnection);
end;

destructor TUserController.Destroy;
begin
  FUser.Free;
  FDatabaseConnection.Free;
  inherited;
end;

procedure TUserController.LoadUser(UserID: Integer);
begin
  FUser.UserDTO.ID :=  UserID;
  FUser.LoadUserData(FUser.UserDTO.ID);
end;

procedure TUserController.SaveUser;
begin
  FUser.SaveUserData;
end;

end.

