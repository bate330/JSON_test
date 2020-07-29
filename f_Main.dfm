object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 211
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 149
    Width = 37
    Height = 13
    Caption = 'Source:'
  end
  object Button1: TButton
    Left = 8
    Top = 15
    Width = 154
    Height = 25
    Caption = 'Save to File'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 287
    Top = 46
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Button2: TButton
    Left = 287
    Top = 15
    Width = 154
    Height = 25
    Caption = 'Load File Content (Memo1)'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 559
    Top = 15
    Width = 154
    Height = 25
    Caption = 'Load Params (Memo2)'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Memo2: TMemo
    Left = 559
    Top = 46
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo2')
    TabOrder = 4
  end
  object Memo3: TMemo
    Left = 8
    Top = 46
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo3')
    TabOrder = 5
  end
  object SourceEdit: TEdit
    Left = 8
    Top = 168
    Width = 329
    Height = 21
    TabOrder = 6
    Text = 'D:\Pobrane\example_1.json'
  end
end
