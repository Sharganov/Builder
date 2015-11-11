@echo off
set main=true

echo Starting...

call settings.bat

echo Removing the old repository...
if exist %repositoryPath% rmdir /s /q %repositoryPath%

echo Cloning...
D:\Git\bin\git clone %GitUrl% %repositoryPath% >nul 2> clone.log
if ERRORLEVEL 1 goto :cloneError
echo Cloning is successful

echo Build...
%MSBuildPath%\MSBuild.exe %repositoryPath%\%solutionName% /p:Configuration=Release;VisualStudioVersion=12.0 >msbuild.log
if ERRORLEVEL 1 goto :buildError
echo Building is successful

echo Checking build consistency...
for /F "tokens=*" %%i in (files.txt) do if not exist %repositoryPath%\bin\Release\%%i set missingFile=%%i& goto :checkError

echo Running tests...
%NUnitPath%\nunit-console.exe %repositoryPath%\Test\bin\Release\Tests.dll > tests.txt
if ERRORLEVEL 1 goto :testError
echo Tests pased

goto :sending

:cloneError
echo Cloning Failed
set cloneFailed=true
goto :sending

:buildError
echo Building Failed
set buildFailed=true
goto :sending

:checkError
echo Not found: %missingFile%.
set checkFailed=true
goto :sending

:testError
echo Testing Failed
set testFailed=true
goto :sending

:sending
call email.bat