object Form7: TForm7
  Left = 0
  Top = 0
  ClientHeight = 539
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 752
    Height = 273
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 748
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 239
      Height = 21
      Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1082#1088#1099#1090#1080#1103' '#1080' '#1079#1072#1082#1088#1099#1090#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object StringGrid1: TStringGrid
      Left = 16
      Top = 48
      Width = 475
      Height = 217
      ColCount = 4
      FixedCols = 0
      RowCount = 2
      TabOrder = 0
      ColWidths = (
        55
        70
        158
        163)
      RowHeights = (
        24
        24)
    end
    object Panel2: TPanel
      Left = 510
      Top = 1
      Width = 241
      Height = 271
      Align = alRight
      Color = clMedGray
      Enabled = False
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 506
      object Label2: TLabel
        Left = 16
        Top = 12
        Width = 141
        Height = 21
        Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1076#1072#1095#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 204
        Width = 122
        Height = 21
        Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1079#1072#1076#1072#1095#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 16
        Top = 39
        Width = 60
        Height = 17
        Caption = '# '#1079#1072#1090#1074#1086#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 16
        Top = 67
        Width = 149
        Height = 17
        Caption = #1042#1088#1077#1084#1103' '#1086#1090#1082#1088#1099#1090#1080#1103' '#1079#1072#1090#1074#1086#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 16
        Top = 121
        Width = 149
        Height = 17
        Caption = #1042#1088#1077#1084#1103' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1079#1072#1090#1074#1086#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 14
        Top = 231
        Width = 53
        Height = 17
        Caption = '# '#1079#1072#1076#1072#1095#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 82
        Top = 38
        Width = 95
        Height = 23
        TabOrder = 0
      end
      object Button1: TButton
        Left = 8
        Top = 175
        Width = 209
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1076#1072#1095#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Button1Click
      end
      object Edit2: TEdit
        Left = 73
        Top = 231
        Width = 57
        Height = 23
        TabOrder = 2
      end
      object Button2: TButton
        Left = 136
        Top = 231
        Width = 89
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 3
        OnClick = Button2Click
      end
      object TimePicker1: TTimePicker
        Left = 15
        Top = 90
        Width = 161
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        TabOrder = 4
        Time = 0.963888888888888900
        TimeFormat = 'hh:nn:ss'
      end
      object TimePicker2: TTimePicker
        Left = 15
        Top = 144
        Width = 161
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        TabOrder = 5
        Time = 0.963888888888888900
        TimeFormat = 'hh:nn:ss'
      end
    end
    object RadioButton1: TRadioButton
      Left = 376
      Top = 13
      Width = 113
      Height = 17
      Caption = #1040#1082#1090#1080#1074#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 2
      OnClick = RadioButton1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 273
    Width = 752
    Height = 266
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 748
    ExplicitHeight = 265
    object Label12: TLabel
      Left = 16
      Top = 6
      Width = 144
      Height = 21
      Caption = '% '#1074#1083#1072#1078#1085#1086#1089#1090#1080' '#1087#1086#1095#1074#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Panel4: TPanel
      Left = 510
      Top = 1
      Width = 241
      Height = 264
      Align = alRight
      Color = clMedGray
      Enabled = False
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 506
      ExplicitHeight = 263
      object Label8: TLabel
        Left = 16
        Top = 12
        Width = 141
        Height = 21
        Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1076#1072#1095#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 8
        Top = 204
        Width = 122
        Height = 21
        Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1079#1072#1076#1072#1095#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 16
        Top = 39
        Width = 60
        Height = 17
        Caption = '# '#1079#1072#1090#1074#1086#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 16
        Top = 67
        Width = 215
        Height = 17
        Caption = '% '#1074#1083#1072#1078#1085#1086#1089#1090#1080' '#1087#1088#1080' '#1086#1090#1082#1088#1099#1090#1080#1080' '#1079#1072#1090#1074#1086#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 14
        Top = 231
        Width = 53
        Height = 17
        Caption = '# '#1079#1072#1076#1072#1095#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 16
        Top = 121
        Width = 215
        Height = 17
        Caption = '% '#1074#1083#1072#1078#1085#1086#1089#1090#1080' '#1087#1088#1080' '#1079#1072#1082#1088#1099#1090#1080#1080' '#1079#1072#1090#1074#1086#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Edit3: TEdit
        Left = 82
        Top = 38
        Width = 95
        Height = 23
        TabOrder = 0
      end
      object Button3: TButton
        Left = 8
        Top = 175
        Width = 209
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1076#1072#1095#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Button3Click
      end
      object Edit4: TEdit
        Left = 73
        Top = 231
        Width = 57
        Height = 23
        TabOrder = 2
      end
      object Button4: TButton
        Left = 136
        Top = 231
        Width = 89
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 3
        OnClick = Button4Click
      end
      object Edit5: TEdit
        Left = 16
        Top = 92
        Width = 153
        Height = 23
        TabOrder = 4
      end
      object Edit6: TEdit
        Left = 16
        Top = 144
        Width = 153
        Height = 23
        TabOrder = 5
      end
    end
    object StringGrid2: TStringGrid
      Left = 16
      Top = 33
      Width = 476
      Height = 217
      ColCount = 4
      FixedCols = 0
      RowCount = 2
      TabOrder = 1
      ColWidths = (
        55
        70
        158
        163)
      RowHeights = (
        24
        24)
    end
    object RadioButton2: TRadioButton
      Left = 376
      Top = 10
      Width = 113
      Height = 17
      Caption = #1040#1082#1090#1080#1074#1080#1088#1086#1074#1072#1090#1100
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = RadioButton2Click
    end
  end
  object timer_bd_sc: TTimer
    Enabled = False
    OnTimer = timer_bd_scTimer
    Left = 705
    Top = 16
  end
  object task_h: TTimer
    Enabled = False
    Interval = 1500
    OnTimer = task_hTimer
    Left = 32
    Top = 384
  end
  object task_t: TTimer
    Enabled = False
    Interval = 1500
    Left = 32
    Top = 136
  end
  object sql_task_h: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Form1.SQLConnection1
    Left = 104
    Top = 385
  end
end
