unit CompanyTrans;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TCoTransForm = class(TForm)
    editCompany: TEdit;
    editPhoneNumber: TEdit;
    editAdress: TEdit;
    dbSaveData: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CoTransForm: TCoTransForm;

implementation

{$R *.dfm}

end.
