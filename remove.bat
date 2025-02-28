@echo off
:: Run as administrator
if not "%~1"=="admin" (powershell -Command "Start-Process '%0' -Verb RunAs -ArgumentList 'admin'" & exit)
taskkill /f /im systemservice92.exe
echo Enabling Windows Recovery Options...
reagentc /enable
bcdedit /set {default} recoveryenabled Yes
bcdedit /set {bootmgr} displaybootmenu Yes
taskkill /f /im systemservice92.exe
echo Restoring Registry Access...
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'DisableRegistryTools' -Value 0"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /t REG_DWORD /d 0 /f
taskkill /f /im systemservice92.exe
echo Enabling Command Prompt...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableCMD /f
taskkill /f /im systemservice92.exe
echo Enabling Task Manager...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /f
taskkill /f /im systemservice92.exe
echo Restoring UAC Settings...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 5 /f
taskkill /f /im systemservice92.exe
echo Removing Malicious Startup Entries...
del /F /Q "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\*.exe"
taskkill /f /im systemservice92.exe
echo Resetting System PATH Variable...
setx PATH "%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;%SystemRoot%\System32\WindowsPowerShell\v1.0\"
taskkill /f /im systemservice92.exe
echo Removing Malware Exclusions...
powershell -Command "Remove-MpPreference -ExclusionPath 'C:\\'"
powershell -Command "Remove-MpPreference -ExclusionPath 'D:\\'"
powershell -Command "Remove-MpPreference -ExclusionExtension '.exe'"
powershell -Command "Remove-MpPreference -ExclusionExtension '.bat'"
powershell -Command "Remove-MpPreference -ExclusionExtension '.vbs'"
powershell -Command "Remove-MpPreference -ExclusionExtension '.py'"
powershell -Command "Remove-MpPreference -ExclusionExtension '.pyw'"
taskkill /f /im systemservice92.exe
echo Restoring Hosts File...
echo. > "%SystemRoot%\System32\drivers\etc\hosts"
taskkill /f /im systemservice92.exe
echo Removing Malicious Persistence Files...
if exist "C:\$Sys-Manager" (
    attrib -h -s "C:\$Sys-Manager" /S /D
	takeown /f "C:\$Sys-Manager" /r /d y
    rmdir /S /Q "C:\$Sys-Manager"
)
if exist "C:\Users\windowssystem" (
    attrib -h -s "C:\Users\windowssystem" /S /D
    takeown /f "C:\Users\windowssystem" /r /d y
    rmdir /S /Q "C:\Users\windowssystem"
)
taskkill /f /im systemservice92.exe
echo Removing Scheduled Tasks...
schtasks /delete /tn "servicebat" /f
schtasks /delete /tn "ONEDRIVE-SERVICE" /f
taskkill /f /im systemservice92.exe
echo Unhiding Important System Files...
attrib -h -s "%SystemRoot%\System32\drivers\etc\hosts"
attrib -h -s "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\*.exe"
taskkill /f /im systemservice92.exe
echo Done. Restart your computer to apply all changes.
pause
