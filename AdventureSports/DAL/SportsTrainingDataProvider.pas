unit SportsTrainingDataProvider;

interface

uses System.SysUtils, Data.DB, Data.Win.ADODB;
function GetAllSportsTraining: TADODataSet; stdcall;
exports GetAllSportsTraining;

implementation

function GetAllSportsTraining: TADODataSet; stdcall;
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
  SQLconnection.ConnectionString :=
    'FILE NAME=C:\Users\Lionel\Documents\Embarcadero\Studio\Projets\WinForm\MUI\AdventureSports\AdventureSports\AdventureSports\AdventureSports.udl';
  SQLconnection.Connected := true;
  AdventureDataSet.Connection := SQLconnection;
  AdventureDataSet.CommandType := cmdText;
  AdventureDataSet.CommandText := 'SELECT * FROM SPORTSTRAINING';
  AdventureDataSet.Open;
  Result := AdventureDataSet;
end;

end.
