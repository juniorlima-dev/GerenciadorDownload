program prjDownload;

uses
  Vcl.Forms,
  frmPrincipal in 'frmPrincipal.pas' {Form1},
  Model.Base in 'Model\Model.Base.pas',
  Model.Download in 'Model.Download.pas',
  controller.Dowload in 'Controller\controller.Dowload.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
