object fmTagPlane: TfmTagPlane
  Left = 341
  Top = 308
  Align = alClient
  BorderStyle = bsNone
  Caption = #1055#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072' '#1087#1088#1086#1076#1091#1082#1090#1086#1074
  ClientHeight = 352
  ClientWidth = 552
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
    Width = 367
    Height = 352
    Align = alClient
    Ctl3D = False
    DataSource = DSTagPlane
    FixedColor = 15987699
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COUNT'
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 185
    Height = 352
    Align = alLeft
    Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 125
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1076#1091#1082#1090#1072
    end
    object Bevel1: TBevel
      Left = 8
      Top = 128
      Width = 169
      Height = 17
    end
    object Label2: TLabel
      Left = 8
      Top = 72
      Width = 59
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
    end
    object Button1: TButton
      Left = 11
      Top = 160
      Width = 78
      Height = 25
      Action = ModuleData.DataSetInsert1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 96
      Top = 192
      Width = 78
      Height = 25
      Action = ModuleData.DataSetCancel1
      TabOrder = 1
    end
    object Button3: TButton
      Left = 96
      Top = 160
      Width = 78
      Height = 25
      Action = ModuleData.DataSetPost1
      TabOrder = 2
    end
    object Button4: TButton
      Left = 11
      Top = 192
      Width = 78
      Height = 25
      Action = ModuleData.DataSetDelete1
      TabOrder = 3
    end
    object Button6: TButton
      Left = 11
      Top = 256
      Width = 163
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 4
      OnClick = Button6Click
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 8
      Top = 40
      Width = 169
      Height = 21
      DataField = 'ID_PRODUCT'
      DataSource = DSTagPlane
      DropDownRows = 20
      KeyField = 'ID_PRODUCT'
      ListField = 'NAME'
      ListSource = DSProduct
      TabOrder = 5
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 88
      Width = 65
      Height = 21
      DataField = 'COUNT'
      DataSource = DSTagPlane
      TabOrder = 6
    end
    object Button5: TButton
      Left = 11
      Top = 224
      Width = 163
      Height = 25
      Caption = #1069#1082#1089#1087#1086#1088#1090
      TabOrder = 7
      OnClick = Button5Click
    end
  end
  object ADOTagPlane: TADODataSet
    Connection = ModuleData.ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from TAG_PLANE'
    Parameters = <>
    Left = 296
    Top = 112
    object ADOTagPlaneNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldKind = fkLookup
      FieldName = 'NAME'
      LookupDataSet = ADOProduct
      LookupKeyFields = 'ID_PRODUCT'
      LookupResultField = 'NAME'
      KeyFields = 'ID_PRODUCT'
      Lookup = True
    end
    object ADOTagPlaneCOUNT: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'COUNT'
    end
    object ADOTagPlaneID_PLANE: TAutoIncField
      FieldName = 'ID_PLANE'
      ReadOnly = True
      Visible = False
    end
    object ADOTagPlaneID_PRODUCT: TIntegerField
      FieldName = 'ID_PRODUCT'
      Visible = False
    end
  end
  object DSTagPlane: TDataSource
    DataSet = ADOTagPlane
    Left = 296
    Top = 144
  end
  object ADOProduct: TADODataSet
    Connection = ModuleData.ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from REF_PRODUCT where STATE=True'
    Parameters = <>
    Left = 336
    Top = 112
    object ADOProductID_PRODUCT: TAutoIncField
      FieldName = 'ID_PRODUCT'
      ReadOnly = True
    end
    object ADOProductID_TYPE: TIntegerField
      FieldName = 'ID_TYPE'
    end
    object ADOProductNAME: TWideStringField
      FieldName = 'NAME'
    end
    object ADOProductDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 30
    end
    object ADOProductSTATE: TBooleanField
      FieldName = 'STATE'
    end
  end
  object DSProduct: TDataSource
    DataSet = ADOProduct
    Left = 336
    Top = 144
  end
end
