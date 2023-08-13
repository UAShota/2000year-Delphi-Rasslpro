object fmRefSeller: TfmRefSeller
  Left = 359
  Top = 361
  Align = alClient
  BorderStyle = bsNone
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
  ClientHeight = 392
  ClientWidth = 655
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 185
    Top = 0
    Width = 470
    Height = 392
    Align = alClient
    Ctl3D = False
    DataSource = DataSource1
    FixedColor = 15987699
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 185
    Height = 392
    Align = alLeft
    Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 76
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object Label2: TLabel
      Left = 8
      Top = 72
      Width = 45
      Height = 13
      Caption = #1058#1077#1083#1077#1092#1086#1085
    end
    object Bevel1: TBevel
      Left = 8
      Top = 152
      Width = 169
      Height = 17
    end
    object Bevel2: TBevel
      Left = 8
      Top = 320
      Width = 169
      Height = 17
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 40
      Width = 169
      Height = 21
      DataField = 'NAME'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 88
      Width = 169
      Height = 21
      DataField = 'PHONE'
      DataSource = DataSource1
      TabOrder = 1
    end
    object Button1: TButton
      Left = 11
      Top = 184
      Width = 78
      Height = 25
      Action = ModuleData.DataSetInsert1
      TabOrder = 2
    end
    object Button2: TButton
      Left = 96
      Top = 216
      Width = 78
      Height = 25
      Action = ModuleData.DataSetCancel1
      TabOrder = 3
    end
    object Button3: TButton
      Left = 96
      Top = 184
      Width = 78
      Height = 25
      Action = ModuleData.DataSetPost1
      TabOrder = 4
    end
    object Button4: TButton
      Left = 11
      Top = 216
      Width = 78
      Height = 25
      Action = ModuleData.DataSetDelete1
      TabOrder = 5
    end
    object Button5: TButton
      Left = 11
      Top = 248
      Width = 78
      Height = 25
      Action = ModuleData.DataSetRefresh1
      TabOrder = 6
    end
    object Button6: TButton
      Left = 11
      Top = 352
      Width = 163
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 7
      OnClick = Button6Click
    end
    object DBCheckBox1: TDBCheckBox
      Left = 8
      Top = 120
      Width = 97
      Height = 17
      Caption = #1048#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103
      DataField = 'STATE'
      DataSource = DataSource1
      TabOrder = 8
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object Button7: TButton
      Left = 11
      Top = 280
      Width = 163
      Height = 25
      Caption = #1055#1086#1089#1090#1072#1074#1083#1103#1077#1084#1099#1077' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1099
      TabOrder = 9
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 96
      Top = 248
      Width = 78
      Height = 25
      Caption = #1069#1082#1089#1087#1086#1088#1090
      TabOrder = 10
      OnClick = Button8Click
    end
  end
  object ADODataSet: TADODataSet
    Connection = ModuleData.ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from REF_SELLER'
    Parameters = <>
    Left = 296
    Top = 112
    object ADODataSetID_SELLER: TAutoIncField
      DisplayLabel = #8470
      FieldName = 'ID_SELLER'
      ReadOnly = True
    end
    object ADODataSetNAME: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 25
      FieldName = 'NAME'
      Size = 50
    end
    object ADODataSetPHONE: TWideStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      DisplayWidth = 15
      FieldName = 'PHONE'
      Size = 25
    end
    object ADODataSetSTATE: TBooleanField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'STATE'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet
    Left = 296
    Top = 144
  end
end
