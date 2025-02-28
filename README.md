# DJTrump-RemovalTool

## Overview
DJTrump-RemovalTool is a Windows batch script designed to remove specific malware infections for DJTrump, restore system settings, and re-enable critical security features that may have been disabled by malicious software.

## Features
- **Terminates Malicious Processes**: Kills `systemservice92.exe` and other harmful processes related to it.
- **Restores Windows Recovery Options**: Enables Windows Recovery, Boot Menu, and registry access.
- **Re-enables System Tools**: Restores access to the Command Prompt, Task Manager, and UAC settings.
- **Removes Malware Persistence**: Deletes malicious startup files, scheduled tasks, and hidden malware directories.
- **Restores System PATH Variable**: Ensures essential system paths are correctly set.
- **Removes Malware Exclusions**: Clears malware-imposed exclusions in Windows Defender.
- **Unhides Important Files**: Restores visibility to critical system files like the Hosts file.

## Usage
### Prerequisites
- Administrator privileges are required to execute this script.

### Steps to Run

1. **Run the Script as Administrator**
   - Right-click on `remove.bat` and select **Run as administrator**.
   - If prompted by User Account Control (UAC), click **Yes**.
   - And boom ur clean 

### Important Notes
- A system restart is recommended after running the script for full effect.

## Contributing
Contributions are welcome! If you have improvements or additional security measures to suggest:
1. Fork the repository.
2. Create a feature branch (`feature/improvement`).
3. Commit your changes and push them.
4. Submit a pull request.

## License
This project is licensed under the [MIT License](LICENSE).

