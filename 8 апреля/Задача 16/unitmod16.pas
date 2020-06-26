unit unitmod16;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, math;


function Ploshad(l:real):real;
procedure save_params(l: Real; filename: string);       // сохр. r, fi, в текстовый файл filename (по цифре на строку файла).
procedure load_params(var l: Real; filename: string);   // загруж из файла filename r,fi(должны быть в отдельных строках)

implementation



function Ploshad(l:real):real;
var s, r:real;
begin
r:= l/(2*Pi);
s:= Pi*r*r ;
Ploshad:=s;
end;

procedure save_params(l: Real; filename: string);
var
  f: text;
begin
     assign(f, filename);
     rewrite(f);
     writeln(f, l);
     closefile(f);
end;

procedure load_params(var l: Real; filename: string);
var
  f: text;
begin
    assign(f, filename);
    reset(f);
    readln(f, l);
    closefile(f);
end;

end.

