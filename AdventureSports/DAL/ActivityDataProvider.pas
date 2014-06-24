unit ActivityDataProvider;

interface

uses System.SysUtils, Data.DB, Data.Win.ADODB;
function GetAllActivity: TADODataSet; stdcall;
exports GetAllActivity;

implementation

Function GetAllActivity: TADODataSet; stdcall;
Var
  AdventureDataSet: TADODataSet;
  SQLconnection: TADOConnection;
  Query: TADOQuery;
  DataSource: TDataSource;
begin
  AdventureDataSet := TADODataSet.Create(nil);
  SQLconnection := TADOConnection.Create(nil);
  Query := TADOQuery.Create(nil);
  DataSource := TDataSource.Create(nil);
  SQLconnection.ConnectionString := 'FILE NAME=C:\Users\Lionel\Documents\Embarcadero\Studio\Projets\WinForm\MUI\AdventureSports\AdventureSports\AdventureSports\AdventureSports.udl';
  SQLconnection.Connected := true;
  AdventureDataSet.Connection := SQLconnection;
  AdventureDataSet.CommandType := cmdText;
  AdventureDataSet.CommandText := 'SELECT * FROM ACTIVITY';
  AdventureDataSet.Open;
  Result := AdventureDataSet;
end;

end.
