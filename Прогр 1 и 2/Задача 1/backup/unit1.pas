unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Result: TMemo;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var  a,b,sum,raznost,proizved:real;
begin
  a:=StrToFloat(Edit1.Text);
  b:=StrToFloat(Edit2.Text);
  sum:=a+b;
  raznost:=a-b;
  proizved:=a*b;
  Result.Lines.Text:='сумма='+FloatToStr(sum)+'  разность='+FloatToStr(raznost)+ '  произведение='+FloatToStr(proizved);
end;

end.

