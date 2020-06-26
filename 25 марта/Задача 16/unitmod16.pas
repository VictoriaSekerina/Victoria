unit unitmod16;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, math;


function Ploshad(l:real):real;

implementation



function Ploshad(l:real):real;
var s, r:real;
begin
r:= l/(2*Pi);
s:= Pi*r*r ;
Ploshad:=s;
end;

end.

