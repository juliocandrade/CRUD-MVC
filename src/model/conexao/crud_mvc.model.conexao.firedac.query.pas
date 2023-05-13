unit crud_mvc.model.conexao.firedac.query;

interface
uses
  crud_mvc.model.conexao.interfaces,
  FireDAC.Comp.Client,
  System.Classes,
  Data.DB,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet;
type
  TQueryFiredac = class(TInterfacedObject, iQuery)
  private
    FQuery : TFDQuery;
    FParams : TParams;
  public
    constructor Create(aConexao : iConexao);
    destructor Destroy; override;
    class function New(aConexao : iConexao) : iQuery;
    function SQL : TStrings;
    function Params (Param : String; Value : Variant) : iQuery;
    function ExecSQL : iQuery;
    function DataSet : TDataSet;
    function Open(aSQL : String) : iQuery; overload;
    function Open : iQuery; overload;
  end;

implementation

uses
  System.SysUtils;

{ TQueryFiredac }

constructor TQueryFiredac.Create(aConexao: iConexao);
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := TFDConnection(aConexao.Connect);
end;

function TQueryFiredac.DataSet: TDataSet;
begin
  Result := TDataSet(FQuery);
end;

destructor TQueryFiredac.Destroy;
begin
  FreeAndNil(FQuery);
  if Assigned(FParams) then
    FreeAndNil(FParams);
  inherited;
end;

function TQueryFiredac.ExecSQL: iQuery;
begin
  Result := Self;
  if Assigned(FParams) then
    FQuery.Params.assign(FParams);
  FQuery.OptionsIntf.FormatOptions.StrsEmpty2Null := true;
  FQuery.Prepare;
  FQuery.ExecSQL;
  if Assigned(FParams) then
    FreeAndNil(FParams);
end;

class function TQueryFiredac.New(aConexao: iConexao): iQuery;
begin
  Result := Self.Create(aConexao);
end;

function TQueryFiredac.Open(aSQL: String): iQuery;
begin
  FQuery.Connection;
  Result := Self;
  FQuery.Close;
  FQuery.Open(aSQL);
end;

function TQueryFiredac.Open: iQuery;
begin
  Result := Self;
  FQuery.Close;
  FQuery.Prepare;
  FQuery.Open;
end;

function TQueryFiredac.Params(Param: String; Value: Variant): iQuery;
begin
  Result := Self;
  FQuery.ParamByName(Param).Value := Value;
end;

function TQueryFiredac.SQL: TStrings;
begin
  Result := FQuery.SQL;
end;

end.
