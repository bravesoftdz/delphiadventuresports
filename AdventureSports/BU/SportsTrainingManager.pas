unit SportsTrainingManager;

interface

uses
  System.SysUtils, System.Types, Data.Win.ADODB, System.UITypes, System.Classes,
  Activity, SportsTraining,
  System.Generics.Collections,
  System.Variants, FMX.ListBox,
  FMX.TabControl, FMX.StdCtrls,
  FMX.Controls, FMX.Types,
  FMX.Graphics, FMX.Forms, FMX.Dialogs, FMX.Edit;

function GetAllActivity: TObjectList<TSportsTraining>; stdcall;
exports GetAllActivity;

type
  TGetAllACtivity = function: TADODataSet; stdcall;

implementation

uses
  Winapi.Windows;

function GetAllActivity: TObjectList<TSportsTraining>;
var
  handle: HMODULE;
  GetAllActivity: TGetAllACtivity;
  sportsTrainingList: TObjectList<TSportsTraining>;
  AdventureDataSet: TADODataSet;
begin
  AdventureDataSet := TADODataSet.Create(nil);
  handle := LoadPackage
    ('C:\Users\Lionel\Documents\Embarcadero\Studio\Projets\WinForm\MUI\AdventureSports\AdventureSports\packages\DAL.bpl');
  @GetAllActivity := GetProcAddress(handle, PChar('GetAllActivity'));
  AdventureDataSet := GetAllActivity;
  sportsTrainingList := TObjectList<TSportsTraining>.Create;
  AdventureDataSet.Open;
  while not AdventureDataSet.eOF do
  begin
    try
      sportsTrainingList.Add
        (TSportsTraining.Create(AdventureDataSet.FieldByName
        ('SPORTSTRAINING_ID').AsInteger,
        AdventureDataSet.FieldByName('ACTIVITY_ID').AsInteger,
        AdventureDataSet.FieldByName('LABEL').AsString,
        AdventureDataSet.FieldByName('DESCRIPTION').AsString,
        AdventureDataSet.FieldByName('STARTDATE').AsDateTime,
        AdventureDataSet.FieldByName('REGISTRATIONDEADLINE').AsDateTime,
        AdventureDataSet.FieldByName('DURATION').AsInteger,
        AdventureDataSet.FieldByName('REGISTRATIONCOUNT').AsInteger,
        AdventureDataSet.FieldByName('REGISTRATIONMAX').AsInteger,
        AdventureDataSet.FieldByName('LEVEL').AsInteger,
        AdventureDataSet.FieldByName('PRICE').AsInteger,
        AdventureDataSet.FieldByName('MINAGE').AsInteger));
      AdventureDataSet.Next;
    Except
      On e: Exception do
      begin
        showMessage(e.Message);
        exit;
      end;
    end;
  end;
  AdventureDataSet.Close;
  AdventureDataSet.Free;
  Result := sportsTrainingList;
end;

end.
