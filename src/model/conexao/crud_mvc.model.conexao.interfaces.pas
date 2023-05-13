unit crud_mvc.model.conexao.interfaces;

interface
uses
  Data.DB,
  System.Classes;
type
  iConexao = interface
    ['{DB069014-7641-47C0-903C-19C1F70E37ED}']
    function Connect : TCustomConnection;
    procedure Disconnect;
  end;

  iQuery = interface
    ['{81CDFB8B-7C76-4FC6-87A7-D9022BD49AFC}']
    function SQL : TStrings;
    function Params (Param : String; Value : Variant) : iQuery;
    function ExecSQL : iQuery;
    function DataSet : TDataSet;
    function Open(aSQL : String) : iQuery; overload;
    function Open : iQuery; overload;
  end;

implementation


end.
