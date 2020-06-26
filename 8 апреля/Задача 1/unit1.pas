unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,unitmod1, math;

type

  { TForm1 }

  TForm1 {объект этого класса} = class(TForm)  //класс формы
    Button1: TButton;                          //поля этого класса идут отсюда
    Edit_b: TEdit;
    Edit_a: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    OpenDialog1: TOpenDialog;
    Result: TMemo;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);      //и заканчиваются здесь
    procedure MenuItem2Click(Sender: TObject);    //все процедуры являются методами класса
    procedure MenuItem3Click(Sender: TObject);    //их определения находится в секции implementation
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure DataFromForm();


  private

  public

  end;

var
  Form1: TForm1;
  a,b:real;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.DataFromForm();
begin

  if TryStrToFloat(Edit_a.text,a) = false then
  begin
     Edit_a.Color:=clRed;
     ShowMessage('Неправильно введён параметр a');
     exit;
  end;


  if TryStrToFloat(Edit_b.text,b) = false then
  begin
     ShowMessage('Неправильно введён параметр b');
     exit;
  end;

   if TryStrToFloat(Edit_a.text,a) = true then
  begin
     Edit_a.Color:=clWhite;
     exit;
  end;

 end;


procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  if savedialog1.Execute then
   begin
     DataFromForm();
     save_params(a,b, SaveDialog1.FileName);
   end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  sum,raznost,proizved:real;
begin
  DataFromForm();
  sum:=summ(a,b);
  raznost:=raznosti(a,b);
  proizved:=proizv(a,b);
  Result.Lines.append('Сумма ='+FloatToStr(sum)+#13#10+'Разность ='+FloatToStr(raznost)+#13#10+ 'Произведение ='+FloatToStr(proizved));
end;



procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  if Savedialog1.Execute then
begin
 Result.Lines.SaveToFile(Savedialog1.FileName);
end;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
   if opendialog1.Execute then
  begin
    load_params(a, b, SaveDialog1.FileName);
    Edit_a.Text:=floattostr( a);
    Edit_b.Text:=floattostr( b);
  end;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  Showmessage ('Автор: Секерина Виктория' +#13#10+ 'Задача №1' +#13#10+  'Даны два действительных числа a и b. Получить их сумму, разность и произведение.');
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  Form1.close;
end;

end.

