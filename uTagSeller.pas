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

// Кнопка - Закрыть
procedure TfmTagSeller.Button6Click(Sender: TObject);
begin
  // Закрываем форму
  Close;
end;

// При записи нового ингридиента
procedure TfmTagSeller.ADOTagSellerBeforePost(DataSet: TDataSet);
begin
  // Подставляем в поля Поставщик код поставщика, с которым работаем
  ADOTagSellerID_SELLER.AsInteger := FIdSeller;
end;

// Выполнение модуля Поставщики
// Принимает параметр - Код Поставщика с которым будеи\м работать
procedure TfmTagSeller.Execute(IdSeller: integer);
begin
  // сохраняем код поставщика
  FIdSeller := IdSeller;
  // Добавяяем в запрос параметр Код Поставщика
  // Чтобы вытащить только те ингредиенты, которые имеются
  // У указанного Кода Поставщика
  ADOTagSeller.Parameters.ParamByName('ID').Value := FIdSeller;
  // Открываем таблицу поставщиков
  ADOTagSeller.Open;
  // Открываем таблицу ингредиентов
  ADOIngredient.Open;
  // Показываем эту форму модально
  ShowModal();
end;

// При закрытии формы
procedure TfmTagSeller.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // Закрываем все открытые таблицы
  ADOTagSeller.Close;
  ADOIngredient.Close;
end;

// Кнопка Экспорт
procedure TfmTagSeller.Button5Click(Sender: TObject);
begin
  // Экспорируем таблицу поставщиков в Эксель
  ExportExcel(ADOTagSeller);
end;

end.
