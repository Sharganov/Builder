@echo off
if "%main%"=="" goto :EOF

set Message=Build successful
set attachted=msbuild.log

if %cloneFailed%==true (
	set Message=Failed to clone repository
	set attachted=clone.log
)
if %buildFailed%==true set Message=Build failed
if %checkFailed%==true set Message=Check failed. Not found %missingFile%
if %testFailed%==true set Message=Test failed



D:\email\mailsend1.18.exe -to %EmailReceiver% -from %EmailReceiver% -ssl -port 465 -auth -smtp smtp.mail.ru -sub "%Message%" +cc +bc -v -user pro-builder1 -pass "builder123" -attach "%attachted%" -M "%Message%