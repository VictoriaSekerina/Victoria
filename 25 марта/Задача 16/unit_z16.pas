unit unit_z16;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, math, unitmod16;

type

  { TForm_s }

  TForm_s = class(TForm)
    Button1: TButton;
    Edit_d: TEdit;
    Label_result: TLabel;
    Label_r: TLabel;
    MainMenu1: TMainMenu;
    Memo_result: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
  private

  public

  end;

var
  Form_s: TForm_s;

implementation

{$R *.lfm}

{ TForm_s }

procedure TForm_s.Button1Click(Sender: TObject);
   var  s, l: real;
 begin
l:=StrToFloat(Edit_d.Text);
s:= Ploshad(l);
Memo_result.Lines.Text:=FloatToStr(s);
end;



procedure TForm_s.MenuItem2Click(Sender: TObject);
   var f:text;
begin
  if savedialog1.Execute then
  begin
    Assignfile(f,savedialog1.FileName);
    rewrite(f);
    writeln(f,Edit_d.Text);
    closefile(f);
  end;
end;

procedure TForm_s.MenuItem3Click(Sender: TObject);
begin
     if Savedialog1.Execute then
  begin
    Memo_result.Lines.SaveToFile(Savedialog1.FileName);
  end;
end;

procedure TForm_s.MenuItem4Click(Sender: TObject);
    var f:text;
    s:string;
begin
  if opendialog1.Execute then
  begin
    Assignfile(f,opendialog1.FileName);
    reset(f);
    readln(f,s);
    Edit_d.Text:=s;
    closefile(f);
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

