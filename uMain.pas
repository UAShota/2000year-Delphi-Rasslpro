unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdActns, ActnList, Menus, StdCtrls, ExtCtrls, jpeg, ComCtrls, ShellAPI;

type
  TfmMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    N5: TMenuItem;
    SelectAll1: TMenuItem;
    Undo1: TMenuItem;
    N6: TMenuItem;
    ActionList1: TActionList;
    ACRefType: TAction;
    ACProduct: TAction;
    ACIngredient: TAction;
    ACSeller: TAction;
    ACBuyer: TAction;
    ACPlane: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    paMain: TPanel;
    Image1: TImage;
    paInfo: TPanel;
    Timer1: TTimer;
    procedure ACRefTypeExecute(Sender: TObject);
    procedure ACProductExecute(Sender: TObject);
    procedure ACIngredientExecute(Sender: TObject);
    procedure ACSellerExecute(Sender: TObject);
    procedure ACBuyerExecute(Sender: TObject);
    procedure ACPlaneExecute(Sender: TObject);
    procedure ActionList1Execute(Action: TBasicAction;
      var Handled: Boolean);
    procedure N3Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

// Подключаемые юнитыПодключаемые юниты
uses
  uData, uRefBuyer, uRefSeller, uRefIngredient, uRefType, uRefProduct,
  uTagPlane, uAbout;

{$R *.dfm}

// Константы для надписи на панели
const
  CAPT_DEAULT = 'Для начала работы откройте пункт меню Файл и выберите необходимый модуль';
  CAPT_TABLE = 'Модуль: %s';

// При выборе модуля в меню
procedure TfmMain.ActionList1Execute(Action: TBasicAction;
  var Handled: Boolean);
begin
  // Если открыта какая либо форма
  if (paMain.ControlCount > 1) then
		// то закрываем ее
    TForm(paMain.Controls[1]).Close;
end;

// Меню - закрыть
procedure TfmMain.N3Click(Sender: TObject);
begin
  // Закрываем приложение
  Close;
end;

// Таймер, смотрящий есть ли открытый модуль
procedure TfmMain.Timer1Timer(Sender: TObject);
begin
  // Если открытых модуле нет, то меняем надпись на верхней панели
  if (paMain.ControlCount = 1) then paInfo.Caption := CAPT_DEAULT;
end;

// Меню - справочник типов
procedure TfmMain.ACRefTypeExecute(Sender: TObject);
begin
  // Если справочник типов не открыт
  if (fmRefType = nil) then
  // То создаем форму "справочник типов"
  with TfmRefType.Create(Self) do
  begin
    // Выставляем название модуля на верхнюю панель
    paInfo.Caption := Format(CAPT_TABLE, [Caption]);
    // Родитель создаваемой формы панель - панель на главной форме
    Parent := paMain;
    // Показываем созданную форму
    Show();
  // Но если форма уже существует - то выдвигаем ее на передний план
  end else fmRefType.BringToFront;
end;

// Меню - справочник продуктов
procedure TfmMain.ACProductExecute(Sender: TObject);
begin
  if (fmRefProduct = nil) then
  with TfmRefProduct.Create(Self) do
  begin
    // Выставляем название модуля на верхнюю панель
    paInfo.Caption := Format(CAPT_TABLE, [Caption]);
    // Родитель создаваемой формы панель - панель на главной форме
    Parent := paMain;
    // Показываем созданную форму
    Show();
  // Но если форма уже существует - то выдвигаем ее на передний план
  end else fmRefProduct.BringToFront;
end;

// Меню - справочник ингредиентов
procedure TfmMain.ACIngredientExecute(Sender: TObject);
begin
  if (fmRefIngredient = nil) then
  with TfmRefIngredient.Create(Self) do
  begin
    // Выставляем название модуля на верхнюю панель
    paInfo.Caption := Format(CAPT_TABLE, [Caption]);
    // Родитель создаваемой формы панель - панель на главной форме
    Parent := paMain;
    // Показываем созданную форму
    Show();
  // Но если форма уже существует - то выдвигаем ее на передний план
  end else fmRefIngredient.BringToFront;
end;

// Меню - справочник поставщиков
procedure TfmMain.ACSellerExecute(Sender: TObject);
begin
  if (fmRefSeller = nil) then
  with TfmRefSeller.Create(Self) do
  begin
    // Выставляем название модуля на верхнюю панель
    paInfo.Caption := Format(CAPT_TABLE, [Caption]);
    // Родитель создаваемой формы панель - панель на главной форме
    Parent := paMain;
    // Показываем созданную форму
    Show();
  // Но если форма уже существует - то выдвигаем ее на передний план
  end else fmRefSeller.BringToFront;
end;

// Меню - справчник покупателей
procedure TfmMain.ACBuyerExecute(Sender: TObject);
begin
  if (fmRefBuyer = nil) then
  with TfmRefBuyer.Create(Self) do
  begin
    // Выставляем название модуля на верхнюю панель
    paInfo.Caption := Format(CAPT_TABLE, [Caption]);
    // Родитель создаваемой формы панель - панель на главной форме
    Parent := paMain;
    // Показываем созданную форму
    Show();
  // Но если форма уже существует - то выдвигаем ее на передний план
  end else fmRefBuyer.BringToFront;
end;

// Меню - справочник плана
procedure TfmMain.ACPlaneExecute(Sender: TObject);
begin
  if (fmTagPlane = nil) then
  with TfmTagPlane.Create(Self) do
  begin
    // Выставляем название модуля на верхнюю панель
    paInfo.Caption := Format(CAPT_TABLE, [Caption]);
    // Родитель создаваемой формы панель - панель на главной форме
    Parent := paMain;
    // Показываем созданную форму
    Show();
  // Но если форма уже существует - то выдвигаем ее на передний план
  end else fmTagPlane.BringToFront;
end;

// Меню = О программе
procedure TfmMain.N16Click(Sender: TObject);
begin
  // Создаем форму "О программе"
  with TAboutBox.Create(Self) do
  try
    // Показываем модальное окно
    ShowModal();
  finally
    // При закрытии формы - уничтожаем ее
    Release;
  end;
end;

// Меню - Справка
procedure TfmMain.N15Click(Sender: TObject);
begin
  // Запускаем ранее подготовленный HTML документ со справкой
  ShellExecute(Handle, 'open', PChar(DataSelfPath + 'help\help.htm'), '', '', SW_SHOW);
end;

end.
