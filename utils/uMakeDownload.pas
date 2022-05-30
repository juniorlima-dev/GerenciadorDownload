unit uMakeDownload;

interface

uses
  Model.Download, System.Threading, IdBaseComponent, IdComponent,
   IdTCPConnection, IdTCPClient, IdHTTP, System.Generics.Collections;

type
  TDownloadStatus = (tdEspera, tdBaixando, tdConcluido, tdErro );

  TMakeDownload = class(TDownload)
  private
    FDownloadStatus: TDownloadStatus;
    FNomeArquivo: string;
    FcaminhoArquivo: string;
    FDownload: TDownload;
    FStatusPorcentagem: string;
    FTamanhoArquivo: Integer;
    FTotalBaixado: String;
    FPercentualBaixado : string;
    FQntAtualBaixada: Integer;
    FObj : TList<TIdHTTP>;
    procedure SetcaminhoArquivo(const Value: string);
    procedure SetDownloadStatus(const Value: TDownloadStatus);
    procedure SetNomeArquivo(const Value: string);
    function RetornaPorcentagem(ValorMaximo, ValorAtual: real): string;


    /// <summary>
    ///  Evento do componente TIdHttp
    ///  disparado quando o componente inicia uma operação,
    ///  AWorkCountMax será preenchida com o tamanho do arquivo que pretendemos baixar em bytes
    /// </summary>
    procedure eventoWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    function RetornaKiloBytes(ValorAtual: real): string;
    procedure eventoWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure eventoWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
  public
    constructor Create(Download: TDownload); reintroduce;
    function Validar: Boolean; override;
    property NomeArquivo: string read FNomeArquivo;
    property CaminhoArquivo: string read FcaminhoArquivo;
    property DownloadStatus: TDownloadStatus read FDownloadStatus;
    property StatusPorcentagem: string read FStatusPorcentagem;
    property TamanhoArquivo: Integer read FTamanhoArquivo;
    property QntAtualBaixada: Integer read FQntAtualBaixada;
    property TotalbaixadoKiloBytes: String read FTotalBaixado;
    property PercetualBaixado: string read FPercentualBaixado;

    procedure Baixar;
  end;


implementation

uses
  System.Classes, System.SysUtils;

{ TMakeDownload }

procedure TMakeDownload.Baixar;
var
  Task: ITask;
  fileDownload : TFileStream;
  IdHTTP : TIdHTTP;
begin
  if Validar then
  begin
    Task:= TTask.create(
    procedure
    begin
        IdHTTP := TIdHTTP.Create(nil);
        FObj.Add(IdHTTP);

        IdHTTP.OnWorkBegin := eventoWorkBegin;
        IdHTTP.OnWork := eventoWork;
        IdHTTP.OnWorkEnd := eventoWorkEnd;

        fileDownload := TFileStream.Create(FcaminhoArquivo + FNomeArquivo, 0);

        try

          try

            IdHTTP.Get(URL, fileDownload);

          except

            on e : exception do
              raise Exception.Create('Erro ao baixar arquivo '+NomeArquivo+ #13 + e.message);


          end;

        finally

          FreeAndNil(fileDownload);

        end;


    end);
    Task.Start;
  end;

end;

constructor TMakeDownload.Create(Download: TDownload);
begin
  inherited Create();
  FObj := TList<TIdHTTP>.Create;
  URL := Download.URL;
  DataInicio := Download.DataInicio;
  DataFim := Download.DataFim;

  FNomeArquivo := ExtractFileName(Download.diretorio);
  FcaminhoArquivo := ExtractFilePath(Download.diretorio);
end;

procedure TMakeDownload.SetcaminhoArquivo(const Value: string);
begin

  FCaminhoArquivo := Value;

end;

procedure TMakeDownload.SetDownloadStatus(const Value: TDownloadStatus);
begin

  FDownloadStatus := Value;

end;

procedure TMakeDownload.SetNomeArquivo(const Value: string);
begin

  FNomeArquivo := Value;

end;

function TMakeDownload.validar: Boolean;
begin

end;

function TMakeDownload.RetornaPorcentagem(ValorMaximo, ValorAtual: real): string;
var
  resultado: Real;
begin

  resultado := ((ValorAtual * 100) / ValorMaximo);

  Result    := FormatFloat('0%', resultado);

end;

function TMakeDownload.RetornaKiloBytes(ValorAtual: real): string;
var
  resultado : real;
begin

  resultado := ((ValorAtual / 1024) / 1024);

  Result    := FormatFloat('0.000 KBs', resultado);

end;

procedure TMakeDownload.eventoWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin

  FTamanhoArquivo := AWorkCountMax;

  DataInicio := now;

end;

procedure TMakeDownload.eventoWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
begin

  FQntAtualBaixada := AWorkCount;

  FTotalBaixado    := RetornaKiloBytes(AWorkCount);

  FPercentualBaixado := RetornaPorcentagem(FTamanhoArquivo, AWorkCount);

end;

procedure TMakeDownload.eventoWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin

  DataFim:= now;

  TIdHTTP(ASender).Free;

end;

end.
