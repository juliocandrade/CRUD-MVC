unit crud_mvc.controller.endereco;

interface

uses
  crud_mvc.controller.interfaces,
  crud_mvc.model.entidades.endereco,
  crud_mvc.model.dao.interfaces;

type
  TControllerEndereco = class(TInterfacedObject, iControllerEndereco)
  private
    FEndereco : TModelEndereco;
    FDAOEndereco : iDAOEndereco;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerEndereco;
    function Endereco : TModelEndereco;
    function DAO : iDAOEndereco;
  end;
implementation

uses
  crud_mvc.model.dao.endereco;

{ TControllerEndereco }

constructor TControllerEndereco.Create;
begin
  FEndereco := TModelEndereco.Create;
  FDAOEndereco := TDAOEndereco.New(FEndereco);
end;

function TControllerEndereco.DAO: iDAOEndereco;
begin
  Result := FDAOEndereco;
end;

destructor TControllerEndereco.Destroy;
begin
  FEndereco.Free;
  inherited;
end;

class function TControllerEndereco.New: iControllerEndereco;
begin
  Result := Self.Create;
end;

function TControllerEndereco.Endereco: TModelEndereco;
begin
  Result := FEndereco;
end;
end.
