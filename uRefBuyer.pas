unit uRefBuyer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, Mask, DBCtrls, ExtCtrls;

type
  TfmRefBuyer = class(TForm)
    ADODataSet: TADODataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADODataSetNAME: TWideStringField;
    ADODataSetPHONE: TWideStringField;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    ADODataSetID_BUYER: TAutoIncField;
    ADODataSetSTATE: TBooleanField;
    DBCheckBox1: TDBCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Button7: TButton;
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
  fmRefBuyer: TfmRefBuyer;

implementation

{$R *.dfm}

uses
  _Export, uData, uTagBuyer;

// ������ �������
procedure TfmRefBuyer.Button6Click(Sender: TObject);
begin
  //��������� �����
  Close;
end;

// ��� �������� �����
procedure TfmRefBuyer.FormCreate(Sender: TObject);
begin
  // ��������� ������� �������
  ADODataSet.Open;
end;

// �������� �����
procedure TfmRefBuyer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // ��������� �������
  ADODataSet.Close;
  // ���������� �����
  Release;
end;

// ������ ���������� ���������
procedure TfmRefBuyer.Button7Click(Sender: TObject);
begin
  // ������� ����� ����������-���������
  with TfmTagBuyer.Create(Self) do
  try
    // ��������� �� �� ����������, ���������
    // ��� ����������
    Execute(ADODataSet.FieldByName('ID_BUYER').AsInteger);
  finally
    // ��� �������� ��������� ����� ���������� ��
    Release;
  end;
end;

// ������ �������
procedure TfmRefBuyer.Button8Click(Sender: TObject);
begin
  // ������������ ������� � ������
  ExportExcel(ADODataSet);
end;

end.
