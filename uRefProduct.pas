unit uRefProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, DBCtrls, Mask, ExtCtrls, Grids, DBGrids;

type
  TfmRefProduct = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Bevel1: TBevel;
    DBEdit1: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    DBCheckBox1: TDBCheckBox;
    ADODataSet: TADODataSet;
    ADODataSetNAME: TWideStringField;
    ADODataSetSTATE: TBooleanField;
    DataSource: TDataSource;
    ADODataSetID_PRODUCT: TAutoIncField;
    ADODataSetID_TYPE: TIntegerField;
    ADODataSetDESCRIPTION: TWideStringField;
    ADODataSetType: TADODataSet;
    ADODataSetTypeName: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    DataSourceType: TDataSource;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    Button7: TButton;
    Bevel2: TBevel;
    Button8: TButton;
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRefProduct: TfmRefProduct;

implementation

{$R *.dfm}

uses
  _Export, uData, uTagComposition;

// ������ �������
procedure TfmRefProduct.Button6Click(Sender: TObject);
begin
  //��������� �����
  Close;
end;

// ��� �������� �����
procedure TfmRefProduct.FormCreate(Sender: TObject);
begin
  // ��������� ������� �������
  ADODataSet.Open;
  // ��������� ������� ����� ��� �������� ������
  ADODataSetType.Open;
end;

// �������� �����
procedure TfmRefProduct.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // ��������� �������
  ADODataSet.Close;
  // ��������� ������� �����
  ADODataSetType.Close;
  // ���������� �����
  Release;
end;

// ������ ����������� ��������
procedure TfmRefProduct.Button7Click(Sender: TObject);
begin
  // ������� ����� ��������-�����������
  with TfmTagComposition.Create(Self) do
  try
  // ������� ����� ��������-�����������
    Execute(ADODataSet.FieldByName('ID_PRODUCT').AsInteger);
  finally
    // ��� �������� �������� ����� - ��������� ��
    Release;
  end;
end;

// ������ �������
procedure TfmRefProduct.Button8Click(Sender: TObject);
begin
  // ������������ ������� � ������
  ExportExcel(ADODataSet);
end;

end.
