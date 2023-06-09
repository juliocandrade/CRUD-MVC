unit crud_mvc.utilitarios.validators.attributes;

interface

uses
  crud_mvc.utilitarios.validators.engine,
  System.Generics.Collections;

const
  EmailRegex : string = '^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$';

type

  ValidationAttribute = class abstract(TCustomAttribute)
  protected
    FMessage: string;
    FContext: string;
    function DoValidate(aValue: string): boolean; virtual; abstract;
  public
    constructor Create(aContext: string; aMessage: string);
    property Context: string read FContext;
    function Validate(aValue: string): IValidationResult;
  end;

  RequiredValidationAttribute = class(ValidationAttribute)
  public
    function DoValidate(aValue: string): boolean; override;
  end;

  MaxLengthValidationAttribute = class(ValidationAttribute)
  protected
    FLength: Integer;
  public
    constructor Create(aContext: string; aMessage: string; aLength: Integer);
    function DoValidate(aValue: string): boolean; override;
  end;

  MinLengthValidationAttribute = class(MaxLengthValidationAttribute)
  public
    function DoValidate(aValue: string): boolean; override;
  end;

  RegexValidationAttribute = class(ValidationAttribute)
  private
    FRegex: string;
  public
    constructor Create(aContext: string; aMessage: string; aRegex: string);
    function DoValidate(aValue: string): boolean; override;
  end;

  EmailValidationAttribute = class(RegexValidationAttribute)
    constructor Create(aContext: string; aMessage: string);
  end;

  EntityValidationAttribute = class(ValidationAttribute)
  end;

implementation

uses
  System.SysUtils, System.RegularExpressions;

{ RequiredValidationAttribute }

function RequiredValidationAttribute.DoValidate(aValue: string): boolean;
begin
  Result := not aValue.IsEmpty;
end;

{ MaxLengthValidationAttribute }

constructor MaxLengthValidationAttribute.Create(aContext: string;
  aMessage: string; aLength: Integer);
begin
  inherited Create(aContext, aMessage);
  FLength := aLength;
end;

function MaxLengthValidationAttribute.DoValidate(aValue: string): boolean;
begin
  Result := Length(aValue) <= FLength;
end;

{ RegexValidationAttribute }

constructor RegexValidationAttribute.Create(aContext: string; aMessage: string;
  aRegex: string);
begin
  inherited Create(aContext, aMessage);
  FRegex := aRegex;
end;

function RegexValidationAttribute.DoValidate(aValue: string): boolean;
begin
  Result := TRegEx.IsMatch(aValue, FRegex);
end;

{ ValidationAttribute }

constructor ValidationAttribute.Create(aContext: string; aMessage: string);
begin
  inherited Create;
  FMessage := aMessage;
  FContext := aContext;
end;

function ValidationAttribute.Validate(aValue: string): IValidationResult;
var
  lIsValid: boolean;
begin
  Result := TValidationResult.Create;
  lIsValid := DoValidate(aValue);
  if (not lIsValid) then
    Result.AddBrokenRules([FMessage]);
end;

{ MinLengthValidationAttribute }

function MinLengthValidationAttribute.DoValidate(aValue: string): boolean;
begin
  Result := Length(aValue) >= FLength;
end;

{ EmailValidationAttribute }

constructor EmailValidationAttribute.Create(aContext, aMessage: string);
begin
  inherited Create(aContext, aMessage, EmailRegex);
end;

end.
