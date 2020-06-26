unit unitmod1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math;


procedure ReadParam(Var a,a1:string;var t:text);
Procedure SaveParam(Var a,a1:string; var t:text);
function summ(a,b:real):real;
function raznosti (a,b:real):real;
function proizv (a,b:real):real;

implementation


procedure ReadParam(Var a,a1:string;var t:text);
var
s,s1:string;
begin
readln(t,s);
a:=s;
readln(t,s1);
a1:=s1;
end;

Procedure SaveParam(Var a,a1:string;var t:text);
var
s,s1:string;
begin
s:=a;
s1:=a1;
writeln(t,s);
writeln(t,s1);
end;



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

end.

