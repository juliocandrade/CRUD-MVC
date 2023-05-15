unit crud_mvc.controller.interfaces;

interface

uses
  crud_mvc.model.entidades.pessoa,
  crud_mvc.dao.interfaces;
type
  iControllerPessoa = interface
    ['{EC503F57-4967-4251-866F-B33469E1F809}']
    function Pessoa : TModelPessoa;
    function DAO : iDAOPessoa;
  end;
implementation

end.
