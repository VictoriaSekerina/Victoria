unit unitmod1;

{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils;
// Запись - «Расчёт»
type Calculat = record
x, y: real; // исходные данные
plu,min,mul: real;  // результаты
end;



function summ(a,b:real):real;
function raznosti (a,b:real):real;
function proizv (a,b:real):real;
function doall (a,b:real):calculat;

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

function doall (a,b:real):calculat;
var s,m,n:real;
begin
 s:=a+b;
 m:=a-b;
 n:=a*b;
 result.x:=a;
 result.y:=b;
 result.plu:=s;
 result.min:=m;
 result.mul:=n;
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

