unit uRefIngredient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, DBCtrls, Mask, ExtCtrls, Grids, DBGrids;

type
  TfmRefIngredient = class(TForm)
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
    DataSource1: TDataSource;
    ADODataSetID_INGREDIENT: TAutoIncField;
    Button7: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRefIngredient: TfmRefIngredient;

implementation

{$R *.dfm}

uses
  _Export, uData;

// ������ �������
procedure TfmRefIngredient.Button6Click(Sender: TObject);
begin
  //��������� �����
  Close;
end;

// ��� �������� �����
procedure TfmRefIngredient.FormCreate(Sender: TObject);
begin
  // ��������� ������� �������
  ADODataSet.Open;
end;

// �������� �����
procedure TfmRefIngredient.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // ��������� �������
  ADODataSet.Close;
  // ���������� �����
  Release;
end;

// ������ �������
procedure TfmRefIngredient.Button7Click(Sender: TObject);
begin
  // ������������ ������� � ������
  ExportExcel(ADODataSet);
end;

end.
