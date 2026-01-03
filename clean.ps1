cls
Write-Host "Cleaning / Restoring..."

# ===== PROGRESS 1/3000 =====
for ($i = 1; $i -le 3000; $i++) {
    Write-Progress -Activity "Cleaning Tweaks" -Status "$i / 3000" -PercentComplete (($i/3000)*100)
    Start-Sleep -Milliseconds 1
}
Write-Progress -Activity "Cleaning Tweaks" -Completed

# ===== RESTORE XblGameSave =====
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v Start /t REG_DWORD /d 3 /f
reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave\TriggerInfo\0" /f

# ===== RESTORE PRIORITY =====
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v ConvertibleSlateMode /t REG_DWORD /d 1 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_BINARY /d 2600000000000000 /f

# ===== REMOVE FiveM PRIORITY =====
reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_GTAProcess.exe" /f

# ===== CLEAR POWERSHELL HISTORY =====
Clear-History
Remove-Item "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" -Force -ErrorAction SilentlyContinue

# ===== CLEAR RUN HISTORY =====
reg.exe delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f

Write-Host "Clean Complete"
pause
