unit controller.Dowload;

interface

uses
  Model.Download, Model.Base;

type
  TControllerDownload = class
    private
      FModel: TDownload;
      FState: TState;
    procedure SetModel(const Value: TDownload);
    public
      procedure New;
      function save: boolean;
      procedure Cancel;
      procedure downloading(flag: boolean);
      property Model: TDownload read FModel write SetModel;


  end;

implementation

{ TControllerDownload }

procedure TControllerDownload.Cancel;
begin
  FState := stCancel;
  FModel.Notify;
end;

procedure TControllerDownload.downloading(flag: boolean);
begin
  if flag then
  begin
    if Model.validar then
      FState := stDownloading
    else
      FState := stBrowser;
  end
  else
    FState := stBrowser;


  FModel.Notify;
end;

procedure TControllerDownload.New;
begin
  FModel := TDownload.create;
  FState := stNew;

end;

function TControllerDownload.save: boolean;
begin
  FState := stBrowser;
  FModel.Notify;
end;

procedure TControllerDownload.SetModel(const Value: TDownload);
begin
  FModel := Value;
end;

end.
