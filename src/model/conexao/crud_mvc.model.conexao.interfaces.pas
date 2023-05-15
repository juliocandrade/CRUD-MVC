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

  iConexaoConfiguracao = interface
    ['{EA226348-25A6-4F43-BC45-664B6E50E576}']
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


end.
