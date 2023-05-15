unit crud_mvc.dao.interfaces;

interface

uses
  Data.DB;
type
  iDAOPessoa = interface
    ['{FBDD6C82-EF3D-48FB-A815-2850412BD945}']
    function Listar : iDAOPessoa; overload;
    function Listar(Criterio : String) : iDAOPessoa; overload;
    function ListarPorId(Id : String) : iDAOPessoa;
    function Excluir(Id : String) : iDAOPessoa;
    function Atualizar : iDAOPessoa;
    function Inserir : iDAOPessoa;
    function DataSource(DataSource : TDataSource) : iDAOPessoa;
    function IsEmpty : Boolean;
  end;
  iDAOEndereco = interface
    ['{535BE91B-0341-4564-84AD-E2E5D209ECBC}']
    function Listar(IdPessoa : String) : iDAOEndereco;
    function ListarPorId(Id : String) : iDAOEndereco;
    function Excluir(Id : String) : iDAOEndereco;
    function Atualizar : iDAOEndereco;
    function Inserir : iDAOEndereco;
    function DataSource(DataSource : TDataSource) : iDAOEndereco;
    function IsEmpty : Boolean;
  end;
implementation

end.
