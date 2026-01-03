cls
Write-Host "1. Install"
Write-Host "2. Clean"
Write-Host ""

$choice = Read-Host "Select Option (1 or 2)"

if ($choice -eq "1") {
    iex (iwr -UseBasicParsing "https://raw.githubusercontent.com/IdApro01/Perfectsetting2026/main/install.ps1")
}
elseif ($choice -eq "2") {
    iex (iwr -UseBasicParsing "https://raw.githubusercontent.com/IdApro01/Perfectsetting2026/main/clean.ps1")
}
else {
    Write-Host "Invalid option"
    pause
}
