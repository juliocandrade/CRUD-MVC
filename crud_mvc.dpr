program crud_mvc;

uses
  Vcl.Forms,
  crud_mvc.view.principal in 'src\view\crud_mvc.view.principal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
