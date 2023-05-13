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
    procedure ConfigurarConexao;
  public
    Constructor Create;
    destructor Destroy; override;
    class function New : iConexao;

    function Connect : TCustomConnection;
    procedure Disconnect;
  end;
implementation
uses
  System.SysUtils;

{ TConexaoFiredac }

procedure TConexaoFiredac.ConfigurarConexao;
begin
  FConexao.FetchOptions.Mode := fmAll;
  FConexao.Params.DriverID := 'SQLite';
  FConexao.Params.Database := '..\..\database\dados.db';
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

constructor TConexaoFiredac.Create;
begin
  FConexao := TFDConnection.Create(nil);
  ConfigurarConexao;
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

class function TConexaoFiredac.New: iConexao;
begin
  Result := Self.Create;
end;

end.
