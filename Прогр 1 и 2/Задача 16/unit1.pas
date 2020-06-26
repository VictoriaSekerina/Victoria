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
    Label1: TLabel;
    Label3: TLabel;
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
var r, s, l: real;
begin
 l:=StrToFloat(Edit1.Text);
 r:= l/(2*Pi);
 s:= Pi*r*r ;
Result.Lines.Text:=FloatToStr(s);
end;

end.

