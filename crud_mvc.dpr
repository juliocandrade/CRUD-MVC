program crud_mvc;

uses
  Vcl.Forms,
  crud_mvc.view.principal in 'src\view\crud_mvc.view.principal.pas' {Form1},
  crud_mvc.model.entidades.pessoa in 'src\model\entidades\crud_mvc.model.entidades.pessoa.pas',
  crud_mvc.model.entidades.endereco in 'src\model\entidades\crud_mvc.model.entidades.endereco.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
