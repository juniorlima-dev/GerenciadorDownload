program prjDownload;

uses
  Vcl.Forms,
  frmPrincipal in 'frmPrincipal.pas' {Form1},
  Model.Base in 'Model\Model.Base.pas',
  Model.Download in 'Model\Model.Download.pas',
  controller.Dowload in 'Controller\controller.Dowload.pas',
  DAO.Download in 'DAO\DAO.Download.pas',
  uMakeDownload in 'utils\uMakeDownload.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
