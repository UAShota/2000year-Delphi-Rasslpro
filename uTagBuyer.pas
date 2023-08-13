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

// Кнопка Закрыть
procedure TfmTagBuyer.Button6Click(Sender: TObject);
begin
  // Закрываем форму
  Close;
end;

// При редактировании продуктов
procedure TfmTagBuyer.ADOTagBuyerBeforePost(DataSet: TDataSet);
begin
  // Добавляем код покупателя в покупаемый продукт
  ADOTagBuyerID_BUYER.AsInteger := FIdBuyer;
end;

// Выполнение модуля покупки продуктов
// Принимает параметр Код Покупателя
procedure TfmTagBuyer.Execute(IdBuyer: integer);
begin
  // Сохраняем Код Покупателя
  FIdBuyer := IdBuyer;
  // Добавляем Код Покупателя в запрос чтобы выбрать только те товары,
  // которые покупает указанный покупатель
  ADOTagBuyer.Parameters.ParamByName('ID').Value := FIdBuyer;
  // Открываем таблицу Покупатели
  ADOTagBuyer.Open;
  // Открываем таблицу Продукты
  ADOProduct.Open;
  // Показываем форму модально
  ShowModal();
end;

// При закрытии формы
procedure TfmTagBuyer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // Закрываем открытые таблицы
  ADOTagBuyer.Close;
  ADOProduct.Close;
end;

// Кнопка Экспорт в Эксель
procedure TfmTagBuyer.Button5Click(Sender: TObject);
begin
  // Отправляем таблицу Покупатели в Эксель 
  ExportExcel(ADOTagBuyer);
end;

end.
