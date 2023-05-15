unit crud_mvc.utilitarios;

interface

uses
  Vcl.Controls, Vcl.DBGrids;
type
  TUtilitarios = class
    class function AdjustGuid(Value : String) : String;
    class function GerarID : String;
    class procedure LimparCampos(Value : TWinControl);
    class function LikeFind(Pesquisa : String; Grid : TDBGrid; TableName : string = '') : String;
  end;

implementation

uses
  System.SysUtils, Vcl.ExtCtrls, Vcl.StdCtrls;

{ TUtilitarios }

class function TUtilitarios.AdjustGuid(Value: String): String;
begin
  Result := StringReplace(Value, '{', '', [rfReplaceAll]);
  Result := StringReplace(Result, '}', '', [rfReplaceAll]);
end;

class function TUtilitarios.GerarID: String;
begin
  Result := AdjustGuid(TGUID.NewGuid.ToString);
end;

class function TUtilitarios.LikeFind(Pesquisa: String; Grid: TDBGrid;
  TableName: string): String;
var
  LContador : Integer;
begin
  Result := '';
  if Pesquisa.Trim.IsEmpty then
    exit;
  if not TableName.IsEmpty then
    TableName := TableName + '.';
  for LContador := 0 to Pred(Grid.Columns.Count) do
    Result := Result + TableName + Grid.Columns.Items[LContador].FieldName +
      ' LIKE ' + QuotedStr('%' + Trim(Pesquisa) + '%') + ' OR ';
  Result := ' AND (' + Copy(Result, 1, Length(Result) - 4) + ')';
end;

class procedure TUtilitarios.LimparCampos(Value: TWinControl);
var
  Contador : Integer;
begin
  for Contador := 0 to Pred(Value.ControlCount) do
  begin
    if Value.Controls[Contador].InheritsFrom(TCustomPanel) then
      LimparCampos(TCustomPanel(Value.Controls[Contador]))
    else if Value.Controls[Contador] is TCustomEdit then
      TCustomEdit(Value.Controls[Contador]).Clear
    else if Value.Controls[Contador] is TCustomComboBox then
      TCustomComboBox(Value.Controls[Contador]).ItemIndex := -1
  end;
end;

end.
