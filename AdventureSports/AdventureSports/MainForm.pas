unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Activity,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Menus, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, System.Generics.Collections, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    Activit1: TMenuItem;
    Stage1: TMenuItem;
    Clients1: TMenuItem;
    Inscription1: TMenuItem;
    Apropos1: TMenuItem;
    Apropos2: TMenuItem;
    Quitter1: TMenuItem;
    Voirtouteslesactivits1: TMenuItem;
    Ajouteruneactivit1: TMenuItem;
    Voirlesstages1: TMenuItem;
    procedure Quitter1Click(Sender: TObject);
    procedure Voirtouteslesactivits1Click(Sender: TObject);
    procedure ButtonQuitterClick(Sender: TObject);
    procedure Voirlesstages1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses MainActivity, MainStage;

procedure TForm1.ButtonQuitterClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.Quitter1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.Voirlesstages1Click(Sender: TObject);
var
  MainStage: TForm3;
begin
  MainStage := nil;
  if not Assigned(MainStage) then
  begin
    MainStage := TForm3.Create(Application);
    MainStage.Show;
    self.Hide;
  end;
end;

procedure TForm1.Voirtouteslesactivits1Click(Sender: TObject);
var
  MainActivity: TForm2;
begin
  MainActivity := nil;
  if not Assigned(MainActivity) then
  begin
    MainActivity := TForm2.Create(Application);
    MainActivity.Show;
    self.Hide;
  end;

end;

end.
