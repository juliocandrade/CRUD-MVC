unit crud_mvc.model.conexao.factory;

interface

uses
  crud_mvc.model.conexao.interfaces;

type
  TConexaoFactory = class
  private
    FConexao : iConexao;
    FConfiguracao : iConexaoConfiguracao;
    constructor Create;
  public
    class function GetInstance : TConexaoFactory;

    function Query : iQuery; overload;
    function Configuracao : iConexaoConfiguracao;
  end;

var
  aConexaoFactory : TConexaoFactory;

implementation

uses
  crud_mvc.model.conexao.firedac.connection,
  crud_mvc.model.conexao.firedac.query,
  crud_mvc.model.conexao.configuracao;

{ TConexaoFactory }

function TConexaoFactory.Configuracao: iConexaoConfiguracao;
begin
  Result := FConfiguracao;
end;

constructor TConexaoFactory.Create;
begin
  FConfiguracao := TConexaoConfiguracao.New;
  FConexao := TConexaoFiredac.New(FConfiguracao);
end;

class function TConexaoFactory.GetInstance: TConexaoFactory;
begin
  if not Assigned(aConexaoFactory)  then
    aConexaoFactory := TConexaoFactory.Create;
  Result := aConexaoFactory;
end;

function TConexaoFactory.Query: iQuery;
begin
  Result := TQueryFiredac.New(FConexao);
end;

initialization
  aConexaoFactory := nil;

finalization
  if Assigned(aConexaoFactory) then
    aConexaoFactory.Free;
end.
