unit uTagPlane;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids;

type
  TfmTagPlane = class(TForm)
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
    ADOTagPlane: TADODataSet;
    DSTagPlane: TDataSource;
    ADOProduct: TADODataSet;
    DSProduct: TDataSource;
    ADOTagPlaneCOUNT: TIntegerField;
    ADOProductID_PRODUCT: TAutoIncField;
    ADOProductID_TYPE: TIntegerField;
    ADOProductNAME: TWideStringField;
    ADOProductDESCRIPTION: TWideStringField;
    ADOProductSTATE: TBooleanField;
    ADOTagPlaneNAME: TStringField;
    ADOTagPlaneID_PLANE: TAutoIncField;
    ADOTagPlaneID_PRODUCT: TIntegerField;
    Button5: TButton;
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmTagPlane: TfmTagPlane;

implementation

{$R *.dfm}

uses
  _Export;

// ������ �������
procedure TfmTagPlane.Button6Click(Sender: TObject);
begin
  // ��������� �����
  Close;
end;

// ��� �������� �����
procedure TfmTagPlane.FormCreate(Sender: TObject);
begin
  // ��������� ������� ������
  ADOTagPlane.Open;
  // ��������� ������� ���������
  ADOProduct.Open;
end;

// ��� �������� �����
procedure TfmTagPlane.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // ��������� �������� �������
  ADOTagPlane.Close;
  ADOProduct.Close;
  // ���������� �����
  Release;
end;

// ������ ������� � ������
procedure TfmTagPlane.Button5Click(Sender: TObject);
begin
  // ���������� ������� ����� � ������
  ExportExcel(ADOTagPlane);
end;

end.
