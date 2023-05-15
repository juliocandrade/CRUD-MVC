unit crud_mvc.model.entidades.pessoa;

interface
uses
  crud_mvc.utilitarios.validators.attributes;

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
    [RequiredValidation('AttributesValidation', 'ID não preenchido')]
    [MaxLengthValidation('AttributesValidation', 'ID excedeu o tamanho máximo permitido (36)', 36)]
    property Id : string read FId write SetId;
    [RequiredValidation('AttributesValidation', 'Nome não preenchido')]
    [MaxLengthValidation('AttributesValidation', 'Nome excedeu o tamanho máximo permitido (100)', 100)]
    property Nome : String read FNome write SetNome;
    [MaxLengthValidation('AttributesValidation', 'Documento excedeu o tamanho máximo permitido (50)', 50)]
    property Documento : String read FDocumento write SetDocumento;
    [EmailValidationAttribute('AttributesValidation', 'Email inválido')]
    [MaxLengthValidation('AttributesValidation', 'Email excedeu o tamanho máximo permitido (50)', 50)]
    property Email : String read FEmail write SetEmail;
    [RegexValidationAttribute('AttributesValidation', 'Telefone inválido','^(?:(?:\+|00)?(55)\s?)?(?:\(?([1-9][0-9])\)?\s?)?(?:((?:9\d|[2-9])\d{3})\-?(\d{4}))$')]
    [MaxLengthValidation('AttributesValidation', 'Telefone excedeu o tamanho máximo permitido (20)', 20)]
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
