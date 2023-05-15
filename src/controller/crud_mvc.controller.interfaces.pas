unit crud_mvc.controller.interfaces;

interface

uses
  crud_mvc.model.entidades.pessoa,
  crud_mvc.model.dao.interfaces,
  crud_mvc.model.entidades.endereco;
type
  iControllerPessoa = interface
    ['{EC503F57-4967-4251-866F-B33469E1F809}']
    function Pessoa : TModelPessoa;
    function DAO : iDAOPessoa;
  end;

  iControllerEndereco = interface
    ['{A3DF219C-257E-4217-B537-48AC8D222C3D}']
    function endereco : TModelEndereco;
    function DAO : iDAOEndereco;
  end;
implementation

end.
