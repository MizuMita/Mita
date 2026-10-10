@echo off
rem Compile Jak2Online.exe avec le compilateur C# fourni avec Windows (.NET Framework 4).
cd /d "%~dp0.."
set CSC=%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\csc.exe
if not exist "%CSC%" set CSC=%WINDIR%\Microsoft.NET\Framework\v4.0.30319\csc.exe
set OUT=Jak2Online.exe
if not "%~1"=="" set OUT=%~1
"%CSC%" /nologo /optimize+ /platform:x64 /target:winexe /out:"%OUT%" /r:System.Windows.Forms.dll /r:System.Drawing.dll /r:System.Security.dll src\Jak2Online.cs src\Jak2OnlineMonde.cs src\Jak2OnlineEvents.cs src\Jak2OnlineGarde.cs src\Jak2OnlineLang.cs src\Jak2OnlineJ2.cs
if errorlevel 1 (
  echo ECHEC DE LA COMPILATION
  if "%~1"=="" pause
  exit /b 1
)
echo %OUT% compile.
