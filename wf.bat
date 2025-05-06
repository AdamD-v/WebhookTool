@echo off
setlocal EnableDelayedExpansion
mode 100,40
color 0c

:: Display Loading Screen with Red Text and ASCII Art
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo Loading...
timeout /t 4 >nul

:menu
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo ================================
echo         [ WEBHOOK TOOL ]
echo ================================
echo.
echo [1] Send message
echo [2] Spam message
echo [3] Delete webhook
echo [0] Exit
echo.
set /p choice=Select an option: 

if "%choice%"=="1" goto send
if "%choice%"=="2" goto spam
if "%choice%"=="3" goto delete
if "%choice%"=="0" exit
goto menu

:send
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [SEND MESSAGE]
echo.
set /p webhook=Enter Webhook URL: 
set /p message=Enter message: 
curl -H "Content-Type: application/json" -d "{\"content\": \"%message%\"}" %webhook%
echo.
echo [✓] Message sent.
pause
goto menu

:spam
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [SPAM MESSAGE]
echo.
set /p webhook=Enter Webhook URL: 
set /p message=Enter message to spam: 
set /p count=How many times to spam: 
for /l %%i in (1,1,%count%) do (
    curl -H "Content-Type: application/json" -d "{\"content\": \"%message%\"}" %webhook%
    timeout /t 1 >nul
)
echo.
echo [✓] Finished spamming.
pause
goto menu

:delete
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [DELETE WEBHOOK]
echo.
set /p webhook=Enter Webhook URL to delete: 
curl -X DELETE %webhook%
echo.
echo [✓] Webhook deleted.
pause
goto menu


:: ASCII Art Section
:::   _____       .___            /\          __      _____________
:::  /  _  \    __| _/____    ____)/  ______ /  \    /  \_   _____/
::: /  /_\  \  / __ |\__  \  /     \ /  ___/ \   \/\/   /|    __)  
:::/    |    \/ /_/ | / __ \|  Y Y  \\___ \   \        / |     \   
:::\____|__  /\____ |(____  /__|_|  /____  >   \__/\  /  \___  /   
:::        \/      \/     \/      \/     \/         \/       \/    
:::
