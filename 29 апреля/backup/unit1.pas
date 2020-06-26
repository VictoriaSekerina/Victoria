unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Grids,
  unitmod1, math;

type

  { TForm1 }

  TForm1 {объект этого класса} = class(TForm)  //класс формы
    Button1: TButton;                          //поля этого класса идут отсюда
    Edit_b: TEdit;
    Edit_a: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Table: TStringGrid;
    procedure Button1Click(Sender: TObject);      //и заканчиваются здесь
    procedure MenuItem2Click(Sender: TObject);    //все процедуры являются методами класса
    procedure MenuItem3Click(Sender: TObject);    //их определения находится в секции implementation
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    function DataFromForm:boolean;

  private

  public

  end;

var
  Form1: TForm1;
  a,b:real;
  var calcMas: array[1..128] of Calculat;
  calcone: calculat;
  num:integer;

implementation

{$R *.lfm}

{ TForm1 }

function TForm1.DataFromForm:boolean;
begin
  result:=false;
  if TryStrToFloat(Edit_a.text,a) = false then
  begin
     Edit_a.Color:=clRed;
     ShowMessage('Неправильно введён параметр a');
     exit;
  end
  else Edit_a.Color:=clDefault;

  if TryStrToFloat(Edit_b.text,b) = false then
  begin
     Edit_b.Color:=clRed;
     ShowMessage('Неправильно введён параметр b');
     exit;
  end
   else  Edit_b.Color:=clDefault;
  result:=true;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  if savedialog1.Execute then
   begin
     if (DataFromForm = false) then exit;
     save_params(a,b, SaveDialog1.FileName);
   end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if (DataFromForm = false) then exit;
  calcone:=doall(a,b);
  Inc(num);
  CalcMas[num]:=calcone;
  Table.Cells[0, num]:=IntToStr(num);
  Table.Cells[1, num]:=FloatToStr(calcone.x);
  Table.Cells[2, num]:=FloatToStr(calcone.y);
  Table.Cells[3, num]:=FloatToStr(calcone.plu);
  Table.Cells[4, num]:=FloatToStr(calcone.min);
  Table.Cells[5, num]:=FloatToStr(calcone.mul);


end;


procedure TForm1.MenuItem3Click(Sender: TObject);
var
f:textfile;
i:integer;
begin
if SaveDialog1.Execute then
AssignFile(f,SaveDialog1.FileName);
append(f);
  write(f,'#':6);
  write(f,'a':11);
  write(f,'b':11);
  write(f,'a + b':11);
  write(f,'a - b':11);
  write(f,'a * b':11);
  writeln(f);
for i:=1 to num do
 begin
  write(f,i:6);
  with calcMas[i] do
  begin
    write(f,x:11:3);
    write(f,y:11:3);
    write(f,plu:11:3);
    write(f,min:11:3);
    write(f,mul:11:3);
  end;
  writeln(f);
 end;
closefile(f);
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

