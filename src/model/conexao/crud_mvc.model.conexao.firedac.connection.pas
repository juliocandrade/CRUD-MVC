unit crud_mvc.model.conexao.firedac.connection;

interface
uses
  crud_mvc.model.conexao.interfaces,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  Data.DB,
  FireDAC.Comp.Client;

type
  TConexaoFiredac = class(TinterfacedObject, iConexao)
  private
    FConexao : TFDConnection;
    procedure ConfigurarConexao(aConfiguracao : iConexaoConfiguracao);
    procedure ConfigurarConexaoSQLite(aConfiguracao : iConexaoConfiguracao);
    procedure ConfigurarConexaoFirebird(aConfiguracao : iConexaoConfiguracao);
  public
    Constructor Create(aConfiguracao : iConexaoConfiguracao);
    destructor Destroy; override;
    class function New(aConfiguracao : iConexaoConfiguracao) : iConexao;

    function Connect : TCustomConnection;
    procedure Disconnect;
  end;
implementation
uses
  System.SysUtils;

{ TConexaoFiredac }

procedure TConexaoFiredac.ConfigurarConexao(aConfiguracao : iConexaoConfiguracao);
begin
  FConexao.FetchOptions.Mode := fmAll;
  if aConfiguracao.DriverID = 'FB' then
    ConfigurarConexaoFirebird(aConfiguracao)
  else if aConfiguracao.DriverID = 'SQLite' then
    ConfigurarConexaoSQLite(aConfiguracao)
  else
    raise Exception.Create('Banco de dados não suportado');
end;

procedure TConexaoFiredac.ConfigurarConexaoFirebird(
  aConfiguracao: iConexaoConfiguracao);
begin
  FConexao.Params.DriverID := aConfiguracao.DriverID;
  FConexao.Params.Database := aConfiguracao.Database;
  FConexao.Params.UserName := aConfiguracao.UserName;
  FConexao.Params.Password := aConfiguracao.Password;
  FConexao.Params.Add(Format('Protocol=%s', [aConfiguracao.Protocol]));
  FConexao.Params.Add(Format('Server=%s', [aConfiguracao.Server]));
  FConexao.Params.Add(Format('Port=%s', [aConfiguracao.Port]));
end;

procedure TConexaoFiredac.ConfigurarConexaoSQLite(
  aConfiguracao: iConexaoConfiguracao);
begin
  FConexao.Params.DriverID := aConfiguracao.DriverID;
  FConexao.Params.Database := aConfiguracao.Database;
  FConexao.Params.Add('LockingMode=Normal');
end;

function TConexaoFiredac.Connect: TCustomConnection;
begin
  try
    FConexao.Connected := true;
    Result := FConexao;
  except
    raise Exception.Create('Não foi possível realizar a conexão');
  end;
end;

Constructor TConexaoFiredac.Create(aConfiguracao : iConexaoConfiguracao);
begin
  FConexao := TFDConnection.Create(nil);
  ConfigurarConexao(aConfiguracao);
end;

destructor TConexaoFiredac.Destroy;
begin
  FConexao.Connected := false;
  FreeAndNil(FConexao);
  inherited;
end;

procedure TConexaoFiredac.Disconnect;
begin
  FConexao.Connected := false;
end;

class function TConexaoFiredac.New(aConfiguracao : iConexaoConfiguracao) : iConexao;
begin
  Result := Self.Create(aConfiguracao);
end;

end.
