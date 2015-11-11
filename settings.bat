@echo off
if "%main%"=="" goto :EOF

set GitPath="D:\Git\bin"
set GitUrl="https://github.com/Sharganov/Builder"
set MSBuildPath="C:\Windows\Microsoft.NET\Framework\v4.0.30319"
set NUnitpath="D:\NUnit-2.6.4\bin"
set repositoryPath="D:\repositories\Builder"

set missingFile=

set solutionName=""
set fileList=files.txt

set cloneFailed=false
set buildFailed=false
set checkFailed=false
set testFailed=false

set EmailReceiver=pro-builder1@mail.ru