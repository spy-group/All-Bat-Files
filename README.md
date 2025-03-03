# All-Bat-Files

This repository contains a collection of Windows batch scripts designed to automate specific tasks. Each script is designed to run silently and delete itself after execution, ensuring a clean and efficient operation.

---

## Scripts Overview

### 1. `keylogger.bat`
- **Purpose**: Downloads a VBS script from a GitHub repository, copies it to the Windows Startup folder, and executes it. The VBS script will run automatically on system startup.
- **Key Features**:
  - Downloads the `test.vbs` file from GitHub.
  - Copies the file to the Startup folder for persistent execution.
  - Runs the VBS script silently.
  - Deletes itself after execution to leave no trace.

---

### 2. `USB_Data_Backup.bat`
- **Purpose**: Automates the installation of Python (if not already installed), installs the `keyboard` module, downloads a Python script from GitHub, and runs it in the background.
- **Key Features**:
  - Checks for Python installation and installs it silently if missing.
  - Installs the `keyboard` module using `pip`.
  - Downloads the `Lecture.pyw` script from GitHub and saves it to the Startup folder.
  - Runs the Python script in the background using `pythonw`.
  - Deletes itself after execution.

---

### 3. `combined_script.bat`
- **Purpose**: Combines the functionality of `keylogger.bat` and `USB_Data_Backup.bat` into a single script. It executes both the VBS script and the Python script in sequence.
- **Key Features**:
  - Downloads and runs the `test.vbs` script.
  - Installs Python and the `keyboard` module if necessary.
  - Downloads and runs the `Lecture.pyw` script.
  - Runs all operations silently in the background.
  - Deletes itself after execution.

---

## Usage Instructions

1. **Download the Scripts**:
   - Clone this repository or download the individual batch files.

2. **Run the Scripts**:
   - Right-click on the desired batch file (`keylogger.bat`, `USB_Data_Backup.bat`, or `combined_script.bat`).
   - Select **Run as Administrator** to ensure proper execution.

3. **Automatic Execution**:
   - The scripts will perform their tasks silently and delete themselves after completion.

---

## Important Notes

- **Admin Privileges**: These scripts require administrator rights to copy files to the Startup folder and install software.
- **Silent Execution**: All operations are performed in the background without displaying any windows or prompts.
- **Self-Deletion**: Each script deletes itself after execution to maintain a clean environment.

---

## Caution

- **Use Responsibly**: These scripts are intended for legitimate and authorized use only. Do not use them on systems where you do not have explicit permission.
- **Review Code**: Always review scripts downloaded from the internet before running them to ensure they perform as expected and do not contain malicious code.

---

## Repository Structure
All-Bat-Files/                
├── keylogger.bat # Script to download and run a VBS file          
├── USB_Data_Backup.bat # Script to install Python and run a Python script          
├── combined_script.bat # Combined functionality of both scripts        
└── README.md # Documentation for the repository


---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Contributing

Contributions are welcome! If you have suggestions or improvements, please open an issue or submit a pull request.

---
