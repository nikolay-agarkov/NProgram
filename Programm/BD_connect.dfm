object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1041#1044
  ClientHeight = 385
  ClientWidth = 200
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 21
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 74
    Height = 21
    Caption = 'HostName'
  end
  object Label2: TLabel
    Left = 8
    Top = 133
    Width = 133
    Height = 21
    Caption = #1048#1084#1103' '#1041#1044' (Database)'
  end
  object Label3: TLabel
    Left = 8
    Top = 197
    Width = 132
    Height = 21
    Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  end
  object Label4: TLabel
    Left = 8
    Top = 261
    Width = 154
    Height = 21
    Caption = #1055#1072#1088#1086#1083#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  end
  object Label5: TLabel
    Left = 8
    Top = 75
    Width = 36
    Height = 21
    Caption = #1055#1086#1088#1090
  end
  object Button1: TButton
    Left = 7
    Top = 336
    Width = 185
    Height = 33
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 40
    Width = 185
    Height = 29
    TabOrder = 1
    Text = '127.0.0.1'
  end
  object Edit2: TEdit
    Left = 8
    Top = 160
    Width = 185
    Height = 29
    TabOrder = 2
    Text = 'test_water'
  end
  object Edit3: TEdit
    Left = 8
    Top = 224
    Width = 185
    Height = 29
    TabOrder = 3
    Text = 'main_comp'
  end
  object Edit4: TEdit
    Left = 8
    Top = 288
    Width = 185
    Height = 29
    PasswordChar = '*'
    TabOrder = 4
    Text = 'root'
  end
  object Edit5: TEdit
    Left = 8
    Top = 102
    Width = 185
    Height = 29
    NumbersOnly = True
    TabOrder = 5
    Text = '3306'
  end
end
