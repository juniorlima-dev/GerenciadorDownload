object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 444
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 770
    Height = 97
    Align = alTop
    TabOrder = 0
  end
  object scbLayout: TScrollBox
    Left = 0
    Top = 97
    Width = 770
    Height = 347
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 1
    ExplicitTop = 73
    ExplicitHeight = 371
    object pnlItem: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 764
      Height = 38
      Align = alTop
      Padding.Left = 5
      Padding.Top = 7
      Padding.Right = 5
      Padding.Bottom = 7
      TabOrder = 0
      object btnIniciar: TButton
        AlignWithMargins = True
        Left = 11
        Top = 8
        Width = 107
        Height = 22
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Iniciar Download'
        TabOrder = 0
        ExplicitLeft = -18
        ExplicitTop = 16
        ExplicitHeight = 30
      end
      object pb1: TProgressBar
        AlignWithMargins = True
        Left = 610
        Top = 8
        Width = 143
        Height = 22
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Align = alRight
        TabOrder = 1
        ExplicitLeft = 362
        ExplicitHeight = 30
      end
      object btnParar: TButton
        AlignWithMargins = True
        Left = 128
        Top = 8
        Width = 107
        Height = 22
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Parar Download'
        TabOrder = 2
        ExplicitLeft = 99
        ExplicitTop = 0
        ExplicitHeight = 30
      end
      object btnMsg: TButton
        AlignWithMargins = True
        Left = 245
        Top = 8
        Width = 107
        Height = 22
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Exibir Mensagem'
        TabOrder = 3
        ExplicitLeft = 192
        ExplicitTop = 0
        ExplicitHeight = 30
      end
      object edtLink: TEdit
        AlignWithMargins = True
        Left = 362
        Top = 8
        Width = 238
        Height = 22
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Align = alLeft
        TabOrder = 4
        Text = 'edtLink'
      end
    end
  end
end
