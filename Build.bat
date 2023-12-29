@echo off

set PATH=C:\UE5
set NAME=Sandbox

CALL UnrealEngine\Engine\Build\BatchFiles\Build.bat -Target="%NAME%Editor Win64 Development -Project=%PATH%\%NAME%\%NAME%.uproject" -Target="ShaderCompileWorker Win64 Development -Quiet" -WaitMutex -FromMsBuild
IF errorlevel 1 EXIT /B !ERRORLEVEL!

IF "%1"=="run" START UnrealEngine\Engine\Binaries\Win64\UnrealEditor.exe "%PATH%\%NAME%\%NAME%.uproject"
