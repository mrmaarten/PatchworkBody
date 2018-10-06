@echo off
::set the day to check(one day after bat 2)
set "weekdaycheck=Wednesday"
echo bat file 1, checking for %weekdaycheck%
echo
echo loading the sketch...
call start-patchwork.bat
set "timeoutsec=7200"
timeout 50

:check
for /f "tokens=1,2,3 delims=," %%a in ('cscript //nologo weekday.vbs') do set weekday=%%a & set weekdaynum=%%b & set shortday=%%c

::echo %weekday%
::echo %weekdaynum%
echo Checking for %weekdaycheck%, today is %weekday%

if %weekday%==%weekdaycheck% (
	echo
	echo today is %weekdaycheck%
	echo going to kill java
	echo and exit this batch file
	Powershell.exe -executionpolicy remotesigned -File C:\Users\patchwork\Desktop\stop-patchwork.ps1
	start call check-weekday2.bat
	goto :exit
)

echo not %weekdaycheck%
echo try again in %timeoutsec% seconds
timeout %timeoutsec%
goto :check

:exit
exit 0