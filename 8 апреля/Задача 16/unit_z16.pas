unit unit_z16;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, math, unitmod16;

type

  { TForm_s }

  TForm_s {объект этого класса}= class(TForm) //класс формы
    Button1: TButton;                          //поля этого класса идут отсюда
    Edit_d: TEdit;
    Label_result: TLabel;
    Label_duga: TLabel;
    MainMenu1: TMainMenu;
    Result: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;            //и заканчиваются здесь
    procedure Button1Click(Sender: TObject);     //все процедуры являются методами класса
    procedure MenuItem2Click(Sender: TObject); //их определения находится в секции implementation
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure DataFromForm();
  private

  public

  end;

var
  Form_s: TForm_s;
  l:real;

implementation

{$R *.lfm}

{ TForm_s }

procedure TForm_s.DataFromForm();
begin

  if TryStrToFloat(Edit_d.text,l) = false then
  begin
     Edit_d.Color:=clRed;
     ShowMessage('Неправильно введён параметр l');
     exit;
  end;

  if TryStrToFloat(Edit_d.text,l) = true then
  begin
     Edit_d.Color:=clWhite;
     exit;
  end;

end;


procedure TForm_s.Button1Click(Sender: TObject);
   var s: real;
 begin
DataFromForm();
s:=Ploshad(l);
Result.Lines.append(FloatToStr(s));
end;



procedure TForm_s.MenuItem2Click(Sender: TObject);
begin
  if savedialog1.Execute then
  begin
    DataFromForm();
    save_params(l, SaveDialog1.FileName);
  end;
end;

procedure TForm_s.MenuItem3Click(Sender: TObject);
begin
     if Savedialog1.Execute then
  begin
    Result.Lines.SaveToFile(Savedialog1.FileName);
  end;
end;

procedure TForm_s.MenuItem4Click(Sender: TObject);
begin
  if opendialog1.Execute then
  begin
    load_params(l, SaveDialog1.FileName);
    Edit_d.Text:=floattostr( l );

  end;
end;

procedure TForm_s.MenuItem5Click(Sender: TObject);
begin
   Showmessage ('Автор: Секерина Виктория' +#13#10+ 'Задача №16' +#13#10+  'Известна длина окружности. Найти площадь круга, ограниченного этой окружностью.');
end;

procedure TForm_s.MenuItem6Click(Sender: TObject);
begin
 Form_s.close;
end;

end.

