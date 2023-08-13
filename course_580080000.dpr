program course_580080000;

uses
  Forms,
  uMain in 'uMain.pas' {fmMain},
  uData in 'uData.pas' {ModuleData: TDataModule},
  uRefBuyer in 'uRefBuyer.pas' {fmRefBuyer},
  uRefSeller in 'uRefSeller.pas' {fmRefSeller},
  uRefIngredient in 'uRefIngredient.pas' {fmRefIngredient},
  uRefType in 'uRefType.pas' {fmRefType},
  uRefProduct in 'uRefProduct.pas' {fmRefProduct},
  uTagSeller in 'uTagSeller.pas' {fmTagSeller},
  uTagBuyer in 'uTagBuyer.pas' {fmTagBuyer},
  uTagComposition in 'uTagComposition.pas' {fmTagComposition},
  uTagPlane in 'uTagPlane.pas' {fmTagPlane},
  uAbout in 'uAbout.pas' {AboutBox},
  _Export in '_Export.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'БД "Кондитерская фабрика"';
  Application.CreateForm(TModuleData, ModuleData);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
