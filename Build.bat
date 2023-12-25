set NAME=Sandbox

UnrealEngine\Engine\Build\BatchFiles\Build.bat -Target="%NAME%Editor Win64 Development -Project=C:\UE5\%NAME%\%NAME%.uproject" -Target="ShaderCompileWorker Win64 Development -Quiet" -WaitMutex -FromMsBuild
