unit uData;

interface

uses
  SysUtils, Classes, DB, ADODB, DBActns, StdActns, ActnList, 
  XPMan, Dialogs;

type
  TModuleData = class(TDataModule)
    ADOConnection: TADOConnection;
    ActionList: TActionList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditDelete1: TEditDelete;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    DataSetRefresh1: TDataSetRefresh;
    XPManifest: TXPManifest;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModuleData: TModuleData;

function DataSelfPath: string;  

implementation

{$R *.dfm}

// Строки подключения к БД
const
  DEF_CON = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s%s;';
  DEF_MDB = 'database\580080000.mdb';

// Функция возвращает путь к каталогу с нашей программой
function DataSelfPath: string;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

// Фуекция возвращает полную строку подключения к БД
function DataBasePath: string;
begin
  Result := Format(DEF_CON, [DataSelfPath, DEF_MDB]);
end;

// При создании программы
procedure TModuleData.DataModuleCreate(Sender: TObject);
begin
  // Закрываем соединение если оно случайно было открыто
  // при разработке приложения
  ADOConnection.Close;
  // Выставляем правильную строку соединения
  ADOConnection.ConnectionString := DataBasePath;
  try
    // Пытаемся открыть БД
    ADOConnection.Open;
  except
    // Если произошла ошибка
    on E: Exception do begin
      // То показываем сообщение с текстом ошибки
      ShowMessage(E.Message);
      // Закрываем приложение
      Halt(0);
    end;
  end;
end;

end.
