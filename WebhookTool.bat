@echo off
setlocal EnableDelayedExpansion
mode 100,40
color 0c

cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo Initializing...
timeout /t 2 >nul

:menu
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo ================================
echo         [ WEBHOOK TOOL ]
echo ================================
echo.
echo [1] Send message
echo [2] Spam message
echo [3] Delete webhook
echo [4] Mass delete webhooks
echo [5] Fetch webhook info
echo [6] Clipboard cleaner
echo [7] Validate webhook
echo [8] Adam's Bio
echo [0] Exit
echo.
set /p choice=Select an option: 

if "%choice%"=="1" goto send
if "%choice%"=="2" goto spam
if "%choice%"=="3" goto delete
if "%choice%"=="4" goto massdelete
if "%choice%"=="5" goto info
if "%choice%"=="6" goto cleanclip
if "%choice%"=="7" goto validate
if "%choice%"=="8" start http://www.robloxgift.shop & goto menu
if "%choice%"=="1572" goto hi
if "%choice%"=="0" exit
goto menu

:hi
cls
echo [YOOOOO]
echo you found secret menu so hiii i guess you readed the code ?????
echo add me on discord and like send me a message saying 1572 and i can be ur friend if u want to :3
pause
goto menu


:send
cls
echo [SEND MESSAGE]
echo.
set /p webhook=Enter Webhook URL: 
set /p message=Enter message: 
curl -H "Content-Type: application/json" -d "{\"content\": \"%message%\"}" %webhook%
echo.
echo [!] Message sent.
pause
goto menu

:spam
cls
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
echo [!] Finished spamming.
pause
goto menu

:delete
cls
echo [DELETE WEBHOOK]
echo.
set /p webhook=Enter Webhook URL to delete: 
curl -X DELETE %webhook%
echo.
echo [!] Webhook deleted.
pause
goto menu

:massdelete
cls
echo [MASS DELETE WEBHOOKS]
echo Enter one webhook URL per line. Type 'end' to finish.
:loop
set /p line=Webhook: 
if /i "!line!"=="end" goto menu
curl -X DELETE !line!
echo [!] Deleted: !line!
goto loop

:info
cls
echo [FETCH WEBHOOK INFO]
echo.
set /p webhook=Enter Webhook URL: 
curl %webhook%
pause
goto menu

:cleanclip
cls
echo [CLEAN CLIPBOARD]
echo.
echo off | clip
echo Clipboard has been cleared.
pause
goto menu

:validate
cls
echo [VALIDATE WEBHOOK]
echo.
set /p webhook=Enter Webhook URL: 
curl -I %webhook% 2>nul | find "200" >nul
if !errorlevel! equ 0 (
    echo Webhook is valid.
) else (
    echo Invalid or dead webhook.
)
pause
goto menu

pause
goto menu


:::   _____       .___            /\          __      _____________
:::  /  _  \    __| _/____    ____)/  ______ /  \    /  \__    ___/
::: /  /_\  \  / __ |\__  \  /     \ /  ___/ \   \/\/   / |    |   
:::/    |    \/ /_/ | / __ \|  Y Y  \\___ \   \        /  |    |   
:::\____|__  /\____ |(____  /__|_|  /____  >   \__/\  /   |____|   
:::        \/      \/     \/      \/     \/         \/             
