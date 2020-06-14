program BillControllerMain;

uses
  Vcl.Forms,
  Unit1 in 'BillsController.pas' {MainForm},
  InsertUnit in 'InsertUnit.pas' {DataInsertForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDataInsertForm, DataInsertForm);
  Application.Run;
end.
