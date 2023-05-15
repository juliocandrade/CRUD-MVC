unit crud_mvc.dao.pessoa;

interface

uses
  crud_mvc.dao.interfaces,
  crud_mvc.model.conexao.interfaces,
  crud_mvc.model.entidades.pessoa,
  Data.DB;
type
  TDAOPessoa = class(TInterfacedObject, iDAOPessoa)
  private
    FPessoa : TModelPessoa;
    FQuery : iQuery;
    procedure DatasetToEntity;
    function GerarID : String;
  public
    constructor Create(aEntity : TModelPessoa);
    class function New(aEntity : TModelPessoa) : iDAOPessoa;

    function Listar : iDAOPessoa;overload;
    function Listar(Criterio : String) : iDAOPessoa; overload;
    function ListarPorId(Id : String) : iDAOPessoa;
    function Excluir(Id : String) : iDAOPessoa;
    function Atualizar : iDAOPessoa;
    function Inserir : iDAOPessoa;
    function DataSource(DataSource : TDataSource) : iDAOPessoa;
    function IsEmpty : Boolean;
  end;
implementation

uses
  System.SysUtils, crud_mvc.model.conexao.factory, crud_mvc.utilitarios;

{ TDAOPessoa }

function TDAOPessoa.Atualizar: iDAOPessoa;
begin
  Result := Self;
  try
    FQuery.sql.Clear;
    FQuery.SQL.Add('UPDATE pessoas SET nome = :nome, documento = :documento, email = :email, telefone = :telefone WHERE id = :id');
    FQuery.Params('nome', FPessoa.Nome);
    FQuery.Params('documento', FPessoa.Documento);
    FQuery.Params('email', FPessoa.Email);
    FQuery.Params('telefone', FPessoa.Telefone);
    FQuery.Params('id', FPessoa.id);
    FQuery.ExecSQL;
  except on e:Exception do
    raise Exception.Create(Format('Erro ao tentar atualizar o registro: %s', [e.Message]));
  end;
end;

constructor TDAOPessoa.Create(aEntity: TModelPessoa);
begin
  FQuery := TConexaoFactory.GetInstance.Query;
  FPessoa := aEntity;
end;

procedure TDAOPessoa.DatasetToEntity;
begin
  if not Assigned(FPessoa) then
    exit;

  FPessoa.Id := FQuery.DataSet.FieldByName('id').AsString;
  FPessoa.Nome := FQuery.DataSet.FieldByName('nome').AsString;
  FPessoa.Documento := FQuery.DataSet.FieldByName('documento').AsString;
  FPessoa.Email := FQuery.DataSet.FieldByName('email').AsString;
  FPessoa.Telefone := FQuery.DataSet.FieldByName('telefone').AsString;
  FPessoa.CreatedAt := FQuery.DataSet.FieldByName('created_at').AsDateTime;
end;

function TDAOPessoa.DataSource(DataSource: TDataSource): iDAOPessoa;
begin
  Result := Self;
  datasource.DataSet := FQuery.DataSet;
end;

function TDAOPessoa.Excluir(Id: String): iDAOPessoa;
begin
  Result := Self;
  try
    FQuery.sql.Clear;
    FQuery.SQL.Add('DELETE FROM pessoas WHERE id = :id');
    FQuery.Params('id', Id);
    FQuery.ExecSQL;
  except on e:Exception do
    raise Exception.Create(Format('Erro ao tentar excluir o registro: %s', [e.Message]));
  end;
end;

function TDAOPessoa.GerarID: String;
begin
  Result := TUtilitarios.GerarID;
end;

function TDAOPessoa.Inserir: iDAOPessoa;
begin
  Result := Self;
  try
    FPessoa.Id := GerarID;

    FQuery.sql.Clear;
    FQuery.SQL.Add('INSERT INTO pessoas (id, nome, documento, email, telefone) VALUES (:id, :nome, :documento, :email, :telefone)');
    FQuery.Params('nome', FPessoa.nome);
    FQuery.Params('documento', FPessoa.Documento);
    FQuery.Params('email', FPessoa.Email);
    FQuery.Params('telefone', FPessoa.Telefone);
    FQuery.Params('id', FPessoa.Id);
    FQuery.ExecSQL;
  except on e:Exception do
    raise Exception.Create(Format('Erro ao tentar inserir o registro: %s', [e.Message]));
  end;
end;

function TDAOPessoa.IsEmpty: Boolean;
begin
  Result := FQuery.DataSet.IsEmpty;
end;

function TDAOPessoa.Listar: iDAOPessoa;
begin
  Result := Self;
  try
    FQuery.Open('SELECT * FROM pessoas');
  except on e:Exception do
    raise Exception.Create(Format('Erro ao realizar a consulta: %s', [e.Message]));
  end;
end;

function TDAOPessoa.Listar(Criterio: String): iDAOPessoa;
begin
  Result := Self;
  try
    FQuery.Open(Format('SELECT * FROM pessoas WHERE 1 = 1%S',[Criterio]));
  except on e:Exception do
    raise Exception.Create(Format('Erro ao realizar a consulta: %s', [e.Message]));
  end;
end;

function TDAOPessoa.ListarPorId(Id: String): iDAOPessoa;
begin
  Result := Self;
  try
    FQuery.sql.Clear;
    FQuery.SQL.Add('SELECT * FROM pessoas WHERE id = :id');
    FQuery.Params('id', Id);
    FQuery.Open;
    DatasetToEntity;
  except on e:Exception do
    raise Exception.Create(Format('Erro ao realizar a consulta: %s', [e.Message]));
  end;
end;

class function TDAOPessoa.New(aEntity: TModelPessoa): iDAOPessoa;
begin
  Result := Self.Create(aEntity);
end;

end.
