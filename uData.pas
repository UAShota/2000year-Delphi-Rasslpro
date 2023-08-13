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

// ������ ����������� � ��
const
  DEF_CON = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s%s;';
  DEF_MDB = 'database\580080000.mdb';

// ������� ���������� ���� � �������� � ����� ����������
function DataSelfPath: string;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

// ������� ���������� ������ ������ ����������� � ��
function DataBasePath: string;
begin
  Result := Format(DEF_CON, [DataSelfPath, DEF_MDB]);
end;

// ��� �������� ���������
procedure TModuleData.DataModuleCreate(Sender: TObject);
begin
  // ��������� ���������� ���� ��� �������� ���� �������
  // ��� ���������� ����������
  ADOConnection.Close;
  // ���������� ���������� ������ ����������
  ADOConnection.ConnectionString := DataBasePath;
  try
    // �������� ������� ��
    ADOConnection.Open;
  except
    // ���� ��������� ������
    on E: Exception do begin
      // �� ���������� ��������� � ������� ������
      ShowMessage(E.Message);
      // ��������� ����������
      Halt(0);
    end;
  end;
end;

end.
