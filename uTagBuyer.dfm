object fmTagBuyer: TfmTagBuyer
  Left = 337
  Top = 409
  Width = 649
  Height = 379
  Caption = #1055#1086#1082#1091#1087#1072#1077#1084#1072#1103' '#1087#1088#1086#1076#1091#1082#1094#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 185
    Top = 0
    Width = 456
    Height = 345
    Align = alClient
    Ctl3D = False
    DataSource = DSTagBuyer
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
    Height = 345
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
      DataSource = DSTagBuyer
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
      DataSource = DSTagBuyer
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
  object ADOTagBuyer: TADODataSet
    Connection = ModuleData.ADOConnection
    CursorType = ctStatic
    BeforePost = ADOTagBuyerBeforePost
    CommandText = 'select * from TAG_BUYER where ID_BUYER=:ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    Left = 296
    Top = 112
    object ADOTagBuyerID_BUYER: TIntegerField
      FieldName = 'ID_BUYER'
    end
    object ADOTagBuyerID_PRODUCT: TIntegerField
      FieldName = 'ID_PRODUCT'
    end
    object ADOTagBuyerCOUNT: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'COUNT'
    end
    object ADOTagBuyerNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldKind = fkLookup
      FieldName = 'NAME'
      LookupDataSet = ADOProduct
      LookupKeyFields = 'ID_PRODUCT'
      LookupResultField = 'NAME'
      KeyFields = 'ID_PRODUCT'
      Lookup = True
    end
  end
  object DSTagBuyer: TDataSource
    DataSet = ADOTagBuyer
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
    object ADOProductNAME: TWideStringField
      FieldName = 'NAME'
      Size = 25
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
