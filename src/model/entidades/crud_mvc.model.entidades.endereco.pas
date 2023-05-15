unit crud_mvc.model.entidades.endereco;

interface
uses
  crud_mvc.utilitarios.validators.attributes;

type
  TModelEndereco = class
  private
    FLogradouro: String;
    FBairro: String;
    FCep: String;
    FId: String;
    FPessoaId: String;
    FCreatedAt: TDateTime;
    FComplemento: String;
    FCidade: String;
    FUf: String;
    procedure SetBairro(const Value: String);
    procedure SetCep(const Value: String);
    procedure SetCidade(const Value: String);
    procedure SetComplemento(const Value: String);
    procedure SetCreatedAt(const Value: TDateTime);
    procedure SetId(const Value: String);
    procedure SetLogradouro(const Value: String);
    procedure SetPessoaId(const Value: String);
    procedure SetUf(const Value: String);
  public
    [RequiredValidation('AttributesValidation', 'ID não preenchido')]
    [MaxLengthValidation('AttributesValidation', 'ID excedeu o tamanho máximo permitido (36)', 36)]
    property Id : String read FId write SetId;
    [RequiredValidation('AttributesValidation', 'ID da pessoa não preenchido')]
    [MaxLengthValidation('AttributesValidation', 'ID da pessoa excedeu o tamanho máximo permitido (36)', 36)]
    property PessoaId : String read FPessoaId write SetPessoaId;
    [RequiredValidation('AttributesValidation', 'Bairro não preenchido')]
    [MaxLengthValidation('AttributesValidation', 'Bairro excedeu o tamanho máximo permitido (50)', 50)]
    property Bairro : String read FBairro write SetBairro;
    [RequiredValidation('AttributesValidation', 'CEP não preenchido')]
    [MaxLengthValidation('AttributesValidation', 'CEP excedeu o tamanho máximo permitido (8)', 8)]
    property Cep : String read FCep write SetCep;
    [RequiredValidation('AttributesValidation', 'Logradouro não preenchido')]
    [MaxLengthValidation('AttributesValidation', 'Logradouro excedeu o tamanho máximo permitido (100)', 100)]
    property Logradouro : String read FLogradouro write SetLogradouro;
    [MaxLengthValidation('AttributesValidation', 'Complemento excedeu o tamanho máximo permitido (50)', 50)]
    property Complemento : String read FComplemento write SetComplemento;
    [RequiredValidation('AttributesValidation', 'Cidade não preenchido')]
    [MaxLengthValidation('AttributesValidation', 'Cidade excedeu o tamanho máximo permitido (50)', 50)]
    property Cidade : String read FCidade write SetCidade;
    [RequiredValidation('AttributesValidation', 'UF não preenchido')]
    [MaxLengthValidation('AttributesValidation', 'UF excedeu o tamanho máximo permitido (2)', 2)]
    property Uf : String read FUf write SetUf;
    property CreatedAt : TDateTime read FCreatedAt write SetCreatedAt;
  end;

implementation

{ TModelEndereco }

procedure TModelEndereco.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TModelEndereco.SetCep(const Value: String);
begin
  FCep := Value;
end;

procedure TModelEndereco.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TModelEndereco.SetComplemento(const Value: String);
begin
  FComplemento := Value;
end;

procedure TModelEndereco.SetCreatedAt(const Value: TDateTime);
begin
  FCreatedAt := Value;
end;

procedure TModelEndereco.SetId(const Value: String);
begin
  FId := Value;
end;

procedure TModelEndereco.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TModelEndereco.SetPessoaId(const Value: String);
begin
  FPessoaId := Value;
end;

procedure TModelEndereco.SetUf(const Value: String);
begin
  FUf := Value;
end;

end.
