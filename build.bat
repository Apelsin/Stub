@echo off
 
cd "%~dp0"

if not exist config.bat (
    echo Warning: config.bat does not exist. See config.bat.template for details.
) else (
    call config.bat
)

if not defined UNITY_PATH ( echo Error: UNITY_PATH not defined && exit /B 1 )

if not defined CONFIGURATION ( echo Error: CONFIGURATION not defined && exit /B 1 )

set PROJECT_PATH="%~dp0."

:: Win64
echo Running Win64 Build for: %PROJECT_PATH%
%UNITY_PATH% -batchmode -quit ^
	-projectPath	%PROJECT_PATH% ^
	-executeMethod	RoaringFangs.Editor.BuildManager.Build ^
	-platform		Win64 ^
	-configuration	%CONFIGURATION% ^
	-cleanedLogFile Build\win64-build-log.txt

:: TODO: other platforms

pause
