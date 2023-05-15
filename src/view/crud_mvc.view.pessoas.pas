unit crud_mvc.view.pessoas;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.WinXPanels,
  crud_mvc.model.enumeradores,
  crud_mvc.controller.interfaces,
  crud_mvc.utilitarios;

type
  TfrmPessoas = class(TForm)
    PnlPrincipal: TCardPanel;
    cardCadastro: TCard;
    pnlCadastroBotoes: TPanel;
    bntCancelar: TButton;
    btnSalvar: TButton;
    pnlCadastroPrincipal: TPanel;
    pnlCadastroTop: TPanel;
    lblPage: TLabel;
    cardPesquisa: TCard;
    pnlPesquisa: TPanel;
    btnPesquisar: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    edtPesquisar: TEdit;
    pnlPesquisarBotoes: TPanel;
    btnFechar: TButton;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    pnlGrid: TPanel;
    pnlResume: TPanel;
    lblRegistros: TLabel;
    dsCadastro: TDataSource;
    pnlDadosPessoa: TPanel;
    StackPanel1: TStackPanel;
    Label6: TLabel;
    edtDocumento: TEdit;
    Label3: TLabel;
    edtTelefone: TEdit;
    StackPanel2: TStackPanel;
    Label5: TLabel;
    edtNome: TEdit;
    Label2: TLabel;
    edtEmail: TEdit;
    pnlDadosEndereco: TPanel;
    Label4: TLabel;
    pnlDadosEnderecoButtons: TPanel;
    btnEnderecoExcluir: TButton;
    btnEnderecoIncluir: TButton;
    btnEnderecoAlterar: TButton;
    dbGridEnderecos: TDBGrid;
    dbGridCadastro: TDBGrid;
    dsEnderecos: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure bntCancelarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dbGridCadastroDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEnderecoIncluirClick(Sender: TObject);
    procedure btnEnderecoAlterarClick(Sender: TObject);
    procedure btnEnderecoExcluirClick(Sender: TObject);
    procedure PnlPrincipalCardChange(Sender: TObject; PrevCard,
      NextCard: TCard);
  private
    { Private declarations }
    FControllerPessoa : iControllerPessoa;
    FControllerEndereco : iControllerEndereco;
    FTypeOperacao : TTypeOperacao;
    FIDPessoa : String;
    procedure AplicarEstilo;
    procedure LimparCampos;
    procedure Alterar;
    procedure Pesquisar;
    procedure PreencherCampos;
    procedure ValidarDatasetVazio(Datasource : TDataSource; TipoOperacao : TTypeOperacao);
    procedure PesquisarEnderecos;
    procedure AlterarEndereco;
  public
    { Public declarations }
  end;

var
  frmPessoas: TfrmPessoas;

implementation

uses
  crud_mvc.controller.pessoa,
  crud_mvc.view.style,
  crud_mvc.controller.endereco, crud_mvc.view.pessoa.endereco;

{$R *.dfm}

procedure TfrmPessoas.Alterar;
begin
  ValidarDatasetVazio(dsCadastro, toAlterar);
  PreencherCampos;
  FTypeOperacao := toAlterar;
  lblPage.Caption := 'Alterar Pessoa';
  pnlPrincipal.ActiveCard := cardCadastro;
end;

procedure TfrmPessoas.AlterarEndereco;
begin
  ValidarDatasetVazio(dsEnderecos, toAlterar);
  frmPessoaEndereco.AlterarEndereco(dsEnderecos.DataSet.FieldByName('id').AsString);
  PesquisarEnderecos;
end;

procedure TfrmPessoas.AplicarEstilo;
begin
  self.Color := COR_FUNDO;
  pnlCadastroTop.Color := COR_TOPO_CADASTRO;
  pnlPrincipal.Color := COR_FUNDO;
  pnlGrid.Color := COR_FUNDO;
end;

procedure TfrmPessoas.bntCancelarClick(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := cardPesquisa;
  Pesquisar;
end;

procedure TfrmPessoas.btnAlterarClick(Sender: TObject);
begin
  Alterar;
end;

procedure TfrmPessoas.btnEnderecoAlterarClick(Sender: TObject);
begin
  AlterarEndereco;
end;

procedure TfrmPessoas.btnEnderecoExcluirClick(Sender: TObject);
begin
  ValidarDatasetVazio(dsEnderecos, toExcluir);
  if Application.MessageBox('Deseja realmente excluir o endereço ?', 'Excluir pessoa', MB_YESNO + MB_ICONQUESTION) <> mrYes then
    exit;

  TControllerEndereco.New.DAO.Excluir(dsEnderecos.DataSet.FieldByName('id').AsString);
  PesquisarEnderecos;

end;

procedure TfrmPessoas.btnEnderecoIncluirClick(Sender: TObject);
begin
  frmPessoaEndereco.IncluirEndereco(FIdPessoa);
  PesquisarEnderecos;
end;

procedure TfrmPessoas.btnExcluirClick(Sender: TObject);
var
  LMensagem : String;
begin
  ValidarDatasetVazio(dsCadastro, toExcluir);
  LMensagem := Format('Deseja realmente excluir a pessoa "%s"?', [dsCadastro.DataSet.FieldByName('nome').AsString]);
  if Application.MessageBox(PChar(LMensagem), 'Excluir pessoa', MB_YESNO + MB_ICONQUESTION) <> mrYes then
    exit;

  TControllerPessoa.New.DAO.Excluir(dsCadastro.DataSet.FieldByName('id').AsString);
  Pesquisar;
end;

procedure TfrmPessoas.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPessoas.btnIncluirClick(Sender: TObject);
begin
  LimparCampos;
  FTypeOperacao := toIncluir;
  lblPage.Caption := 'Incluir Pessoa';
  pnlPrincipal.ActiveCard := cardCadastro;
end;

procedure TfrmPessoas.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmPessoas.btnSalvarClick(Sender: TObject);
var
  LController : iControllerPessoa;
begin
  Lcontroller := TcontrollerPessoa.New;
  LController.Pessoa.ID := FIDPessoa;
  LController.Pessoa.Nome := edtNome.Text;
  LController.Pessoa.Documento := edtDocumento.Text;
  LController.Pessoa.Email := edtEmail.Text;
  LController.Pessoa.Telefone := edtTelefone.Text;

  case FTypeOperacao of
  toIncluir:
  begin
    LController.DAO.Inserir;
    FIDPessoa := LController.Pessoa.Id;
    PesquisarEnderecos;
    FTypeOperacao := toAlterar;
    pnlDadosEndereco.Visible := true;
    exit;
  end;
  toAlterar:
    LController.DAO.Atualizar;
  end;

  pnlPrincipal.ActiveCard := cardPesquisa;
  Pesquisar;
end;

procedure TfrmPessoas.dbGridCadastroDblClick(Sender: TObject);
begin
  Alterar;
end;

procedure TfrmPessoas.FormCreate(Sender: TObject);
begin
  AplicarEstilo;
  FTypeOperacao := toNull;
  FControllerPessoa := TControllerPessoa.New;
  FControllerEndereco := TControllerEndereco.New;
  FControllerPessoa.DAO.DataSource(dsCadastro);
  FControllerEndereco.DAO.DataSource(dsEnderecos);
end;

procedure TfrmPessoas.FormShow(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := cardPesquisa;
  Pesquisar;
end;

procedure TfrmPessoas.LimparCampos;
begin
  FIDPessoa := '';
  TUtilitarios.LimparCampos(pnlCadastroPrincipal);
end;

procedure TfrmPessoas.Pesquisar;
var
  Ls : string;
  LFiltroPesquisar : String;
begin
  LFiltroPesquisar := TUtilitarios.LikeFind(edtPesquisar.Text, dbGridCadastro);
  FControllerPessoa.DAO.Listar(LFiltroPesquisar);

  Ls := 's';
  if dsCadastro.DataSet.RecordCount = 1 then
    Ls := '';

  lblRegistros.Caption := Format('%d registro%s encontrado%s', [dsCadastro.DataSet.RecordCount, Ls, Ls]);
end;

procedure TfrmPessoas.PesquisarEnderecos;
begin
  FControllerEndereco.DAO.Listar(FIDPessoa)
end;

procedure TfrmPessoas.PnlPrincipalCardChange(Sender: TObject; PrevCard,
  NextCard: TCard);
begin
  pnlDadosEndereco.Visible := FTypeOperacao = toAlterar;
end;

procedure TfrmPessoas.PreencherCampos;
var
  LController : iControllerPessoa;
begin
  LController := TControllerPessoa.New;
  LController.DAO.ListarPorId(dsCadastro.DataSet.FieldByName('id').AsString);
  FIDPessoa := LController.Pessoa.Id;
  edtNome.Text := LController.Pessoa.Nome;
  edtDocumento.Text := LController.Pessoa.Documento;
  edtEmail.Text := LController.Pessoa.Email;
  edtTelefone.Text := LController.Pessoa.Telefone;
  PesquisarEnderecos;
end;

procedure TfrmPessoas.ValidarDatasetVazio(Datasource: TDataSource;
  TipoOperacao: TTypeOperacao);
var
  LTitulo : string;
begin
  LTitulo := 'Excluir registro';
  if TipoOperacao = toAlterar then
    lTitulo := 'Alterar registro';

  if Datasource.DataSet.IsEmpty then
  begin
    Application.MessageBox('Selecione um registro primeiro', PChar(LTitulo), MB_OK + MB_ICONEXCLAMATION);
    Abort;
  end;
end;

end.
