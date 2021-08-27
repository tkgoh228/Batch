@echo off

set aa=first string
set bb=second string

set temp=%aa%
set aa=%bb%
set bb=%temp%

echo %temp%
echo %aa%
echo %bb%

pause