@echo off
title "Software Install"
COLOR f5

reg add "HKEY_CURRENT_USER\Software\Microsoft\Command Processor" /v "DisableUNCCheck" /t "REG_DWORD" /d "1" /f >nul

:menu
echo ====================================================
echo ===========       Common software       ============
echo ====================================================
echo;

echo 1.  Firefox
echo 2.  Anydesk
echo 3.  Ccleaner
echo 4.  Cutepdf
echo 5.  Adobe Acrobat
echo 6.  Foxit Reader
echo 7.  7Zip
echo;

set /p opt=Please select your options: 

If "%opt%" EQU "1" goto 1
If "%opt%" EQU "2" goto 2
If "%opt%" EQU "3" goto 3
If "%opt%" EQU "4" goto 4
If "%opt%" EQU "5" goto 5
If "%opt%" EQU "6" goto 6
If "%opt%" EQU "7" goto 7
If "%opt%" EQU "0" goto 0

:1
::Installing Google Chrome....
echo Installing Google Chrome....
start /wait \\Server\software\GoogleChromeStandaloneEnterprise64.msi /q
if %errorlevel% == 9059 echo failed! & pause & cls & goto menu
if %errorlevel% == 1223 echo failed! & pause & cls & goto menu
if %errorlevel% == 1 echo failed! & pause & cls & goto menu
if %errorlevel% == 0 echo Successful! & pause & cls & goto menu
if %errorlevel% == -2147218431 echo failed! & pause & cls & goto menu


:2
::Installing Firefox....
echo Installing Firefox....
start /wait \\Server\software\Firefox.exe /s /qn
if %errorlevel% == 9059 echo failed! & pause & cls & goto menu
if %errorlevel% == 1223 echo failed! & pause & cls & goto menu
if %errorlevel% == 1 echo failed! & pause & cls & goto menu
if %errorlevel% == 0 echo Successful! & pause & cls & goto menu
if %errorlevel% == -2147218431 echo failed! & pause & cls & goto menu


:3
::Installing Anydesk....
echo Installing Anydesk....
start /wait \\Server\software\Anydesk.exe /s /qn
if %errorlevel% == 9059 echo failed! & pause & cls & goto menu
if %errorlevel% == 1223 echo failed! & pause & cls & goto menu
if %errorlevel% == 1 echo failed! & pause & cls & goto menu
if %errorlevel% == 0 echo Successful! & pause & cls & goto menu


:4
::Installing ccleaner....
echo Installing ccleaner....
start /wait \\Server\software\ccsetup582.exe /s /qn
if %errorlevel% == 9059 echo failed! & pause & cls & goto menu
if %errorlevel% == 1223 echo failed! & pause & cls & goto menu
if %errorlevel% == 1 echo failed! & pause & cls & goto menu
if %errorlevel% == 0 echo Successful! & pause & cls & goto menu


:5
::Installing Cutepdf....
echo Installing Cutepdf....
start /wait \\Server\software\CuteWriter.exe /s /qn
if %errorlevel% == 9059 echo failed! & pause & cls & goto menu
if %errorlevel% == 1223 echo failed! & pause & cls & goto menu
if %errorlevel% == 1 echo failed! & pause & cls & goto menu
if %errorlevel% == 0 echo Successful! & pause & cls & goto menu


:6
::Installing Adobe Acrobat....
echo Installing Adobe Acrobat....
start /wait \\Server\software\AcroRdrDC2100520058_en_US.exe /s /qn
if %errorlevel% == 9059 echo failed! & pause & cls & goto menu
if %errorlevel% == 1223 echo failed! & pause & cls & goto menu
if %errorlevel% == 1 echo failed! & pause & cls & goto menu
if %errorlevel% == 0 echo Successful! & pause & cls & goto menu


:7
::Installing Foxit Reader....
echo Installing Foxit Reader....
start /wait \\Server\software\FoxitReader110.exe /s /qn
if %errorlevel% == 9059 echo failed! & pause & cls & goto menu
if %errorlevel% == 1223 echo failed! & pause & cls & goto menu
if %errorlevel% == 1 echo failed! & pause & cls & goto menu
if %errorlevel% == 0 echo Successful! & pause & cls & goto menu


:0
exit /b

