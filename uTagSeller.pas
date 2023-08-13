unit uTagSeller;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls, DBCtrls, Mask;

type
  TfmTagSeller = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Bevel1: TBevel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button6: TButton;
    ADOTagSeller: TADODataSet;
    DSTagSeller: TDataSource;
    ADOIngredient: TADODataSet;
    DSIngredient: TDataSource;
    ADOIngredientID_INGREDIENT: TAutoIncField;
    ADOIngredientNAME: TWideStringField;
    ADOIngredientSTATE: TBooleanField;
    ADOTagSellerCOUNT: TIntegerField;
    ADOTagSellerID_SELLER: TIntegerField;
    ADOTagSellerID_INGREDIENT: TIntegerField;
    ADOTagSellerNAME: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Button5: TButton;
    procedure Button6Click(Sender: TObject);
    procedure ADOTagSellerBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    FIdSeller: integer;
  public
    { Public declarations }
    procedure Execute(IdSeller: integer);
  end;

var
  fmTagSeller: TfmTagSeller;

implementation

{$R *.dfm}

uses
  _Export, uData;

// ������ - �������
procedure TfmTagSeller.Button6Click(Sender: TObject);
begin
  // ��������� �����
  Close;
end;

// ��� ������ ������ �����������
procedure TfmTagSeller.ADOTagSellerBeforePost(DataSet: TDataSet);
begin
  // ����������� � ���� ��������� ��� ����������, � ������� ��������
  ADOTagSellerID_SELLER.AsInteger := FIdSeller;
end;

// ���������� ������ ����������
// ��������� �������� - ��� ���������� � ������� �����\� ��������
procedure TfmTagSeller.Execute(IdSeller: integer);
begin
  // ��������� ��� ����������
  FIdSeller := IdSeller;
  // ��������� � ������ �������� ��� ����������
  // ����� �������� ������ �� �����������, ������� �������
  // � ���������� ���� ����������
  ADOTagSeller.Parameters.ParamByName('ID').Value := FIdSeller;
  // ��������� ������� �����������
  ADOTagSeller.Open;
  // ��������� ������� ������������
  ADOIngredient.Open;
  // ���������� ��� ����� ��������
  ShowModal();
end;

// ��� �������� �����
procedure TfmTagSeller.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // ��������� ��� �������� �������
  ADOTagSeller.Close;
  ADOIngredient.Close;
end;

// ������ �������
procedure TfmTagSeller.Button5Click(Sender: TObject);
begin
  // ����������� ������� ����������� � ������
  ExportExcel(ADOTagSeller);
end;

end.
