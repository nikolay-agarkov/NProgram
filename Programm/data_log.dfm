object Form8: TForm8
  Left = 0
  Top = 0
  Caption = #1044#1072#1085#1085#1099#1077' '#1079#1072' '#1087#1077#1088#1080#1086#1076
  ClientHeight = 657
  ClientWidth = 991
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
    Width = 257
    Height = 657
    Align = alLeft
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 88
      Width = 98
      Height = 17
      Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 147
      Width = 88
      Height = 17
      Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 48
      Width = 221
      Height = 17
      Caption = #1059#1082#1072#1078#1080#1090#1077' '#1085#1072#1095#1072#1083#1100#1085#1091#1102' '#1080' '#1082#1086#1085#1077#1095#1085#1091#1102' '#1076#1072#1090#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Button2: TButton
      Left = 9
      Top = 216
      Width = 218
      Height = 33
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      TabOrder = 0
      OnClick = Button2Click
    end
    object DateTimePicker1: TDateTimePicker
      Left = 41
      Top = 111
      Width = 186
      Height = 23
      Date = 44820.000000000000000000
      Time = 44820.000000000000000000
      TabOrder = 1
    end
    object DateTimePicker2: TDateTimePicker
      Left = 41
      Top = 170
      Width = 186
      Height = 23
      Date = 45091.000000000000000000
      Time = 45091.000000000000000000
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 257
    Top = 0
    Width = 734
    Height = 657
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 265
    ExplicitWidth = 722
    ExplicitHeight = 495
    object Panel3: TPanel
      Left = 1
      Top = 448
      Width = 732
      Height = 208
      Align = alBottom
      TabOrder = 0
      ExplicitWidth = 660
      object Chart1: TChart
        Left = 1
        Top = 1
        Width = 730
        Height = 206
        Legend.Visible = False
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        View3D = False
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 45
        ExplicitWidth = 652
        ExplicitHeight = 267
        DefaultCanvas = 'TGDIPlusCanvas'
        PrintMargins = (
          15
          19
          15
          19)
        ColorPaletteIndex = 13
        object Series1: TPointSeries
          HoverElement = [heCurrent]
          SeriesColor = clBlue
          ClickableLine = False
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
      end
    end
    object StringGrid1: TStringGrid
      Left = 1
      Top = 1
      Width = 732
      Height = 447
      Align = alClient
      FixedCols = 0
      RowCount = 2
      TabOrder = 1
      ExplicitWidth = 720
      ExplicitHeight = 446
      ColWidths = (
        168
        86
        112
        126
        164)
    end
  end
  object Timer_bd_data_log: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = Timer_bd_data_logTimer
    Left = 16
    Top = 8
  end
end
