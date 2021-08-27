@echo off
title Add Printer
COLOR f9

set yes=y
set no=n

rem if "%test%" == "" (enter key)
rem if "%test%" == " " (space bar key)

:menu
echo ===============================
echo          Printer Menu
echo ===============================
echo;
echo 1. EPSON_LQ310 (By Print Server)
echo 2. Canon iR-ADV 4045/4051 PCL6 (By IP)
echo 3. Canon MF3010 (By User PC)
echo;

echo 0. Exit

echo;

set /p opt=Please select which printer you want to add?: 
echo;

If "%opt%" == "" goto menu
If "%opt%" == " " goto menu

If "%opt%" EQU "1" goto 1
If "%opt%" EQU "2" goto 2
If "%opt%" EQU "3" goto 3
If "%opt%" EQU "0" goto 0
echo;



:1
set /p conf=Are you sure want to add printer? (Y/N)
if "%conf%" EQU "%yes%" cls & goto next
if "%conf%" EQU "%no%" cls & goto menu

:next
echo ===================================================
echo == Adding EPSON_LQ310 printer................... ==
echo ===================================================
echo;

REM rundll32 printui.dll PrintUIEntry /ia /b "Printer Name" /f "filename.inf" /m "Printer model from inf file"
rundll32 printui.dll PrintUIEntry /ia /b "EPSON LQ-310 ESC/P2" /f "\\Server\Install\Driver\Epson\LQ310_64\LQ-310_EN_Vol10\Driver\Printer\WINX64\EBSD053M.inf" /m "EPSON LQ-310 ESC/P2"

REM network printer location
rundll32 printui.dll,PrintUIEntry /in /n\\Server\D1-P3-LQ310

REM set printer as default
rundll32 printui.dll,PrintUIEntry /y /n\\Server\D1-P3-LQ310

REM set printer as default
set /p "default=Do you want to set this printer as default (Y/N)?"
if "%default%" EQU "%yes%" goto YES
if "%default%" EQU "%no%" goto NO

:yes
rundll32 printui.dll,PrintUIEntry /y /n "EPSON LQ-310 ESC/P2"
echo Printer has been set to default & pause & control printers & goto menu

:no
cls & goto menu

===========================================================================================
===========================================================================================

:2
set /p conf=Are you sure want to add printer? (Y/N)
if "%conf%" EQU "%yes%" cls & goto next
if "%conf%" EQU "%no%" cls & goto menu

:next
echo ====================================================
echo == Adding Canon iR-ADV 4045/4051 PCL6 printer.... ==
echo ====================================================
echo;

REM Install Printer via TCP/IP Address

REM cscript c:\Windows\System32\Printing_Admin_Scripts\en-US\prnport.vbs -a -r IP_PORT NUMBER -h HOST_ADDRESS
cscript c:\Windows\System32\Printing_Admin_Scripts\en-US\prnport.vbs -a -r IP_192.168.10.253 -h 192.168.10.253

REM rundll32 printui.dll,PrintUIEntry /ga /if /b "PRINTER_NAME" /f INF_PATH /r "IP_PORT_NUMBER" /m "PRINTER_NAME_INSIDE_INF" /z
rundll32 printui.dll,PrintUIEntry /ga /if /b "Canon iR-ADV 4045/4051 PCL6" /f \\Server\Install\Driver\Canon\i4045\Driver\CNP60KA64.inf /r "IP_192.168.10.253" /m "Canon iR-ADV 4045/4051 PCL6" /z

REM set printer as default
set /p "default=Do you want to set this printer as default (Y/N)?"
if "%default%" EQU "%Yes%" goto YES
if "%default%" EQU "%No%" goto NO

:yes
rundll32 printui.dll,PrintUIEntry /y /n "Canon iR-ADV 4045/4051 PCL6 (FINEFOOD)"
echo Printer has been set to default & pause & control printers & goto menu

:no
cls & goto menu

===========================================================================================
===========================================================================================

:3
set /p conf=Are you sure want to add printer? (Y/N)
if "%conf%" EQU "%yes%" cls & goto next
if "%conf%" EQU "%no%" cls & goto menu

:next
echo ===================================================
echo == Adding \\PC\Canon MF3010 printer............ ==
echo ===================================================
echo;

REM network printer location
rundll32 printui.dll,PrintUIEntry /in /n "\\PC\Canon MF3010"

REM set printer as default
set /p "default=Do you want to set this printer as default (Y/N)?"
if "%default%" EQU "%Yes%" goto YES
if "%default%" EQU "%No%" goto NO

:yes
rundll32 printui.dll,PrintUIEntry /y /n "\\PC\Canon MF3010"
echo Printer has been set to default & pause & control printers & goto menu

:no
cls & goto menu

===========================================================================================
===========================================================================================

:0
exit /b