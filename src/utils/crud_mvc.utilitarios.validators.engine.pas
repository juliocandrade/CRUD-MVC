unit crud_mvc.utilitarios.validators.engine;

interface

uses
  System.Generics.Collections, System.Rtti;
type
  TBrokenRules = array of string;

  iValidationResult = interface
    ['{14B7A1EF-DCD0-416C-BAF1-CF25A6F6E202}']
    function GetBrokenRules: TBrokenRules;
    procedure SetBrokenRules(aBrokenRules: TBrokenRules);
    procedure AddBrokenRules(aBrokenRules: TBrokenRules);
    property BrokenRules: TBrokenRules read GetBrokenRules write SetBrokenRules;
    function IsValid(const aRaiseExceptionIfNot: boolean = false): boolean;
  end;

  TValidationResult = class(TInterfacedObject, iValidationResult)
  protected
    FBrokenRules: TBrokenRules;
  public
    function GetBrokenRules: TBrokenRules;
    procedure SetBrokenRules(aBrokenRules: TBrokenRules);
    procedure AddBrokenRules(aBrokenRules: TBrokenRules);
    property BrokenRules: TBrokenRules read GetBrokenRules write SetBrokenRules;
    function IsValid(const aRaiseExceptionIfNot: boolean = false): boolean;
  end;

  iValidator<T> = interface
    ['{A81A5167-68BB-49D3-B2F8-BC0557FA240C}']
    function Validate(aEntity: T): iValidationResult;
  end;

  IValidatable<T> = interface
    ['{01643E54-2058-4C42-BD98-462EA78E1CAB}']
    function Validate(aValidator: iValidator<T>;
      out aBrokenRules: TBrokenRules): boolean;
  end;

  IValidatorContainer = interface
    ['{DCC0B831-822B-4159-B132-10587E8BFDFB}']
    procedure RegisterValidatorFor(aType: TClass; aContext: string);
    function GetValidatorFor(aType: TClass; aContext: string)
      : iValidator<TClass>;
  end;

  TBaseValidatorContainer = class(TObject)
  private
    FRegistry: TDictionary<TClass, TDictionary<string, IInterface>>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure RegisterValidatorFor<T: class>(aContext: string;
      aValidator: iValidator<T>);
    function GetValidatorFor<T: class>(aContext: string): iValidator<T>;
  end;

  TValidationEngine = class(TObject)
  private
    class var FRTTIContext: TRttiContext;
    class var FValidationContainer: TBaseValidatorContainer;
  public
    class constructor Create;
    class destructor Destroy;
    class function Validate<T: class>(aObject: T; aContext: string)
      : iValidationResult;
    class function PropertyValidation(aObject: TObject; aContext: string)
      : iValidationResult;
    class function EntityValidation<T: class>(aObject: T; aContext: string)
      : iValidationResult;
    class property ValidationContainer: TBaseValidatorContainer
      read FValidationContainer;
  end;

implementation

uses
  crud_mvc.utilitarios.validators.attributes, System.SysUtils;

{ TValidationEngine }

class constructor TValidationEngine.Create;
begin
  FRTTIContext := TRttiContext.Create;
  FValidationContainer := TBaseValidatorContainer.Create;
end;

class destructor TValidationEngine.Destroy;
begin
  FRTTIContext.Free;
  FValidationContainer.Free;
end;

class function TValidationEngine.EntityValidation<T>(aObject: T;
  aContext: string): iValidationResult;
var
  a: TCustomAttribute;
  lValidator: iValidator<T>;
begin
  Result := TValidationResult.Create;
  lValidator := FValidationContainer.GetValidatorFor<T>(aContext);
  Result.AddBrokenRules(lValidator.Validate(aObject).BrokenRules);
end;

class function TValidationEngine.PropertyValidation(aObject: TObject;
  aContext: string): iValidationResult;
var
  rt: TRttiType;
  a: TCustomAttribute;
  p: TRttiProperty;
  m: TRttiMethod;
begin
  Result := TValidationResult.Create;
  rt := FRTTIContext.GetType(aObject.ClassType);
  for p in rt.GetProperties do
    for a in p.GetAttributes do
    begin
      if not(a is ValidationAttribute) then
        continue;
      if ValidationAttribute(a).Context <> aContext then
        continue;
      m := FRTTIContext.GetType(a.ClassType).GetMethod('Validate');
      if m = nil then
        continue;
      Result.AddBrokenRules(m.Invoke(a, [p.GetValue(aObject).AsString])
        .AsType<iValidationResult>.BrokenRules);
    end;
end;

class function TValidationEngine.Validate<T>(aObject: T; aContext: string)
  : iValidationResult;
var
  rt: TRttiType;
  cx: TRttiContext;
  a: TCustomAttribute;
  p: TRttiProperty;
  m: TRttiMethod;
  lValidator: iValidator<T>;
begin
  Result := TValidationResult.Create;
  Result.AddBrokenRules(EntityValidation<T>(aObject, aContext).BrokenRules);
  Result.AddBrokenRules(PropertyValidation(aObject, aContext).BrokenRules);
end;

{ TBaseValidatorContainer }

constructor TBaseValidatorContainer.Create;
begin
  FRegistry := TDictionary < TClass, TDictionary < string, IInterface >>.Create;
end;

destructor TBaseValidatorContainer.Destroy;
var
  lVal: TDictionary<string, IInterface>;
begin
  for lVal in FRegistry.Values do
    lVal.Free;
  FRegistry.Free;
  inherited;
end;

function TBaseValidatorContainer.GetValidatorFor<T>(aContext: string)
  : iValidator<T>;
begin
  Result := FRegistry[T][aContext] as iValidator<T>;
end;

procedure TBaseValidatorContainer.RegisterValidatorFor<T>(aContext: string;
  aValidator: iValidator<T>);
var
  lDictionary: TDictionary<string, IInterface>;
begin
  if not FRegistry.TryGetValue(T, lDictionary) then
    lDictionary := TDictionary<string, IInterface>.Create();
  lDictionary.AddOrSetValue(aContext, aValidator);
  FRegistry.AddOrSetValue(T, lDictionary);
end;

{ TValidationResult }

procedure TValidationResult.AddBrokenRules(aBrokenRules: TBrokenRules);
begin
  FBrokenRules := FBrokenRules + aBrokenRules;
end;

function TValidationResult.GetBrokenRules: TBrokenRules;
begin
  Result := FBrokenRules;
end;

function TValidationResult.IsValid(const aRaiseExceptionIfNot: boolean)
  : boolean;
const
  sep = #13;
var
  Error : String;
begin
  Error := '';
  Result := Length(FBrokenRules) <= 0;
  if (not Result) and (aRaiseExceptionIfNot) then
    raise Exception.Create(Error.Join(sep, FBrokenRules));
end;

procedure TValidationResult.SetBrokenRules(aBrokenRules: TBrokenRules);
begin
  FBrokenRules := aBrokenRules;
end;

end.
