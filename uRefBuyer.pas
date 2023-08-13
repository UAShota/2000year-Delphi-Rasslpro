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

// Кнопка Закрыть
procedure TfmRefBuyer.Button6Click(Sender: TObject);
begin
  //Закрываем форму
  Close;
end;

// При создании формы
procedure TfmRefBuyer.FormCreate(Sender: TObject);
begin
  // Открываем главную таблицу
  ADODataSet.Open;
end;

// Закрытие формы
procedure TfmRefBuyer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Закрываем таблицы
  ADODataSet.Close;
  // Уничтожаем форму
  Release;
end;

// Кнопка Покупаемая Продукция
procedure TfmRefBuyer.Button7Click(Sender: TObject);
begin
  // Создаем форму Покупатель-Продукция
  with TfmTagBuyer.Create(Self) do
  try
    // Запускаем ее на выполнение, передавая
    // Код Покупателя
    Execute(ADODataSet.FieldByName('ID_BUYER').AsInteger);
  finally
    // При закрытии модальной формы уничтожаем ее
    Release;
  end;
end;

// Кнопка Экспорт
procedure TfmRefBuyer.Button8Click(Sender: TObject);
begin
  // Экспортируем таблицу в Эксель
  ExportExcel(ADODataSet);
end;

end.
