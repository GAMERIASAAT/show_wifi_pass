@echo off
setlocal EnableDelayedExpansion

echo Saved Wi-Fi network names and passwords:
echo --------------------------------------

for /f "tokens=2 delims=:" %%G in ('netsh wlan show profiles ^| findstr "All User Profile"') do (
    set "ssid=%%G"
    set "ssid=!ssid:~1!"
    for /f "tokens=2 delims=:" %%P in ('netsh wlan show profile "!ssid!" key=clear ^| findstr "Key Content"') do (
        echo Network name: !ssid!
        echo Password: %%P
        echo --------------------------------------
    )
)

pause
