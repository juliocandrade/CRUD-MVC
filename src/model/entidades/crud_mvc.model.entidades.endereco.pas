unit crud_mvc.model.entidades.endereco;

interface
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
    procedure SetBairro(const Value: String);
    procedure SetCep(const Value: String);
    procedure SetCidade(const Value: String);
    procedure SetComplemento(const Value: String);
    procedure SetCreatedAt(const Value: TDateTime);
    procedure SetId(const Value: String);
    procedure SetLogradouro(const Value: String);
    procedure SetPessoaId(const Value: String);
  public
    property Id : String read FId write SetId;
    property PessoaId : String read FPessoaId write SetPessoaId;
    property Bairro : String read FBairro write SetBairro;
    property Cep : String read FCep write SetCep;
    property Logradouro : String read FLogradouro write SetLogradouro;
    property Complemento : String read FComplemento write SetComplemento;
    property Cidade : String read FCidade write SetCidade;
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

end.
