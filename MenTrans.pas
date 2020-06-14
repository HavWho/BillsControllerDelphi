unit MenTrans;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TWhoTransForm = class(TForm)
    editMenFullName: TEdit;
    editEMail: TEdit;
    editJob: TEdit;
    editHomeAdress: TEdit;
    dbSaveData: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WhoTransForm: TWhoTransForm;

implementation

{$R *.dfm}

end.
