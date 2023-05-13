program crud_mvc;

uses
  Vcl.Forms,
  crud_mvc.view.principal in 'src\view\crud_mvc.view.principal.pas' {Form1},
  crud_mvc.model.entidades.pessoa in 'src\model\entidades\crud_mvc.model.entidades.pessoa.pas',
  crud_mvc.model.entidades.endereco in 'src\model\entidades\crud_mvc.model.entidades.endereco.pas',
  crud_mvc.model.conexao.interfaces in 'src\model\conexao\crud_mvc.model.conexao.interfaces.pas',
  crud_mvc.model.conexao.firedac.connection in 'src\model\conexao\crud_mvc.model.conexao.firedac.connection.pas',
  crud_mvc.model.conexao.firedac.query in 'src\model\conexao\crud_mvc.model.conexao.firedac.query.pas',
  crud_mvc.model.conexao.factory in 'src\model\conexao\crud_mvc.model.conexao.factory.pas',
  crud_mvc.dao.interfaces in 'src\model\dao\crud_mvc.dao.interfaces.pas',
  crud_mvc.dao.pessoa in 'src\model\dao\crud_mvc.dao.pessoa.pas',
  crud_mvc.dao.endereco in 'src\model\dao\crud_mvc.dao.endereco.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
