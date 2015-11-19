@echo off
set main=true

echo Starting...

call settings.bat
call remove.bat

call clone.bat
if %CLONE_FAILED%==true notify.bat

call build.bat
if %BUILD_FAILED%==true notify.bat

echo Checking build consistency...

SetLocal EnableDelayedExpansion
for /F "tokens=*" %%i in (files.txt) do (
       	if not exist "%REPO_PATH%\GUI\bin\Release\%%i" (
		set MISSEDFILE=!MISSEDFILE! %%i
		set CHECK_FAILED=true
	)
)

if %CHECK_FAILED%==true (
	echo Check failed
	notify.bat
)
EndLocal 

call  test.bat
call notify.bat
