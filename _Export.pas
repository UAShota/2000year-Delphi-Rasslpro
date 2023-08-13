unit _Export;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComObj;

function ExportExcel(DataSet: TDataSet): boolean;

implementation

function InternalExportExcel(ArrayData: Variant;
  RowCount, ColCount: integer): boolean;
var
  ExcelApp, Workbook, Range, Cell1, Cell2: Variant;
begin
  Result := True;
  try
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.Application.EnableEvents := False;
    try
      Workbook := ExcelApp.WorkBooks.Add;
      Cell1 := WorkBook.WorkSheets[1].Cells[1, 1];
      Cell2 := WorkBook.WorkSheets[1].Cells[RowCount, ColCount];

      Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
      Range.Value := ArrayData;
    finally
      ExcelApp.Visible := True;
    end;
  except
    Result := False;
  end;
end;

function ExportExcel(DataSet: TDataSet): boolean;
var
  BookM: TBookMark;
  ArrayData: Variant;
  Index: integer;
begin
  Result := True;

  with DataSet do begin
    DisableControls;
    BookM := GetBookmark;
    First;
    ArrayData := VarArrayCreate([1, RecordCount + 2, 1, Fields.Count + 2], varVariant);

    try
      for Index := 1 to Fields.Count do
        if (Fields[Index - 1].Visible) then
      ArrayData[1, Index] := Fields[Index - 1].DisplayName;

      while not Eof do begin
        for Index := 1 to Fields.Count do
          if (Fields[Index - 1].Visible) then
        ArrayData[RecNo + 1, Index] := Fields[Index - 1].AsString;
        Next;
      end;
    finally
      GotoBookMark(BookM);
      FreeBookMark(BookM);
      EnableControls;
      InternalExportExcel(ArrayData, RecordCount + 2, FieldCount + 2);
    end;
  end;
end;

end.
