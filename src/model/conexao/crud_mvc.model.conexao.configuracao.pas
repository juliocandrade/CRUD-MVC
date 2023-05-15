unit crud_mvc.model.conexao.configuracao;

interface

uses
  crud_mvc.model.conexao.interfaces;

type
  TConexaoConfiguracao = class(TInterfacedObject, iConexaoConfiguracao)
  private
    const SECAOBANCO = 'Banco de dados';
    function GetConfiguracao(Secao, Parametro, valorPadrao : String) : String;
    procedure SetConfiguracao(Secao, Parametro, Valor : String);
    procedure CriarArquivoIni;
  public
    constructor Create;
    class function New : iConexaoConfiguracao;

    procedure DriverID(aValue : String); overload;
    function DriverID : String; overload;
    procedure Database(aValue : String); overload;
    function Database : String; overload;
    procedure UserName(aValue : String); overload;
    function UserName : String; overload;
    procedure Password(aValue : String); overload;
    function Password : String; overload;
    procedure Protocol(aValue : String); overload;
    function Protocol : String; overload;
    procedure Server(aValue : String); overload;
    function Server : String; overload;
    procedure Port(aValue : String); overload;
    function Port : String; overload;
  end;
implementation

uses
  System.IniFiles, System.SysUtils, Vcl.Forms;

{ TConexaoConfiguracao }

procedure TConexaoConfiguracao.Database(aValue: String);
begin
  SetConfiguracao(SECAOBANCO, 'Database', aValue);
end;

constructor TConexaoConfiguracao.Create;
begin
  if not FileExists(ChangeFileExt(Application.ExeName, '.ini')) then
    CriarArquivoIni;
end;

procedure TConexaoConfiguracao.CriarArquivoIni;
begin
  DriverID('FB');
  Database('D:\projetos\Delphi\CRUD-MVC\database\dados.fdb');
  UserName('sysdba');
  Password('masterkey');
  Protocol('TCPIP');
  Server('localhost');
  Port('3050');
end;

function TConexaoConfiguracao.Database: String;
begin
  Result := GetConfiguracao(SECAOBANCO, 'Database', 'D:\projetos\Delphi\CRUD-MVC\database\dados.fdb');
end;

procedure TConexaoConfiguracao.DriverID(aValue: String);
begin
  SetConfiguracao(SECAOBANCO, 'DriverID', aValue);
end;

function TConexaoConfiguracao.DriverID: String;
begin
  Result := GetConfiguracao(SECAOBANCO, 'DriverID', 'FB');
end;

function TConexaoConfiguracao.GetConfiguracao(Secao, Parametro,
  valorPadrao: String): String;
var
  LArquivoConfig : TIniFile;
begin
  LArquivoConfig := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    Result := LArquivoConfig.ReadString(Secao, Parametro, ValorPadrao);
  finally
    LArquivoConfig.UpdateFile;
    LArquivoConfig.Free;
  end;
end;

class function TConexaoConfiguracao.New: iConexaoConfiguracao;
begin
  Result := Self.Create;
end;

function TConexaoConfiguracao.Password: String;
begin
  Result := GetConfiguracao(SECAOBANCO, 'Password', 'masterkey');
end;

procedure TConexaoConfiguracao.Password(aValue: String);
begin
  SetConfiguracao(SECAOBANCO, 'Password', aValue);
end;

procedure TConexaoConfiguracao.Port(aValue: String);
begin
  SetConfiguracao(SECAOBANCO, 'Port', aValue);
end;

function TConexaoConfiguracao.Port: String;
begin
  Result := GetConfiguracao(SECAOBANCO, 'Port', '3050');
end;

procedure TConexaoConfiguracao.Protocol(aValue: String);
begin
  SetConfiguracao(SECAOBANCO, 'Protocol', aValue);
end;

function TConexaoConfiguracao.Protocol: String;
begin
  Result := GetConfiguracao(SECAOBANCO, 'Protocol', 'TCPIP');
end;

function TConexaoConfiguracao.Server: String;
begin
  Result := GetConfiguracao(SECAOBANCO, 'Server', 'localhost');
end;

procedure TConexaoConfiguracao.Server(aValue: String);
begin
  SetConfiguracao(SECAOBANCO, 'Server', aValue);
end;

procedure TConexaoConfiguracao.SetConfiguracao(Secao, Parametro, Valor: String);
var
  LArquivoConfig : TIniFile;
begin
  LArquivoConfig := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    LArquivoConfig.WriteString(Secao, Parametro, Valor);
  finally
    LArquivoConfig.Free;
  end;

end;

procedure TConexaoConfiguracao.UserName(aValue: String);
begin
  SetConfiguracao(SECAOBANCO, 'UserName', aValue);
end;

function TConexaoConfiguracao.UserName: String;
begin
  Result := GetConfiguracao(SECAOBANCO, 'UserName', 'sysdba');
end;

end.
