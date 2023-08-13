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

// Кнопка Закрыть
procedure TfmTagPlane.Button6Click(Sender: TObject);
begin
  // Закрываем форму
  Close;
end;

// При создании формы
procedure TfmTagPlane.FormCreate(Sender: TObject);
begin
  // Открываем таблицу планов
  ADOTagPlane.Open;
  // Открываем таблицу продуктов
  ADOProduct.Open;
end;

// При закрытии формы
procedure TfmTagPlane.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Закрываем открытые таблицы
  ADOTagPlane.Close;
  ADOProduct.Close;
  // уничтожаем форму
  Release;
end;

// Кнопка Экспорт в Эксель
procedure TfmTagPlane.Button5Click(Sender: TObject);
begin
  // Отправляем таблицу Планы в Эксель
  ExportExcel(ADOTagPlane);
end;

end.
