unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, unitmod1, math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    a_Edit1: TEdit;
    b_Edit2: TEdit;
    Label_a: TLabel;
    Label_b: TLabel;
    MainMenu: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
var  a,b,sum,raznost,proizved:real;
begin
a:=StrToFloat(a_Edit1.Text);
b:=StrToFloat(b_Edit2.Text);
sum:=summ(a,b);
raznost:=raznosti(a,b);
proizved:=proizv(a,b);
Memo1.Lines.Text:='Сумма ='+FloatToStr(sum)+#13#10+'Разность ='+FloatToStr(raznost)+#13#10+ 'Произведение ='+FloatToStr(proizved);
end;


procedure TForm1.MenuItem2Click(Sender: TObject);
 var f:text;
begin
  if savedialog1.Execute then
  begin
    Assignfile(f,savedialog1.FileName);
    rewrite(f);
    writeln(f,a_Edit1.Text);
    writeln(f,b_Edit2.Text);
    closefile(f);
  end;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
    if Savedialog1.Execute then
  begin
    Memo1.Lines.SaveToFile(Savedialog1.FileName);
  end;
end;


procedure TForm1.MenuItem4Click(Sender: TObject);
 begin
    Showmessage ('Автор: Секерина Виктория' +#13#10+ 'Задача №1' +#13#10+  'Даны два действительных числа a и b. Получить их сумму, разность и произведение.');
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
 begin
  Form1.close;
 end;


procedure TForm1.MenuItem6Click(Sender: TObject);
 var f:text;
    s:string;
begin
  if opendialog1.Execute then
  begin
    Assignfile(f,opendialog1.FileName);
    reset(f);
    readln(f,s);
    a_Edit1.Text:=s;
    readln(f,s);
    b_Edit2.Text:=s;
    closefile(f);
  end;
end;


end.

