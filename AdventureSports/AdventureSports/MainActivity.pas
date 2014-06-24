unit MainActivity;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Activity,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Generics.Collections, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    ComboBoxActivity: TComboBox;
    MemoDescription: TMemo;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ButtonRetour: TButton;
    procedure FormActivate(Sender: TObject);
    procedure ComboBoxActivityChange(Sender: TObject);
    procedure ButtonRetourClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

type
  TGetAllActivity = function: TObjectList<TActivity>; stdcall;

var
  Form2: TForm2;

implementation

uses MainForm;
{$R *.dfm}

procedure TForm2.ButtonRetourClick(Sender: TObject);

begin
  Self.Close;
  MainForm.Form1.Show;
end;

procedure TForm2.ComboBoxActivityChange(Sender: TObject);
begin
  MemoDescription.Text :=
    TActivity(ComboBoxActivity.Items.Objects[ComboBoxActivity.ItemIndex])
    .description;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
  handle: HMODULE;
  GetAllActivity: TGetAllActivity;
  Activity: TActivity;
begin
  try
    handle := LoadPackage
      ('C:\Users\Lionel\Documents\Embarcadero\Studio\Projets\WinForm\MUI\AdventureSports\AdventureSports\packages\BU.bpl');
    @GetAllActivity := GetProcAddress(handle, PChar('GetAllActivity'));
    for Activity in GetAllActivity do
    begin
      ComboBoxActivity.Items.AddObject(Activity.labelActivity, Activity);
    end;
    ComboBoxActivity.ItemIndex := 0;
    MemoDescription.Text :=
      TActivity(ComboBoxActivity.Items.Objects[ComboBoxActivity.ItemIndex])
      .description;
  except
    on e: Exception do
    begin
      ShowMessage('Une erreur est survenue ,l''application va se fermer !' +
        #13#10 + e.Message);
      Application.Terminate;
    end;
  end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.Form1.Show;
end;

end.
