unit unitmod1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math;


function summ(a,b:real):real;
function raznosti (a,b:real):real;
function proizv (a,b:real):real;

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

end.

