unit crud_mvc.view.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    pnlPrincipal: TPanel;
    pnlMenu: TPanel;
    btnPessoas: TSpeedButton;
    btnSair: TSpeedButton;
    pnlTop: TPanel;
    lblPage: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure btnPessoasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure AplicarEstilo;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  crud_mvc.view.pessoas, crud_mvc.view.style;

{$R *.dfm}

procedure TForm1.AplicarEstilo;
begin
  self.Color := COR_FUNDO;
  pnlTop.Color := COR_TEMA;
  pnlPrincipal.Color := COR_FUNDO;
  pnlMenu.Color := COR_FUNDO_MENU;
end;

procedure TForm1.btnPessoasClick(Sender: TObject);
begin
  frmPessoas.Show;
end;

procedure TForm1.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  AplicarEstilo;
end;

end.
