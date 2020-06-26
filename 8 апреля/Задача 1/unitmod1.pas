unit unitmod1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, math;

function summ(a,b:real):real;
function raznosti (a,b:real):real;
function proizv (a,b:real):real;
procedure save_params(a, b: Real; filename: string);       // сохр. a, b, в текстовый файл filename (по цифре на строку файла).
procedure load_params(var a, b: Real; filename: string);   // загруж из файла filename a,b(должны быть в отдельных строках)

implementation


function summ(a,b:real):real;
var s: real;
begin
 s:=a+b;
 summ:=s;
end;

function raznosti (a,b:real):real;
var m:real;
begin
 m:=a-b;
 raznosti:=m;
end;

function proizv (a,b:real):real;
var n:real;
begin
 n:=a*b;
 proizv:=n;
end;


procedure save_params(a, b: Real; filename: string);
var
  f: text;
begin
     assign(f, filename);
     rewrite(f);
     writeln(f, a);
     writeln(f, b);
     closefile(f);
end;

procedure load_params(var a, b: Real; filename: string);
var
  f: text;
begin
    assign(f, filename);
    reset(f);
    readln(f, a);
    readln(f, b);
    closefile(f);
end;

end.

