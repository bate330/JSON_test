program JSONtest;

uses
  Vcl.Forms,
  f_Main in 'f_Main.pas' {MainForm},
  c_Reader in 'c_Reader.pas',
  c_Saver in 'c_Saver.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
