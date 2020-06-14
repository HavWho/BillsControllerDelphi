unit BillsController;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Menus, Vcl.ImgList, Vcl.Grids,
  DateUtils, ShellApi;

type
  TUserInfo = record
    Date: TDateTime;
    Status: String;
    Price: Real;
    Quantity: Integer;
    Category, Thing, Who, Where, Commentary: String;
  end;

  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    FileAction: TMenuItem;
    Saving: TMenuItem;
    Open: TMenuItem;
    Close: TMenuItem;
    Service: TMenuItem;
    Help: TMenuItem;
    About: TMenuItem;
    WinCalc: TMenuItem;
    lvDataView: TListView;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    procedure AboutClick(Sender: TObject);
    procedure WinCalcClick(Sender: TObject);
    procedure SavingClick(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    FInfo: array of TUserInfo;
    procedure UpdateList;
    procedure ModelAddItem(Status: string; Price:Real; Quantity: Integer; Category, Thing, Who, Where, Commentary: String);
    procedure ModelEditItem(Index: Integer; Status: string; Price:Real; Quantity: Integer; Category, Thing, Who, Where, Commentary: String);
    procedure RemoveItem(Index: Integer);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
Uses
  InsertUnit;

{$R *.dfm}

procedure TMainForm.UpdateList;
var
  Itm: TListItem;
  i:Integer;
begin
  lvDataView.Items.Clear;
  for i:=Low(FInfo) to High(FInfo) do
  begin
    Itm:=lvDataView.Items.Add;
    Itm.Caption:=DateToStr(Date);
    Itm.SubItems.Add(FInfo[i].Status);
    Itm.SubItems.Add(FInfo[i].Category);
    Itm.SubItems.Add(FInfo[i].Thing);
    Itm.SubItems.Add(FloatToStr(FInfo[i].Price));
    Itm.SubItems.Add(IntToStr(FInfo[i].Quantity));
    Itm.SubItems.Add(FInfo[i].Who);
    Itm.SubItems.Add(FInfo[i].Where);
    Itm.SubItems.Add(FInfo[i].Commentary)
  end;
end;

procedure TMainForm.AboutClick(Sender: TObject);
begin
  ShowMessage('Мешок ''HavWho'' Александр, 951004, апрель 2020')
end;

procedure TMainForm.btnAddClick(Sender: TObject);
var
  Res: TModalResult;
begin
  Res:=DataInsertForm.ShowNewOperation;
  if Res<>mrOk then
    Exit
  else
  begin
    with DataInsertForm do
      ModelAddItem(Status, Price, Quantity, Category, Thing, Who, Where, Commentary);
    ShowMessage('Новая операция успешно добавлена.');
    UpdateList;
  end;
end;

procedure TMainForm.btnDeleteClick(Sender: TObject);
begin
  RemoveItem(lvDataView.ItemIndex);
  UpdateList;
end;

procedure TMainForm.ModelAddItem(Status: String; Price: Real; Quantity: Integer; Category, Thing, Who, Where, Commentary: String);
var
  Index:Integer;
begin
  Index:=Length(FInfo);
  SetLength(FInfo, Index+1);
  FInfo[Index].Status:=Status;
  FInfo[Index].Price:=Price;
  FInfo[Index].Quantity:=Quantity;
  FInfo[Index].Category:=Category;
  FInfo[Index].Thing:=Thing;
  FInfo[Index].Who:=Who;
  FInfo[Index].Where:=Where;
  FInfo[Index].Commentary:=Commentary;
end;

procedure TMainForm.ModelEditItem(Index:Integer; Status: String; Price: Real; Quantity: Integer; Category, Thing, Who, Where, Commentary: String);
begin
  FInfo[Index].Status:=Status;
  FInfo[Index].Price:=Price;
  FInfo[Index].Quantity:=Quantity;
  FInfo[Index].Category:=Category;
  FInfo[Index].Thing:=Thing;
  FInfo[Index].Who:=Who;
  FInfo[Index].Where:=Where;
  FInfo[Index].Commentary:=Commentary
end;

procedure TMainForm.RemoveItem(Index: Integer);
var
  i:Integer;
begin
  if lvDataView.ItemIndex = -1 then
  begin
    ShowMessage('Выберите операцию для удаления!');
    Exit
  end;
  for i:=Index to High(FInfo)-1 do
    FInfo[i]:=FInfo[i+1];
  setLength(FInfo, Length(FInfo)-1)
end;

procedure TMainForm.btnEditClick(Sender: TObject);
var
  Index:Integer;
  Res:TModalResult;
begin
  if lvDataView.ItemIndex = -1 then
  begin
    ShowMessage('Выберите операцию для редактирования!');
    Exit
  end;
  Index:=lvDataView.ItemIndex;
  Res:=DataInsertForm.ShowEditOperation(FInfo[Index].Status, FInfo[Index].Category,
                                        FInfo[Index].Thing, FInfo[Index].Where,
                                        FInfo[Index].Who, FInfo[Index].Commentary,
                                        FInfo[Index].Price, FInfo[Index].Quantity);
  if Res<>mrOk then
    Exit
  else
  begin
    with DataInsertForm do
      ModelEditItem(Index, Status, Price, Quantity, Category, Thing, Who, Where, Commentary);
    UpdateList;
  end;
end;

procedure TMainForm.OpenClick(Sender: TObject);
var
  openDialog: TOpenDialog;
  F: File of Char;
  S:String;
  StringList:TStringList;
  ListItem:TListItem;
  sc:string;
  w,i,p,j:integer;
begin
  try
    openDialog := TOpenDialog.Create(self);
    openDialog.Title := 'Открытие файла';
    openDialog.Filter := 'Текстовый файл|*.txt';
    openDialog.DefaultExt := 'txt';
    openDialog.FilterIndex := 1;
    openDialog.Options := [ofFileMustExist];
    if not openDialog.Execute then Exit;
    StringList:=TStringList.Create;
    StringList.Clear;
    lvDataView.Clear;
    StringList.LoadFromFile(openDialog.FileName);
    setLength(FInfo, 0);
    for i:=0 to StringList.Count+1 do
    begin
      S:=StringList.Strings[i];
      p:=pos(',',s);
      if p>0 then
      begin
        Sc:=copy(s,1,p-1);
        lvDataView.Items.Add.Caption:=Sc;
        Delete(s,1,p);s:=Trim(s);
      end;
      for j:= 0 to 8 do
      begin
        p:=pos(',',s);
        if p>0 then
        begin
          Sc:=copy(s,1,p-1);
          lvDataView.Items.Item[i].SubItems.Add(sc);
          Delete(s,1,p);s:=Trim(s);
        end;
      end;
      w:=pos('*',s);
      Delete(s,1,w);
      s:=Trim(s);
      Setlength(FInfo, 9);
      FInfo[i].Date:=StrToDate(lvDataView.Items.Item[i].Caption);
      FInfo[i].Status:=lvDataView.Items.Item[i].SubItems.Strings[0];
      FInfo[i].Category:=lvDataView.Items.Item[i].SubItems.Strings[1];
      FInfo[i].Thing:=lvDataView.Items.Item[i].SubItems.Strings[2];
      FInfo[i].Price:=StrToInt(lvDataView.Items.Item[i].SubItems.Strings[3]);
      FInfo[i].Quantity:=StrToInt(lvDataView.Items.Item[i].SubItems.Strings[4]);
      FInfo[i].Who:=lvDataView.Items.Item[i].SubItems.Strings[5];
      FInfo[i].Where:=lvDataView.Items.Item[i].SubItems.Strings[6];
    end;
  except
    on E:EStringListError do
      ShowMessage('На форму не добавляется значение комментариев.')
  end;
end;

procedure TMainForm.SavingClick(Sender: TObject);
var
  saveDialog: TSaveDialog;
  F: TextFile;
  i,j: Integer;
  S:String;
begin
  saveDialog := TSaveDialog.Create(self);
  saveDialog.Title := 'Сохранение файла';
  saveDialog.Filter := 'Текстовый файл|*.txt';
  saveDialog.DefaultExt := 'txt';
  saveDialog.FilterIndex := 1;
  if saveDialog.Execute then
  begin
    AssignFile(F, saveDialog.FileName);
    Rewrite(F);
    for i:=0 to (lvDataView.Items.Count - 1) do
    begin
      S :=lvDataView.Items.Item[I].Caption + ',';
      for j:= 0 to lvDataView.Items.Item[I].SubItems.Count - 1 do
        S := S + lvDataView.Items.Item[I].SubItems.Strings[J] + ',';
    SetLength(S, Length(S) - 1);
    WriteLn(F, S);
  end;
  CloseFile(F);
  ShowMessage('Файл успешно сохранён.')
  end
  else
    ShowMessage('Сохранение файла отменено.');
end;

procedure TMainForm.WinCalcClick(Sender: TObject);
begin
  ShellExecute(MainForm.Handle, nil, 'C:\WINDOWS\system32\calc.exe', nil, nil, SW_RESTORE)
end;

End.
