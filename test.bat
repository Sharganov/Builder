@echo off
if "%main%"=="" goto :EOF

echo Running tests...
%NUNIT% %REPO_PATH%\Test\bin\Release\Test.dll > test.log
if ERRORLEVEL 1 (
  set TEST_FAILED=true
  echo Test did not pass
) else (
  set TEST_FAILED=false
  echo Test passed
)
