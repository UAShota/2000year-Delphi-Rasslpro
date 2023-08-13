unit uTagComposition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids;

type
  TfmTagComposition = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button6: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    ADOTagProduct: TADODataSet;
    DSTagProduct: TDataSource;
    ADOIngredient: TADODataSet;
    ADOIngredientID_INGREDIENT: TAutoIncField;
    ADOIngredientNAME: TWideStringField;
    ADOIngredientSTATE: TBooleanField;
    DSIngredient: TDataSource;
    ADOTagProductID_PRODUCT: TIntegerField;
    ADOTagProductID_INGRIDIENT: TIntegerField;
    ADOTagProductCOUNT: TIntegerField;
    ADOTagProductNAME: TStringField;
    Button5: TButton;
    procedure ADOTagProductBeforePost(DataSet: TDataSet);
    procedure Button6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    FIdProduct: integer;
  public
    { Public declarations }
    procedure Execute(IdProduct: integer);
  end;

var
  fmTagComposition: TfmTagComposition;

implementation

{$R *.dfm}

uses
  _Export;

// ���������� ������ ���������� ���������
// ��������� ��� ��������, ��� �������� ������������� �����������
procedure TfmTagComposition.Execute(IdProduct: integer);
begin
  // ��������� ��� �������� ��������
  FIdProduct := IdProduct;
  // ��������� ��� �������� � ������� �� ������
  // ������������ ��� ���������
  ADOTagProduct.Parameters.ParamByName('ID').Value := FIdProduct;
  // ��������� ������� ��������
  ADOTagProduct.Open;
  // ��������� ������� �����������
  ADOIngredient.Open;
  // ���������� ����� ��������
  ShowModal();
end;

// ��� �������������� ������������
procedure TfmTagComposition.ADOTagProductBeforePost(DataSet: TDataSet);
begin
  // ��������� � ������������� ����������
  // ��� ����� ��������� ��������
  ADOTagProductID_PRODUCT.AsInteger := FIdProduct;
end;

// ������ �������
procedure TfmTagComposition.Button6Click(Sender: TObject);
begin
  // ��������� ����������
  Close;
end;

// ��� �������� �����
procedure TfmTagComposition.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // ��������� �������� �������
  ADOTagProduct.Close;
  ADOIngredient.Close;
end;

// ������ ������� � ������
procedure TfmTagComposition.Button5Click(Sender: TObject);
begin
  // ���������� ������� ��������� � ������
  ExportExcel(ADOTagProduct);
end;

end.
