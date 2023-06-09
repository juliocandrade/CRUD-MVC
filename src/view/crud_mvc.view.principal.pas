unit crud_mvc.view.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    pnlPrincipal: TPanel;
    pnlMenu: TPanel;
    btnPessoas: TSpeedButton;
    btnSair: TSpeedButton;
    pnlTop: TPanel;
    lblPage: TLabel;
    btnConfigurações: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnPessoasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfiguraçõesClick(Sender: TObject);
  private
    { Private declarations }
    procedure AplicarEstilo;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  crud_mvc.view.pessoas, crud_mvc.view.style, crud_mvc.view.configuracoes;

{$R *.dfm}

procedure TfrmPrincipal.AplicarEstilo;
begin
  self.Color := COR_FUNDO;
  pnlTop.Color := COR_TEMA;
  pnlPrincipal.Color := COR_FUNDO;
  pnlMenu.Color := COR_FUNDO_MENU;
end;

procedure TfrmPrincipal.btnPessoasClick(Sender: TObject);
begin
  frmPessoas.Show;
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  AplicarEstilo;
end;

procedure TfrmPrincipal.btnConfiguraçõesClick(Sender: TObject);
begin
  frmConfiguracoes.Show
end;

end.
