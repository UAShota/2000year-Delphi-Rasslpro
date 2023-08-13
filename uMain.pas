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

// ������������ ����������������� �����
uses
  uData, uRefBuyer, uRefSeller, uRefIngredient, uRefType, uRefProduct,
  uTagPlane, uAbout;

{$R *.dfm}

// ��������� ��� ������� �� ������
const
  CAPT_DEAULT = '��� ������ ������ �������� ����� ���� ���� � �������� ����������� ������';
  CAPT_TABLE = '������: %s';

// ��� ������ ������ � ����
procedure TfmMain.ActionList1Execute(Action: TBasicAction;
  var Handled: Boolean);
begin
  // ���� ������� ����� ���� �����
  if (paMain.ControlCount > 1) then
		// �� ��������� ��
    TForm(paMain.Controls[1]).Close;
end;

// ���� - �������
procedure TfmMain.N3Click(Sender: TObject);
begin
  // ��������� ����������
  Close;
end;

// ������, ��������� ���� �� �������� ������
procedure TfmMain.Timer1Timer(Sender: TObject);
begin
  // ���� �������� ������ ���, �� ������ ������� �� ������� ������
  if (paMain.ControlCount = 1) then paInfo.Caption := CAPT_DEAULT;
end;

// ���� - ���������� �����
procedure TfmMain.ACRefTypeExecute(Sender: TObject);
begin
  // ���� ���������� ����� �� ������
  if (fmRefType = nil) then
  // �� ������� ����� "���������� �����"
  with TfmRefType.Create(Self) do
  begin
    // ���������� �������� ������ �� ������� ������
    paInfo.Caption := Format(CAPT_TABLE, [Caption]);
    // �������� ����������� ����� ������ - ������ �� ������� �����
    Parent := paMain;
    // ���������� ��������� �����
    Show();
  // �� ���� ����� ��� ���������� - �� ��������� �� �� �������� ����
  end else fmRefType.BringToFront;
end;

// ���� - ���������� ���������
procedure TfmMain.ACProductExecute(Sender: TObject);
begin
  if (fmRefProduct = nil) then
  with TfmRefProduct.Create(Self) do
  begin
    // ���������� �������� ������ �� ������� ������
    paInfo.Caption := Format(CAPT_TABLE, [Caption]);
    // �������� ����������� ����� ������ - ������ �� ������� �����
    Parent := paMain;
    // ���������� ��������� �����
    Show();
  // �� ���� ����� ��� ���������� - �� ��������� �� �� �������� ����
  end else fmRefProduct.BringToFront;
end;

// ���� - ���������� ������������
procedure TfmMain.ACIngredientExecute(Sender: TObject);
begin
  if (fmRefIngredient = nil) then
  with TfmRefIngredient.Create(Self) do
  begin
    // ���������� �������� ������ �� ������� ������
    paInfo.Caption := Format(CAPT_TABLE, [Caption]);
    // �������� ����������� ����� ������ - ������ �� ������� �����
    Parent := paMain;
    // ���������� ��������� �����
    Show();
  // �� ���� ����� ��� ���������� - �� ��������� �� �� �������� ����
  end else fmRefIngredient.BringToFront;
end;

// ���� - ���������� �����������
procedure TfmMain.ACSellerExecute(Sender: TObject);
begin
  if (fmRefSeller = nil) then
  with TfmRefSeller.Create(Self) do
  begin
    // ���������� �������� ������ �� ������� ������
    paInfo.Caption := Format(CAPT_TABLE, [Caption]);
    // �������� ����������� ����� ������ - ������ �� ������� �����
    Parent := paMain;
    // ���������� ��������� �����
    Show();
  // �� ���� ����� ��� ���������� - �� ��������� �� �� �������� ����
  end else fmRefSeller.BringToFront;
end;

// ���� - ��������� �����������
procedure TfmMain.ACBuyerExecute(Sender: TObject);
begin
  if (fmRefBuyer = nil) then
  with TfmRefBuyer.Create(Self) do
  begin
    // ���������� �������� ������ �� ������� ������
    paInfo.Caption := Format(CAPT_TABLE, [Caption]);
    // �������� ����������� ����� ������ - ������ �� ������� �����
    Parent := paMain;
    // ���������� ��������� �����
    Show();
  // �� ���� ����� ��� ���������� - �� ��������� �� �� �������� ����
  end else fmRefBuyer.BringToFront;
end;

// ���� - ���������� �����
procedure TfmMain.ACPlaneExecute(Sender: TObject);
begin
  if (fmTagPlane = nil) then
  with TfmTagPlane.Create(Self) do
  begin
    // ���������� �������� ������ �� ������� ������
    paInfo.Caption := Format(CAPT_TABLE, [Caption]);
    // �������� ����������� ����� ������ - ������ �� ������� �����
    Parent := paMain;
    // ���������� ��������� �����
    Show();
  // �� ���� ����� ��� ���������� - �� ��������� �� �� �������� ����
  end else fmTagPlane.BringToFront;
end;

// ���� = � ���������
procedure TfmMain.N16Click(Sender: TObject);
begin
  // ������� ����� "� ���������"
  with TAboutBox.Create(Self) do
  try
    // ���������� ��������� ����
    ShowModal();
  finally
    // ��� �������� ����� - ���������� ��
    Release;
  end;
end;

// ���� - �������
procedure TfmMain.N15Click(Sender: TObject);
begin
  // ��������� ����� �������������� HTML �������� �� ��������
  ShellExecute(Handle, 'open', PChar(DataSelfPath + 'help\help.htm'), '', '', SW_SHOW);
end;

end.
