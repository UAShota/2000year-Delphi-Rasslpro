unit uRefSeller;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, DBCtrls, Mask, ExtCtrls, Grids, DBGrids;

type
  TfmRefSeller = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    DBCheckBox1: TDBCheckBox;
    ADODataSet: TADODataSet;
    ADODataSetNAME: TWideStringField;
    ADODataSetPHONE: TWideStringField;
    ADODataSetSTATE: TBooleanField;
    DataSource1: TDataSource;
    ADODataSetID_SELLER: TAutoIncField;
    Button7: TButton;
    Bevel2: TBevel;
    Button8: TButton;
    procedure Button6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRefSeller: TfmRefSeller;

implementation

{$R *.dfm}

uses
  _Export, uData, uTagSeller;

// Кнопка Закрыть
procedure TfmRefSeller.Button6Click(Sender: TObject);
begin
  //Закрываем форму
  Close;
end;

// При создании формы
procedure TfmRefSeller.FormCreate(Sender: TObject);
begin
  // Открываем главную таблицу
  ADODataSet.Open;
end;

// Закрытие формы
procedure TfmRefSeller.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Закрываем таблицы
  ADODataSet.Close;
  // Уничтожаем форму
  Release;
end;

// Кнопка Поставляемые Ингредиенты
procedure TfmRefSeller.Button7Click(Sender: TObject);
begin
  // Создаем форму Поставщики-Ингредиенты
  with TfmTagSeller.Create(Self) do
  try
    // Запускаем ее на выполнение, передавая
    // Код Поставщика
    Execute(ADODataSet.FieldByName('ID_SELLER').AsInteger);
  finally
    // При закрытии модалной формы - уничтожим ее
    Release;
  end;    
end;

// Кнопка Экспорт
procedure TfmRefSeller.Button8Click(Sender: TObject);
begin
  // Экспортируем таблицу в Эксель
  ExportExcel(ADODataSet);
end;

end.
