cls
Write-Host "Welcome IdAprostore nocheating https://discord.gg/RNqYpC7x7Q"

for ($i = 1; $i -le 2192; $i++) {
    Write-Progress `
        -Activity "Installing wait..." `
        -Status "$i / 2192" `
        -PercentComplete (($i / 2192) * 100)

    Start-Sleep -Milliseconds 1
}

Write-Progress -Activity "Installing wait..." -Completed

# ===== XblGameSave DISABLE =====
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v DependOnService /t REG_MULTI_SZ /d "UserManager\0XblAuthManager" /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v Description /t REG_SZ /d "@%systemroot%\system32\XblGameSave.dll,-101" /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v DisplayName /t REG_SZ /d "@%systemroot%\system32\XblGameSave.dll,-100" /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v ErrorControl /t REG_DWORD /d 1 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v FailureActions /t REG_BINARY /d 80510100000000000000000004000000140000000100000010270000010000001027000001000000102700000000000000000000 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v ImagePath /t REG_EXPAND_SZ /d "%SystemRoot%\system32\svchost.exe -k netsvcs -p" /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v ObjectName /t REG_SZ /d LocalSystem /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v Start /t REG_DWORD /d 4 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v Type /t REG_DWORD /d 32 /f

# ===== PARAMETERS =====
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave\Parameters" /v ServiceDll /t REG_EXPAND_SZ /d "%SystemRoot%\System32\XblGameSave.dll" /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave\Parameters" /v ServiceDllUnloadOnStop /t REG_DWORD /d 1 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave\Parameters" /v ServiceIdleTimeout /t REG_DWORD /d 600 /f

# ===== TRIGGER =====
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave\TriggerInfo\0" /v Action /t REG_DWORD /d 1 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave\TriggerInfo\0" /v Data0 /t REG_BINARY /d 460036004300390038003700300038002d0043003700420038002d0034003900310039002d0038003800370043002d003200430045003600360045003700380042003900410030000000 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave\TriggerInfo\0" /v DataType0 /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave\TriggerInfo\0" /v GUID /t REG_BINARY /d 67d190bc70943941a9babe0bbbf5b74d /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave\TriggerInfo\0" /v Type /t REG_DWORD /d 6 /f

# ===== WIN32 PRIORITY =====
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v ConvertibleSlateMode /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_BINARY /d 2800000000000000 /f

# ===== FiveM HIGH PRIORITY =====
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_GTAProcess.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f

Write-Host "Install Complete"
pause
