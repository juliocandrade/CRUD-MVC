unit crud_mvc.model.entidades.pessoa;

interface
type
  TModelPessoa = class
  private
    FEmail: String;
    FDocumento: String;
    FId: string;
    FCreatedAt: TDateTime;
    FNome: String;
    FTelefone: String;
    procedure SetCreatedAt(const Value: TDateTime);
    procedure SetDocumento(const Value: String);
    procedure SetEmail(const Value: String);
    procedure SetId(const Value: string);
    procedure SetNome(const Value: String);
    procedure SetTelefone(const Value: String);
  public
    property Id : string read FId write SetId;
    property Nome : String read FNome write SetNome;
    property Documento : String read FDocumento write SetDocumento;
    property Email : String read FEmail write SetEmail;
    property Telefone : String read FTelefone write SetTelefone;
    property CreatedAt : TDateTime read FCreatedAt write SetCreatedAt;
  end;

implementation

{ TModelPessoa }

procedure TModelPessoa.SetCreatedAt(const Value: TDateTime);
begin
  FCreatedAt := Value;
end;

procedure TModelPessoa.SetDocumento(const Value: String);
begin
  FDocumento := Value;
end;

procedure TModelPessoa.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TModelPessoa.SetId(const Value: string);
begin
  FId := Value;
end;

procedure TModelPessoa.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TModelPessoa.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

end.
