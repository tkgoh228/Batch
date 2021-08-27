@echo off
title "Software Install"
COLOR f5

reg add "HKEY_CURRENT_USER\Software\Microsoft\Command Processor" /v "DisableUNCCheck" /t "REG_DWORD" /d "1" /f >nul

:menu
echo ====================================================
echo ==========      Microsofot Office        ===========
echo ====================================================
echo;
echo 01. Office_2019 x64 (Windows10_only)
echo 02. Office_2019 x86 (Windows10_only)
echo;
echo 00. Exit

echo;


echo;

set /p opt=Please select your options: 

If "%opt%" EQU "01" goto 01
If "%opt%" EQU "02" goto 02
If "%opt%" EQU "00" goto 00


:01
::Installing Office 2019 x64....
echo Installing Office 2019 x64....
\\Server\software\O365BusinessRetail\Office\setup64.exe
if %errorlevel% == 9059 echo failed! & pause & cls & goto menu
if %errorlevel% == 1223 echo failed! & pause & cls & goto menu
if %errorlevel% == -1 echo Failed! & pause & cls & goto menu
if %errorlevel% == 1 echo Failed! & pause & cls & goto menu
if %errorlevel% == 0 echo Successful! & pause & cls & goto menu


:02
::Installing Office 2019 x86....
echo Installing Office 2019 x86....
\\Server\software\O365BusinessRetail\Office\setup32.exe
if %errorlevel% == 9059 echo failed! & pause & cls & goto menu
if %errorlevel% == 1223 echo failed! & pause & cls & goto menu
if %errorlevel% == -1 echo Failed! & pause & cls & goto menu
if %errorlevel% == 1 echo Failed! & pause & cls & goto menu
if %errorlevel% == 0 echo Successful! & pause & cls & goto menu


:00
exit /b
