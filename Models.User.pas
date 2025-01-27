unit Models.User;

interface

uses
  System.SysUtils, Data.Win.ADODB, Data.DB, Models.TDatabaseConnection,  Interfaces.IDTO, Models.UserDTO;

type
  TUser = class
  private
    FUserDTO: IUserDTO;
    FDatabse:TDatabaseConnection;
  public
    constructor Create(ADatabse:TDatabaseConnection);
    procedure LoadUserData(AUserID: Integer);
    procedure SaveUserData;
    property UserDTO: IUserDTO read FUserDTO;
  end;

implementation
{ TUser }

constructor TUser.Create(ADatabse:TDatabaseConnection);
begin
  inherited Create;

  FDatabse := ADatabse;

  FUserDTO := TUserDTO.Create;

  FUserDTO.ID := 0;
  FUserDTO.Name := '';
end;

procedure TUser.LoadUserData(AUserID: Integer);
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(nil);
  FUserDTO.ID:=0;
  FUserDTO.Name:='';
  try
    Query.Connection := FDatabse.Connection;
    Query.SQL.Text := 'SELECT ID, Name FROM Users WHERE ID = :ID';
    Query.Parameters.ParamByName('ID').Value := AUserID;
    Query.Open;

    if not Query.Eof then
    begin
      FUserDTO.ID := Query.FieldByName('ID').AsInteger;
      FUserDTO.Name := Query.FieldByName('Name').AsString;
    end;
  finally
    Query.Free;
  end;
end;

procedure TUser.SaveUserData;
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(nil);
  try
    Query.Connection := FDatabse.Connection;
    if FUserDTO.ID = 0 then
    begin
      // Insert new record
      Query.SQL.Text := 'INSERT INTO Users (Name) VALUES (:Name)';
      Query.Parameters.ParamByName('Name').Value := FUserDTO.Name;
    end
    else
    begin
      // Update existing record
      Query.SQL.Text := 'UPDATE Users SET Name = :Name WHERE ID = :ID';
      Query.Parameters.ParamByName('ID').Value := FUserDTO.ID;
      Query.Parameters.ParamByName('Name').Value := FUserDTO.Name;
    end;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;
end.
