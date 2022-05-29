unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    pnlTopo: TPanel;
    scbLayout: TScrollBox;
    pnlItem: TPanel;
    btnIniciar: TButton;
    pb1: TProgressBar;
    btnParar: TButton;
    btnMsg: TButton;
    edtLink: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
