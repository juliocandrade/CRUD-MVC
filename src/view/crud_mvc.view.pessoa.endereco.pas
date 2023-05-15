unit crud_mvc.view.pessoa.endereco;

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
  Vcl.StdCtrls,
  Vcl.WinXPanels,
  Vcl.ExtCtrls,
  crud_mvc.model.enumeradores,
  crud_mvc.controller.interfaces;

type
  TfrmPessoaEndereco = class(TForm)
    pnlCadastroBotoes: TPanel;
    bntCancelar: TButton;
    btnSalvar: TButton;
    pnlCadastroPrincipal: TPanel;
    pnlDados: TPanel;
    StackPanel1: TStackPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    Label5: TLabel;
    edtLogradouro: TEdit;
    Panel10: TPanel;
    Panel8: TPanel;
    Label6: TLabel;
    Panel9: TPanel;
    Panel7: TPanel;
    edtCep: TEdit;
    Panel2: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    edtBairro: TEdit;
    Panel12: TPanel;
    Panel6: TPanel;
    Label4: TLabel;
    edtComplemento: TEdit;
    Panel11: TPanel;
    Panel3: TPanel;
    Panel16: TPanel;
    Label7: TLabel;
    Panel17: TPanel;
    Panel21: TPanel;
    Panel18: TPanel;
    Label8: TLabel;
    Panel19: TPanel;
    Panel15: TPanel;
    pnlCadastroTop: TPanel;
    lblPage: TLabel;
    edtUf: TEdit;
    edtCidade: TEdit;
    pnlPrincipal: TPanel;
    procedure bntCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FTypeOperacao : TTypeOperacao;
    FIdPessoa : String;
    FIdEndereco : String;
    FControllerEndereco : iControllerEndereco;
    procedure AplicarEstilo;
    procedure LimparCampos;
    procedure PreencherCampos;
  public
    { Public declarations }
    procedure AlterarEndereco(idEndereco: String);
    procedure IncluirEndereco(idPessoa : String);
  end;

var
  frmPessoaEndereco: TfrmPessoaEndereco;

implementation

uses
  crud_mvc.controller.endereco,
  crud_mvc.utilitarios, crud_mvc.view.style;

{$R *.dfm}

{ TForm1 }

procedure TfrmPessoaEndereco.AlterarEndereco(idEndereco: String);
begin
  LblPage.Caption := 'Alterar Endereco';
  FIdEndereco := idEndereco;
  FTypeOperacao := toAlterar;
  PreencherCampos;
  ShowModal;
end;

procedure TfrmPessoaEndereco.AplicarEstilo;
begin
  self.Color := COR_FUNDO;
  pnlCadastroTop.Color := COR_TOPO_CADASTRO;
  pnlPrincipal.Color := COR_FUNDO;
end;

procedure TfrmPessoaEndereco.bntCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPessoaEndereco.btnSalvarClick(Sender: TObject);
begin
  FControllerEndereco.Endereco.ID := FIdEndereco;
  FControllerEndereco.Endereco.PessoaID := FIDPessoa;
  FControllerEndereco.Endereco.Cep := edtCep.Text;
  FControllerEndereco.Endereco.Logradouro := edtLogradouro.Text;
  FControllerEndereco.Endereco.Complemento := edtComplemento.Text;
  FControllerEndereco.Endereco.Bairro := edtBairro.Text;
  FControllerEndereco.Endereco.Cidade := edtCidade.Text;
  FControllerEndereco.endereco.Uf := edtUf.Text;

  case FTypeOperacao of
  toIncluir:
    FControllerEndereco.DAO.Inserir;
  toAlterar:
    FControllerEndereco.DAO.Atualizar;
  end;
  Close;
end;

procedure TfrmPessoaEndereco.FormCreate(Sender: TObject);
begin
  AplicarEstilo;
  FControllerEndereco := TControllerEndereco.New;
end;

procedure TfrmPessoaEndereco.IncluirEndereco(idPessoa: String);
begin
  LblPage.Caption := 'Incluir Endereco';
  FTypeOperacao := toIncluir;
  FIdPessoa := idPessoa;
  LimparCampos;
  ShowModal;
end;

procedure TfrmPessoaEndereco.LimparCampos;
begin
  TUtilitarios.LimparCampos(pnlDados);
end;

procedure TfrmPessoaEndereco.PreencherCampos;
begin
  FControllerEndereco.DAO.ListarPorId(FIdEndereco);
  FIDPessoa := FControllerEndereco.endereco.PessoaId;
  edtCep.Text := FControllerEndereco.endereco.Cep;
  edtLogradouro.Text := FControllerEndereco.endereco.Logradouro;
  edtComplemento.Text := FControllerEndereco.endereco.Complemento;
  edtBairro.Text := FControllerEndereco.endereco.Bairro;
  edtCidade.Text := FControllerEndereco.endereco.Cidade;
  edtUf.Text := FControllerEndereco.endereco.Uf;
end;

end.
