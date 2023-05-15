unit crud_mvc.view.configuracoes;

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
  crud_mvc.model.conexao.factory;

type
  TfrmConfiguracoes = class(TForm)
    pnlPrincipal: TPanel;
    StackPanel2: TStackPanel;
    Label5: TLabel;
    edtDatabase: TEdit;
    Label2: TLabel;
    edtUsername: TEdit;
    pnlCadastroBotoes: TPanel;
    bntCancelar: TButton;
    btnSalvar: TButton;
    pnlCadastroTop: TPanel;
    lblPage: TLabel;
    cbBanco: TComboBox;
    Label1: TLabel;
    Label3: TLabel;
    edtServer: TEdit;
    Label4: TLabel;
    edtPort: TEdit;
    Label6: TLabel;
    edtPassword: TEdit;
    Label7: TLabel;
    edtProtocol: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bntCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AplicarEstilo;
  public
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

uses
  crud_mvc.view.style;

{$R *.dfm}

procedure TfrmConfiguracoes.AplicarEstilo;
begin
  self.Color := COR_FUNDO;
  pnlCadastroTop.Color := COR_TOPO_CADASTRO;
  pnlPrincipal.Color := COR_FUNDO;
end;

procedure TfrmConfiguracoes.bntCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfiguracoes.btnSalvarClick(Sender: TObject);
begin
  TConexaoFactory.GetInstance.Configuracao.DriverID(cbBanco.Text);
  TConexaoFactory.GetInstance.Configuracao.Protocol(edtProtocol.Text);
  TConexaoFactory.GetInstance.Configuracao.Server(edtServer.Text);
  TConexaoFactory.GetInstance.Configuracao.Port(edtPort.Text);
  TConexaoFactory.GetInstance.Configuracao.Database(edtDatabase.Text);
  TConexaoFactory.GetInstance.Configuracao.UserName(edtUsername.Text);
  TConexaoFactory.GetInstance.Configuracao.Password(edtPassword.Text);
  Application.MessageBox('É necessário fechar a aplicação para que as alterações sejam aplicadas', 'Salvar', MB_OK + MB_ICONINFORMATION);
  Application.Terminate;
end;

procedure TfrmConfiguracoes.FormCreate(Sender: TObject);
begin
  AplicarEstilo;
end;

procedure TfrmConfiguracoes.FormShow(Sender: TObject);
begin
  cbBanco.ItemIndex := cbBanco.Items.IndexOf(TConexaoFactory.GetInstance.Configuracao.DriverID);
  edtProtocol.Text := TConexaoFactory.GetInstance.Configuracao.Protocol;
  edtServer.Text := TConexaoFactory.GetInstance.Configuracao.Server;
  edtPort.Text := TConexaoFactory.GetInstance.Configuracao.Port;
  edtDatabase.Text := TConexaoFactory.GetInstance.Configuracao.Database;
  edtUsername.Text := TConexaoFactory.GetInstance.Configuracao.UserName;
  edtPassword.Text := TConexaoFactory.GetInstance.Configuracao.Password;
end;

end.
