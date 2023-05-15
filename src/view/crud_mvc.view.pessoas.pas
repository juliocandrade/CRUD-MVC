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
  crud_mvc.controller.interfaces, crud_mvc.utilitarios;

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
    dbGridCadastro: TDBGrid;
    pnlResume: TPanel;
    lblRegistros: TLabel;
    dsCadastro: TDataSource;
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
  private
    { Private declarations }
    FController : iControllerPessoa;
    FTypeOperacao : TTypeOperacao;
    procedure AplicarEstilo;
    procedure LimparCampos;
    procedure Alterar;
    procedure Incluir;
    procedure Pesquisar;
    procedure PreencherCampos;
    procedure ValidarDatasetVazio(Datasource : TDataSource; TipoOperacao : TTypeOperacao);
  public
    { Public declarations }
  end;

var
  frmPessoas: TfrmPessoas;

implementation

uses
  crud_mvc.controller.pessoa, crud_mvc.view.style;

{$R *.dfm}

procedure TfrmPessoas.Alterar;
begin
  ValidarDatasetVazio(dsCadastro, toAlterar);
  PreencherCampos;
  FTypeOperacao := toAlterar;
  lblPage.Caption := 'Alterar Pessoa';
  pnlPrincipal.ActiveCard := cardCadastro;
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
end;

procedure TfrmPessoas.btnAlterarClick(Sender: TObject);
begin
  Alterar;
end;

procedure TfrmPessoas.btnExcluirClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmPessoas.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPessoas.btnIncluirClick(Sender: TObject);
begin
  Incluir;
end;

procedure TfrmPessoas.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmPessoas.btnSalvarClick(Sender: TObject);
begin
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
  FController := TControllerPessoa.New;
  FController.DAO.DataSource(dsCadastro);
end;

procedure TfrmPessoas.FormShow(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := cardPesquisa;
  Pesquisar;
end;

procedure TfrmPessoas.Incluir;
begin
  LimparCampos;
  FTypeOperacao := toIncluir;
  lblPage.Caption := 'Incluir Pessoa';
  pnlPrincipal.ActiveCard := cardCadastro;
end;

procedure TfrmPessoas.LimparCampos;
begin
  TUtilitarios.LimparCampos(pnlCadastroPrincipal);
end;

procedure TfrmPessoas.Pesquisar;
var
  s : string;
begin
  s := 's';
  if dsCadastro.DataSet.RecordCount = 1 then
    s := '';

  lblRegistros.Caption := Format('%d registro%s encontrado%s', [dsCadastro.DataSet.RecordCount, s, s]);
end;

procedure TfrmPessoas.PreencherCampos;
begin

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
