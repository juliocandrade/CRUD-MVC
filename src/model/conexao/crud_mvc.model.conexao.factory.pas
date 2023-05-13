unit crud_mvc.model.conexao.factory;

interface

uses
  crud_mvc.model.conexao.interfaces;

type
  TConexaoFactory = class
  private
    FConexao : iConexao;
    constructor Create;
  public
    destructor Destroy; override;
    class function GetInstance : TConexaoFactory;
    function Query : iQuery; overload;
  end;

var
  aConexaoFactory : TConexaoFactory;

implementation

uses
  crud_mvc.model.conexao.firedac.connection,
  crud_mvc.model.conexao.firedac.query;

{ TConexaoFactory }

constructor TConexaoFactory.Create;
begin
  FConexao := TConexaoFiredac.New;
end;

destructor TConexaoFactory.Destroy;
begin

  inherited;
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
