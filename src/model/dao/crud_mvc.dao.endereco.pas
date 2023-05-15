unit crud_mvc.dao.endereco;

interface

uses
  crud_mvc.dao.interfaces,
  crud_mvc.model.conexao.interfaces,
  crud_mvc.model.entidades.endereco, Data.DB;
type
  TDAOEndereco = class(TInterfacedObject, iDAOEndereco)
  private
    FEndereco : TModelEndereco;
    FQuery : iQuery;
    procedure DatasetToEntity;
    function GerarID : String;
  public
    constructor Create(aEntity : TModelEndereco);
    class function New(aEntity : TModelEndereco) : iDAOEndereco;

    function Listar(IdPessoa : String) : iDAOEndereco;
    function ListarPorId(Id : String) : iDAOEndereco;
    function Excluir(Id : String) : iDAOEndereco;
    function Atualizar : iDAOEndereco;
    function Inserir : iDAOEndereco;
    function DataSource(DataSource : TDataSource) : iDAOEndereco;
    function IsEmpty : Boolean;
  end;
implementation

uses
  System.SysUtils, crud_mvc.model.conexao.factory, crud_mvc.utilitarios;

{ TDAOEndereco }

function TDAOEndereco.Atualizar: iDAOEndereco;
begin
  Result := Self;
  try
    FQuery.sql.Clear;
    FQuery.SQL.Add('UPDATE enderecos SET cep = :cep, logradouro = :logradouro, complemento = :complemento, bairro = :bairro ,cidade = :cidade, uf = :uf WHERE id = :id');
    FQuery.Params('cep', FEndereco.Cep);
    FQuery.Params('logradouro', FEndereco.Logradouro);
    FQuery.Params('complemento', FEndereco.Complemento);
    FQuery.Params('cidade', FEndereco.Cidade);
    FQuery.Params('bairro', FEndereco.Bairro);
    FQuery.Params('uf', FEndereco.Uf);
    FQuery.Params('id', FEndereco.id);
    FQuery.ExecSQL;
  except on e:Exception do
    raise Exception.Create(Format('Erro ao tentar atualizar o registro: %s', [e.Message]));
  end;
end;

constructor TDAOEndereco.Create(aEntity: TModelEndereco);
begin
  FQuery := TConexaoFactory.GetInstance.Query;
  FEndereco := aEntity;
end;

procedure TDAOEndereco.DatasetToEntity;
begin
  if not Assigned(FEndereco) then
    exit;

  FEndereco.Id := FQuery.DataSet.FieldByName('id').AsString;
  FEndereco.PessoaId := FQuery.DataSet.FieldByName('pessoa_id').AsString;
  FEndereco.Cep := FQuery.DataSet.FieldByName('cep').AsString;
  FEndereco.Logradouro := FQuery.DataSet.FieldByName('logradouro').AsString;
  FEndereco.Complemento := FQuery.DataSet.FieldByName('complemento').AsString;
  FEndereco.Cidade := FQuery.DataSet.FieldByName('cidade').AsString;
  FEndereco.Uf := FQuery.DataSet.FieldByName('uf').AsString;
  FEndereco.Bairro := FQuery.DataSet.FieldByName('bairro').AsString;
  FEndereco.CreatedAt := FQuery.DataSet.FieldByName('created_at').AsDateTime;
end;

function TDAOEndereco.DataSource(DataSource: TDataSource): iDAOEndereco;
begin
  Result := Self;
  datasource.DataSet := FQuery.DataSet;
end;

function TDAOEndereco.Excluir(Id: String): iDAOEndereco;
begin
  Result := Self;
  try
    FQuery.sql.Clear;
    FQuery.SQL.Add('DELETE FROM enderecos WHERE id = :id');
    FQuery.Params('id', Id);
    FQuery.ExecSQL;
  except on e:Exception do
    raise Exception.Create(Format('Erro ao tentar excluir o registro: %s', [e.Message]));
  end;
end;

function TDAOEndereco.GerarID: String;
begin
  Result := TUtilitarios.GerarID;
end;

function TDAOEndereco.Inserir: iDAOEndereco;
begin
  Result := Self;
  try
    FEndereco.Id := GerarID;

    FQuery.sql.Clear;
    FQuery.SQL.Add('INSERT INTO enderecos (id, pessoa_id, cep, logradouro, complemento, bairro, cidade, uf) VALUES (:id, :pessoa_id, :cep, :logradouro, :complemento, :bairro, :cidade, :uf)');
    FQuery.Params('id', FEndereco.Id);
    FQuery.Params('pessoa_id', FEndereco.PessoaId);
    FQuery.Params('cep', FEndereco.Cep);
    FQuery.Params('logradouro', FEndereco.Logradouro);
    FQuery.Params('complemento', FEndereco.Complemento);
    FQuery.Params('bairro', FEndereco.Bairro);
    FQuery.Params('cidade', FEndereco.Cidade);
    FQuery.Params('uf', FEndereco.Uf);
    FQuery.ExecSQL;
  except on e:Exception do
    raise Exception.Create(Format('Erro ao tentar atualizar o registro: %s', [e.Message]));
  end;
end;

function TDAOEndereco.IsEmpty: Boolean;
begin
  Result := FQuery.DataSet.IsEmpty;
end;

function TDAOEndereco.Listar(IdPessoa : String) : iDAOEndereco;
begin
  Result := Self;
  try
    FQuery.sql.Clear;
    FQuery.SQL.Add('SELECT * FROM enderecos WHERE pessoa_id = :id');
    FQuery.Params('id', IdPessoa);
    FQuery.Open;
  except on e:Exception do
    raise Exception.Create(Format('Erro ao realizar a consulta: %s', [e.Message]));
  end;
end;

function TDAOEndereco.ListarPorId(Id: String): iDAOEndereco;
begin
  Result := Self;
  try
    FQuery.sql.Clear;
    FQuery.SQL.Add('SELECT * FROM enderecos WHERE id = :id');
    FQuery.Params('id', Id);
    FQuery.Open;
    DatasetToEntity;
  except on e:Exception do
    raise Exception.Create(Format('Erro ao realizar a consulta: %s', [e.Message]));
  end;
end;

class function TDAOEndereco.New(aEntity: TModelEndereco): iDAOEndereco;
begin
  Result := Self.Create(aEntity);
end;

end.
