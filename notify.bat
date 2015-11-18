if "%main%"=="" goto :EOF

set MESSAGE=Build successful
set ATTACHED=msbuild.log

if %CLONE_FAILED%==true (
	set MESSAGE=Failed to clone repository
	set ATTECHED=clone.log
)

if %BUILD_FAILED%==true set MESSAGE=Build failed

if %CHECK_FAILED%==true set MESSAGE=Check failed. Not found %MISSEDFILE%

if %TEST_FAILED%==true ( 
  set MESSAGE=Test failed
  set ATTECHED=test.log
)

%MAILSEND% -to %MAILRECIVER% -from %MAILRECIVER% -ssl -port 465 -auth -smtp smtp.mail.ru -sub "%MESSAGE%" +cc +bc -v -user %USER% -pass %PASS% -attach "%ATTACHED%" -M "%MESSAGE%
