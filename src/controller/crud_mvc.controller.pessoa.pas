unit crud_mvc.controller.pessoa;

interface
uses
  crud_mvc.controller.interfaces,
  crud_mvc.model.dao.interfaces,
  crud_mvc.model.entidades.pessoa;
type
  TControllerPessoa = class(TInterfacedObject, iControllerPessoa)
  private
    FPessoa : TModelPessoa;
    FDAOPessoa : iDAOPessoa;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerPessoa;
    function Pessoa : TModelPessoa;
    function DAO : iDAOPessoa;
  end;
implementation

uses
  crud_mvc.model.dao.pessoa;

{ TControllerPessoa }

constructor TControllerPessoa.Create;
begin
  FPessoa := TModelPessoa.Create;
  FDAOPessoa := TDAOPessoa.New(FPessoa);
end;

function TControllerPessoa.DAO: iDAOPessoa;
begin
  Result := FDAOPessoa;
end;

destructor TControllerPessoa.Destroy;
begin
  FPessoa.Free;
  inherited;
end;

class function TControllerPessoa.New: iControllerPessoa;
begin
  Result := Self.Create;
end;

function TControllerPessoa.Pessoa: TModelPessoa;
begin
  Result := FPessoa;
end;

end.
