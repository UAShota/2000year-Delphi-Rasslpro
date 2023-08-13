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

// Выполнение модуля Игредиенты Продукции
// Принимает код продукта, для которого редактируются ингредиенты
procedure TfmTagComposition.Execute(IdProduct: integer);
begin
  // Сохраняем код текущего продукта
  FIdProduct := IdProduct;
  // Добавляем Код Продукта в запросу по выбору
  // ингредиентов для продуктов
  ADOTagProduct.Parameters.ParamByName('ID').Value := FIdProduct;
  // Открываем таблицу Продукты
  ADOTagProduct.Open;
  // Открываем таблицу Ингредиенты
  ADOIngredient.Open;
  // Показываем форму модально
  ShowModal();
end;

// При редактировании ингредиентов
procedure TfmTagComposition.ADOTagProductBeforePost(DataSet: TDataSet);
begin
  // Добавляем в редактируемый ингредиент
  // Код ранее заданного продукта
  ADOTagProductID_PRODUCT.AsInteger := FIdProduct;
end;

// Кнопка Закрыть
procedure TfmTagComposition.Button6Click(Sender: TObject);
begin
  // Закрываем приложение
  Close;
end;

// При закрытии формы
procedure TfmTagComposition.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // Закрываем открытые таблицы
  ADOTagProduct.Close;
  ADOIngredient.Close;
end;

// Кнопка Экспорт в Эксель
procedure TfmTagComposition.Button5Click(Sender: TObject);
begin
  // Отправляем таблицу продуктов в Эксель
  ExportExcel(ADOTagProduct);
end;

end.
