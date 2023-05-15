program crud_mvc;

uses
  Vcl.Forms,
  crud_mvc.view.principal in 'src\view\crud_mvc.view.principal.pas' {frmPrincipal},
  crud_mvc.model.entidades.pessoa in 'src\model\entidades\crud_mvc.model.entidades.pessoa.pas',
  crud_mvc.model.entidades.endereco in 'src\model\entidades\crud_mvc.model.entidades.endereco.pas',
  crud_mvc.model.conexao.interfaces in 'src\model\conexao\crud_mvc.model.conexao.interfaces.pas',
  crud_mvc.model.conexao.firedac.connection in 'src\model\conexao\crud_mvc.model.conexao.firedac.connection.pas',
  crud_mvc.model.conexao.firedac.query in 'src\model\conexao\crud_mvc.model.conexao.firedac.query.pas',
  crud_mvc.model.conexao.factory in 'src\model\conexao\crud_mvc.model.conexao.factory.pas',
  crud_mvc.model.dao.interfaces in 'src\model\dao\crud_mvc.model.dao.interfaces.pas',
  crud_mvc.model.dao.pessoa in 'src\model\dao\crud_mvc.model.dao.pessoa.pas',
  crud_mvc.model.dao.endereco in 'src\model\dao\crud_mvc.model.dao.endereco.pas',
  crud_mvc.controller.interfaces in 'src\controller\crud_mvc.controller.interfaces.pas',
  crud_mvc.controller.pessoa in 'src\controller\crud_mvc.controller.pessoa.pas',
  crud_mvc.view.style in 'src\view\crud_mvc.view.style.pas',
  crud_mvc.view.pessoas in 'src\view\crud_mvc.view.pessoas.pas' {frmPessoas},
  crud_mvc.model.enumeradores in 'src\model\crud_mvc.model.enumeradores.pas',
  crud_mvc.utilitarios in 'src\utils\crud_mvc.utilitarios.pas',
  crud_mvc.view.pessoa.endereco in 'src\view\crud_mvc.view.pessoa.endereco.pas' {frmPessoaEndereco},
  crud_mvc.controller.endereco in 'src\controller\crud_mvc.controller.endereco.pas',
  crud_mvc.utilitarios.validators.attributes in 'src\utils\crud_mvc.utilitarios.validators.attributes.pas',
  crud_mvc.utilitarios.validators.engine in 'src\utils\crud_mvc.utilitarios.validators.engine.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmPessoas, frmPessoas);
  Application.CreateForm(TfrmPessoaEndereco, frmPessoaEndereco);
  Application.Run;
end.
