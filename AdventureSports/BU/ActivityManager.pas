unit ActivityManager;

interface

uses
  System.SysUtils, System.Types, Data.Win.ADODB, System.UITypes, System.Classes,
  Activity,
  System.Generics.Collections,
  System.Variants, FMX.ListBox,
  FMX.TabControl, FMX.StdCtrls,
  FMX.Controls, FMX.Types,
  FMX.Graphics, FMX.Forms, FMX.Dialogs, FMX.Edit;

function GetAllActivity: TObjectList<TActivity>; stdcall;
exports GetAllActivity;

type
  TGetAllACtivity = function: TADODataSet; stdcall;

implementation

uses
  Winapi.Windows;

function GetAllActivity: TObjectList<TActivity>;
var
  handle: HMODULE;
  GetAllActivity: TGetAllACtivity;
  activityList: TObjectList<TActivity>;
  AdventureDataSet: TADODataSet;
begin
  AdventureDataSet := TADODataSet.Create(nil);
  handle := LoadPackage
    ('C:\Users\Lionel\Documents\Embarcadero\Studio\Projets\WinForm\MUI\AdventureSports\AdventureSports\packages\DAL.bpl');
  @GetAllActivity := GetProcAddress(handle, PChar('GetAllActivity'));
  AdventureDataSet := GetAllActivity;
  activityList := TObjectList<TActivity>.Create;
  AdventureDataSet.Open;
  while not AdventureDataSet.eOF do
  begin
    try
      activityList.Add(TActivity.Create(AdventureDataSet.FieldByName
        ('ACTIVITY_ID').AsInteger, AdventureDataSet.FieldByName('LABEL')
        .AsString, AdventureDataSet.FieldByName('DESCRIPTION').AsString));
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
  Result := activityList;
end;

end.
