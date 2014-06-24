program AdventureSports;

uses
  Vcl.Forms,
  Activity in '..\Common\Activity.pas',
  SportsTraining in '..\Common\SportsTraining.pas',
  Vcl.Themes,
  Vcl.Styles,
  MainForm in 'MainForm.pas' {Form1} ,
  MainActivity in 'MainActivity.pas' {Form2} ,
  MainStage in 'MainStage.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Metropolis UI Blue');
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;

end.
