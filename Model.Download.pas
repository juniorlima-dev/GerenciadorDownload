unit Model.Download;

interface

uses
  Model.Base;

type
  TDownload = class(TBaseModel)
  private
    FDataFim: TDateTime;
    FDataInicio: TDateTime;
    FURL: string;
    Fdiretorio: string;
  public
    procedure SetDataFim(const Value: TDateTime);
    procedure SetDataInicio(const Value: TDateTime);
    procedure SetURL(const Value: string);
    procedure Setdiretorio(const Value: string);
    function validar:Boolean; override;
    property URL: string read FURL write SetURL;
    property DataInicio: TDateTime read FDataInicio write SetDataInicio;
    property DataFim: TDateTime read FDataFim write SetDataFim;
    property diretorio: string read Fdiretorio write Setdiretorio;

  end;

implementation

{ TDownload }

procedure TDownload.SetDataFim(const Value: TDateTime);
begin
  FDataFim := Value;
end;

procedure TDownload.SetDataInicio(const Value: TDateTime);
begin
  FDataInicio := Value;
end;

procedure TDownload.Setdiretorio(const Value: string);
begin
  Fdiretorio := Value;
end;

procedure TDownload.SetURL(const Value: string);
begin
  FURL := Value;
end;

function TDownload.validar: Boolean;
begin

end;

end.
