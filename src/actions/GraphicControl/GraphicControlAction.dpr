program GraphicControlAction;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {Form1},
  Component.GraphicNumber in 'Component.GraphicNumber.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
