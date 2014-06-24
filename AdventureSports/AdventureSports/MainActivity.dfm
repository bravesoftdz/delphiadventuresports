object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'AdventureSports v1.0.0 - Activit'#233
  ClientHeight = 460
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 534
    Height = 444
    Caption = 'Panel1'
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 6
      Top = 19
      Width = 513
      Height = 62
      Caption = 'S'#233'lectionner une activit'#233
      TabOrder = 0
    end
    object GroupBox2: TGroupBox
      Left = 6
      Top = 87
      Width = 513
      Height = 314
      Caption = 'Description de l'#39'activit'#233
      TabOrder = 1
    end
    object ButtonRetour: TButton
      Left = 444
      Top = 407
      Width = 75
      Height = 34
      Caption = 'Retour'
      TabOrder = 2
      OnClick = ButtonRetourClick
    end
  end
  object MemoDescription: TMemo
    Left = 22
    Top = 117
    Width = 505
    Height = 276
    Lines.Strings = (
      'MemoDescription')
    ReadOnly = True
    TabOrder = 1
  end
  object ComboBoxActivity: TComboBox
    Left = 22
    Top = 48
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    OnChange = ComboBoxActivityChange
  end
end
