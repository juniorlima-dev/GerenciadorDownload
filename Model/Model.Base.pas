unit Model.Base;

unit Model.Base;

interface

 uses
  System.Generics.Collections;

type

  TState = (stNew, stDownloading, stBrowser);

  TBaseModel = class; //forword

  IObserver = Interface
    ['{7188DCCC-C1D9-44DE-A16B-3FE78F2DD263}']

    procedure Update(Observable: TBaseModel);
  end;

  TBaseModel = class
  private
    FObservers : TList<IObserver>;
    FOID: Integer;
    procedure SetOID(const Value: Integer);
  protected
    function Validar: Boolean;virtual;abstract;
  public
    constructor Create;
    destructor Destroy;override;
    procedure Add(Observer: IObserver);
    procedure Remove(Observer: IObserver);
    procedure Notify;
    property OID: Integer read FOID write SetOID;
  end;


implementation

{ TBaseModel }

procedure TBaseModel.Add(Observer: IObserver);
begin
  FObservers.Add(Observer);
end;

constructor TBaseModel.Create;
begin
  FObservers := TList<IObserver>.Create;
  Randomize;
  FOID := Random(9999999);
end;

destructor TBaseModel.Destroy;
begin
  FObservers.Free;
  inherited;
end;

procedure TBaseModel.Notify;
var
  obs: IObserver;
begin
  for obs in FObservers do
  begin
    obs.Update(Self);
  end;
end;

procedure TBaseModel.Remove(Observer: IObserver);
begin
  FObservers.Remove(Observer);
end;

procedure TBaseModel.SetOID(const Value: Integer);
begin
  FOID := Value;
end;

end.

