@echo off
if "%main%"=="" goto :EOF

set GitPath="D:\Git\bin"
set GitUrl="https://github.com/MaKToff/Geometry"
set MSBuildPath="C:\Windows\Microsoft.NET\Framework\v4.0.30319"
set NUnitpath="D:\NUnit-2.6.4\bin"
set repositoryPath="D:/repositoies/Geometry"

set missingFile=

set solutionName=Geometry.sln
set fileList=files.txt

set cloneFailed=false
set buildFailed=false
set checkFailed=false
set testFailed=false

set EmailReceiver=pro-builder1@mail.ru