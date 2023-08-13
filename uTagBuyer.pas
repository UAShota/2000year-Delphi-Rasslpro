unit uTagBuyer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids;

type
  TfmTagBuyer = class(TForm)
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
    ADOTagBuyer: TADODataSet;
    DSTagBuyer: TDataSource;
    ADOProduct: TADODataSet;
    ADOProductNAME: TWideStringField;
    ADOProductSTATE: TBooleanField;
    DSProduct: TDataSource;
    ADOProductID_PRODUCT: TAutoIncField;
    ADOTagBuyerID_BUYER: TIntegerField;
    ADOTagBuyerID_PRODUCT: TIntegerField;
    ADOTagBuyerCOUNT: TIntegerField;
    ADOTagBuyerNAME: TStringField;
    Button5: TButton;
    procedure Button6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ADOTagBuyerBeforePost(DataSet: TDataSet);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    FIdBuyer: integer;
  public
    { Public declarations }
    procedure Execute(IdBuyer: integer);
  end;

var
  fmTagBuyer: TfmTagBuyer;

implementation

{$R *.dfm}

uses
  _Export, uData;

// ������ �������
procedure TfmTagBuyer.Button6Click(Sender: TObject);
begin
  // ��������� �����
  Close;
end;

// ��� �������������� ���������
procedure TfmTagBuyer.ADOTagBuyerBeforePost(DataSet: TDataSet);
begin
  // ��������� ��� ���������� � ���������� �������
  ADOTagBuyerID_BUYER.AsInteger := FIdBuyer;
end;

// ���������� ������ ������� ���������
// ��������� �������� ��� ����������
procedure TfmTagBuyer.Execute(IdBuyer: integer);
begin
  // ��������� ��� ����������
  FIdBuyer := IdBuyer;
  // ��������� ��� ���������� � ������ ����� ������� ������ �� ������,
  // ������� �������� ��������� ����������
  ADOTagBuyer.Parameters.ParamByName('ID').Value := FIdBuyer;
  // ��������� ������� ����������
  ADOTagBuyer.Open;
  // ��������� ������� ��������
  ADOProduct.Open;
  // ���������� ����� ��������
  ShowModal();
end;

// ��� �������� �����
procedure TfmTagBuyer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // ��������� �������� �������
  ADOTagBuyer.Close;
  ADOProduct.Close;
end;

// ������ ������� � ������
procedure TfmTagBuyer.Button5Click(Sender: TObject);
begin
  // ���������� ������� ���������� � ������ 
  ExportExcel(ADOTagBuyer);
end;

end.
