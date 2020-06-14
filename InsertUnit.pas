unit InsertUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TUserInfo = record
    Data: TDateTime;
    Price: Integer;
    Status, Category, Thing, WhoIs, WhereWas, Commentary:String;
  end;

  TDataInsertForm = class(TForm)
    labCategory: TLabel;
    editCategory: TEdit;
    labThing: TLabel;
    editThing: TEdit;
    labPrice: TLabel;
    editPrice: TEdit;
    labQuantity: TLabel;
    editQuantity: TEdit;
    labWho: TLabel;
    labWhere: TLabel;
    bnAddButton: TButton;
    labStatus: TLabel;
    cbStatus: TComboBox;
    editWho: TEdit;
    editWhere: TEdit;
    editCommentary: TEdit;
    labCommentary: TLabel;
    procedure bnAddButtonClick(Sender: TObject);
  private
    function GetStatus: string;
    function GetCategory: string;
    function GetThing: string;
    function GetDate: TDateTime;
    function GetWhere: string;
    function GetWho: string;
    function GetCommentary: string;
    function GetPrice: Real;
    function GetQuantity: integer;
  public
    property Status: string read GetStatus;
    property Category: string read GetCategory;
    property Thing: string read GetThing;
    property Date: TDateTime read GetDate;
    property Where: string read GetWhere;
    property Who: string read GetWho;
    property Commentary: string read GetCommentary;
    property Price: Real read GetPrice;
    property Quantity: integer read GetQuantity;
    function ShowNewOperation: integer;
    function ShowEditOperation(var Status, Category, Thing: String; var Where, Who, Commentary: String; var Price: Real; var Quantity:Integer):Integer;
  end;

var
  DataInsertForm: TDataInsertForm;

implementation
Uses BillsController;

{$R *.dfm}
function TDataInsertForm.ShowEditOperation(var Status: string; var Category: string;
                                           var Thing: string; var Where: string;
                                           var Who: string; var Commentary: string;
                                           var Price: Real; var Quantity: Integer):integer;
begin
  cbStatus.Text:=Status;
  editCategory.Text:=Category;
  editThing.Text:=Thing;
  editWhere.Text:=Where;
  editWho.Text:=Who;
  editCommentary.Text:=Commentary;
  editPrice.Text:=FloatToStr(Price);
  editQuantity.Text:=IntToStr(Quantity);
  Result:=ShowModal
end;

function TDataInsertForm.ShowNewOperation;
begin
  cbStatus.Text:='';
  editCategory.Text:='';
  editThing.Text:='';
  editWhere.Text:='';
  editWho.Text:='';
  editCommentary.Text:='';
  editPrice.Text:='';
  editQuantity.Text:='';
  Result:=ShowModal
end;

function TDataInsertForm.GetStatus: string;
begin
  Result:=cbStatus.Text
end;

procedure TDataInsertForm.bnAddButtonClick(Sender: TObject);
begin
  ModalResult:=mrOK;
end;

function TDataInsertForm.GetCategory: string;
begin
  Result:=editCategory.Text
end;

function TDataInsertForm.GetQuantity: Integer;
var
  Trans: String;
  errorPos: integer;
begin
  Trans:=editQuantity.Text;
  Val(Trans, Result, errorPos);
  if errorPos<>0 then
    ShowMessage('Вы ввели буквенные значения в строку. Ваше значение количества товара обрежется до ошибочного символа.');
  if Result<0 then
  begin
    ShowMessage('Введено невозможное значение количества товара: измените его.')
  end;
end;

function TDataInsertForm.GetThing: string;
begin
  Result:=editThing.Text
end;

function TDataInsertForm.GetDate: TDateTime;
begin
  Result:=Date
end;

function TDataInsertForm.GetWhere: string;
begin
  Result:=editWhere.Text
end;

function TDataInsertForm.GetWho: string;
begin
  Result:=editWho.Text
end;

function TDataInsertForm.GetCommentary: string;
begin
  Result:=editCommentary.Text
end;

function TDataInsertForm.GetPrice: Real;
var
  Trans: String;
  errorPos: integer;
begin
  Trans:=editPrice.Text;
  Val(Trans, Result, errorPos);
  if (errorPos<>0) then
    ShowMessage('Вы ввели неправильные значения в строку. Ваше значение стоимости обрежется до ошибочного символа.');
  if Result<0 then
  begin
    ShowMessage('Введено невозможное значение стоимости товара: измените его.')
  end;
end;

end.
