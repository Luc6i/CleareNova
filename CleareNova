@ECHO OFF
CHCP 65001>NUL
COLOR F9
TITLE CleareNova (Windows 10, 11) by luc6i

:: Check for updates
ECHO.&ECHO.
ECHO [Task 1/62] Processing: Check update..
ECHO Проверка обновлений..
curl -# --ssl-no-revoke --insecure -L https://github.com/luc6i/CleareNova/raw/main/CleareNova.bat -o "%temp%\CheckCleareNovaVersion.txt"
if %errorlevel% neq 0 goto noupdate
findstr /c:"CheckCleareNovaVersion 11032024" "%temp%\CheckCleareNovaVersion.txt" >nul
if %errorlevel%==0 (goto noupdate) else (
    cls & ECHO [Task 1/62] Processing: Update..
    curl -# --ssl-no-revoke --insecure -L https://codeload.github.com/luc6i/CleareNova/zip/refs/heads/main -o "%temp%\CleareNova-main.zip"
    powershell -command "Expand-Archive -Path '%temp%\CleareNova-main.zip' -DestinationPath '%temp%\CleareNova-main' -Force" 2>nul >nul
    copy "%temp%\CleareNova-main\CleareNova-main\*" "%~dp0" 2>nul >nul
    start "" "%~f0"&exit
)

:noupdate
ECHO.&ECHO Run as Administrator..&ECHO Запуск от имени Администратора..
net sess>NUL 2>&1||(powershell try{saps '%0'-Verb RunAs}catch{}&exit)

cls
MODE 62,26
COLOR F9
ECHO.&ECHO [Task 2/62] Processing: Display logo..
CALL :COLOR F5 & CALL :ECHO "                              ###"
CALL :COLOR F5 & CALL :ECHO "                           #######"
CALL :COLOR F5 & CALL :ECHO "                         #########"
CALL :COLOR F5 & CALL :ECHO "                        #########"
CALL :COLOR FD & CALL :ECHO "                      ###########" / CALL :COLOR FD & CALL :ECHO "    #####"
CALL :COLOR FD & CALL :ECHO "                     ###########" / CALL :COLOR FD & CALL :ECHO "  ########"
CALL :COLOR F1 & CALL :ECHO "                    #####" / CALL :COLOR F1 & CALL :ECHO "  ###############"
CALL :COLOR F1 & CALL :ECHO "                    ####" / CALL :COLOR F1 & CALL :ECHO "   ###############"
CALL :COLOR F9 & CALL :ECHO "                           #######" / CALL :COLOR F9 & CALL :ECHO "  ######"
CALL :COLOR F9 & CALL :ECHO "                            ###" / CALL :COLOR F9 & CALL :ECHO "     #####"
CALL :COLOR F3 & CALL :ECHO "                                    ####"
CALL :COLOR F3 & CALL :ECHO "                                   ####"
CALL :COLOR F3 & CALL :ECHO "                                   ####"
CALL :COLOR F3 & CALL :ECHO "                                   ####"
CALL :COLOR FB & CALL :ECHO "                                   ####"
CALL :COLOR FB & CALL :ECHO "                                  #####"
CALL :COLOR FB & CALL :ECHO "                                   ####"
CALL :COLOR FB & CALL :ECHO "                                    ####"
ping localhost -n 2 >NUL
goto clean

:COLOR
set c=%1& exit/b
:ECHO
for /f %%i in ('"prompt $h& for %%i in (.) do rem"') do (
    pushd "%~dp0"& <NUL>"%~1_" set/p="%%i%%i  "& findstr/a:%c% . "%~1_*"
    (if "%~2" neq "/" ECHO.)& del "%~1_"& popd& set c=& exit/b
)

:clean
cls
MODE 62,8

COLOR F9
ECHO.&ECHO [Task 3/62] Processing: Deleting temporary files..
ECHO Удаление временных файлов..
PowerShell -Command Remove-Item '%SystemDrive%\ProgramData\Temp\*','%SystemDrive%\Windows\Temp\*','%SystemDrive%\Users\*\AppData\Local\Temp\*','%SystemDrive%\Users\*\AppData\Local\Packages\*\AC\Temp\*' -Recurse -Force 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 4/62] Processing: Removing Windows update files..
ECHO Удаление файлов обновления Windows..
net stop cryptsvc /yes 2>nul >nul
PowerShell -Command Remove-Item '%SystemDrive%\$Windows.~BT','%SystemDrive%\$Windows.~WS','%SystemDrive%\Windows\SoftwareDistribution\Download\*','%SystemDrive%\Windows\Logs\WindowsUpdate\*.log' -Recurse -Force 2>nul >nul
net start cryptsvc 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 5/62] Processing: Removing logs..
ECHO Удаление логов..
PowerShell -Command Remove-Item '%SystemDrive%\Windows\*.log','%SystemDrive%\Windows\logs\*.log','%SystemDrive%\Windows\Panther\*.log' -Recurse -Force 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 6/62] Processing: Removing unnecessary Windows folders..
ECHO Удаление ненужных папок Windows..
PowerShell -Command "if (Test-Path '%SystemDrive%\PerfLogs') {Remove-Item '%SystemDrive%\PerfLogs' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 7/62] Processing: Deleting memory dumps..
ECHO Удаление дампов памяти..
PowerShell -Command Remove-Item '%SystemDrive%\*.dmp','%SystemDrive%\Users\*\AppData\Local\CrashDumps\*' -Recurse -Force 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 8/62] Processing: Deleting SRUDB.dat..
ECHO Удаление SRUDB.dat..
net stop DPS /yes 2>nul >nul
PowerShell -Command "Remove-Item '%SystemDrive%\Windows\System32\sru\*' -Recurse -Force" 2>nul >nul
net start DPS 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 9/62] Processing: Cleaning up WinSxS folder..
ECHO Очистка папки WinSxS..
Dism.exe /Online /Cleanup-Image /StartComponentCleanup 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 10/62] Processing: Cleaning up Windows Search (Windows.edb)..
ECHO Очистка Поиск Windows (Windows.edb)..
Sc config wsearch start=disabled 2>nul >nul
Net stop wsearch 2>nul >nul
EsentUtl.exe /d "%SystemDrive%\ProgramData\Microsoft\Search\Data\Applications\Windows\Windows.edb" 2>nul >nul
Sc config wsearch start=delayed-auto 2>nul >nul
Net start wsearch 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 11/62] Processing: Removing empty folders in system32..
ECHO Удаление пустых папок в system32..
PowerShell -Command "Remove-Item '%SystemDrive%\Windows\System32\config\systemprofile\AppData\Local\*.tmp' -Recurse -Force" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 12/62] Processing: Disable program cache..
ECHO Отключение кэша программ..
PowerShell -Command "Remove-Item '%SystemDrive%\Windows\Installer\*.tmp' -Recurse -Force" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 13/62] Processing: Deleting Windows history..
ECHO Удаление истории Windows..
PowerShell -Command "Remove-Item '%SystemDrive%\Users\*\AppData\Local\Microsoft\Windows\History\*' -Recurse -Force" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 14/62] Processing: Removing network shortcuts..
ECHO Удаление сетевых ярлыков..
PowerShell -Command "Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\Microsoft\Windows\Network Shortcuts\*' -Recurse -Force" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 15/62] Processing: Deleting RDP cache..
ECHO Удаление кэша RDP..
PowerShell -Command "Remove-Item '%SystemDrive%\Users\*\AppData\Local\Microsoft\Terminal Server Client\cache\*' -Recurse -Force" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 16/62] Processing: Deleting DirectX Shader cache..
ECHO Удаление кэша DirectX..
PowerShell -Command Remove-Item '%SystemDrive%\Users\*\AppData\Local\D3DSCache\*' -Recurse -Force 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 17/62] Processing: Deleting Microsoft Store cache..
ECHO Удаление кэша Microsoft Store..
Start /min /wait WSReset.exe 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 18/62] Processing: Deleting OneDrive cache..
ECHO Удаление кэша OneDrive..
PowerShell -Command Remove-Item '%SystemDrive%\Users\*\AppData\Local\Microsoft\OneDrive\logs\*' -Recurse -Force 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 19/62] Processing: Deleting Nvidia cache..
ECHO Удаление кэша Nvidia..
PowerShell -Command "if (Test-Path '%SystemDrive%\ProgramData\NVIDIA') {Remove-Item '%SystemDrive%\ProgramData\NVIDIA\*','%SystemDrive%\Users\*\AppData\Local\NVIDIA\GLCache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 20/62] Processing: Deleting Adobe cache..
ECHO Удаление кэша Adobe..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\Adobe') {Remove-Item '%SystemDrive%\Users\*\AppData\LocalLow\Adobe\Common\Media Cache\*','%SystemDrive%\Users\*\AppData\Roaming\Adobe\Common\Media Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 21/62] Processing: Deleting Microsoft Teams cache..
ECHO Удаление кэша Microsoft Teams..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Microsoft\Teams') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Microsoft\Teams\Cache\*','%SystemDrive%\Users\*\AppData\Roaming\Microsoft\Teams\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 22/62] Processing: Deleting Zoom cache..
ECHO Удаление кэша Zoom..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\Zoom') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\Zoom\data\WebviewCache\*\zoomapps\*\EBWebView\Default\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 23/62] Processing: Deleting Telegram cache..
ECHO Удаление кэша Telegram..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\Telegram Desktop') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\Telegram Desktop\tdata\user_data*\cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 24/62] Processing: Deleting Discord cache..
ECHO Удаление кэша Discord..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\Discord') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\Discord\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 25/62] Processing: Deleting WhatsApp cache..
ECHO Удаление кэша WhatsApp..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\WhatsApp') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\WhatsApp\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 26/62] Processing: Deleting OBS cache..
ECHO Удаление кэша OBS..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\obs-studio') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\obs-studio\plugin_config\obs-browser\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 27/62] Processing: Deleting Streamlabs cache..
ECHO Удаление кэша Streamlabs..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\slobs-client') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\slobs-client\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 28/62] Processing: Deleting Twitch Studio cache..
ECHO Удаление кэша Twitch Studio..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\Twitch Studio') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\Twitch Studio\*\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 29/62] Processing: Deleting Apple (iTunes) cache..
ECHO Удаление кэша Apple (iTunes)..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Apple') {Remove-Item '%SystemDrive%\ProgramData\Apple\Installer Cache\*','%SystemDrive%\Users\*\Music\iTunes\Album Artwork\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 30/62] Processing: Deleting Spotify cache..
ECHO Удаление кэша Spotify..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Spotify') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Spotify\Data\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 31/62] Processing: Deleting Clipchamp cache..
ECHO Удаление кэша Clipchamp..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Packages\Clipchamp*') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Packages\Clipchamp*\LocalState\EBWebView\Default\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 32/62] Processing: Deleting PowerToys cache..
ECHO Удаление кэша PowerToys..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Microsoft\PowerToys') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Microsoft\PowerToys\Updates\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 33/62] Processing: Deleting ScreenClip cache..
ECHO Удаление кэша ScreenClip..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Packages\MicrosoftWindows.Client.CBS*') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Packages\MicrosoftWindows.Client.CBS*\TempState\ScreenClip\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 34/62] Processing: Removing Python (pip) cache..
ECHO Удаление кэша Python (pip)..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\pip') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\pip\cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 35/62] Processing: Removing Visual Studio cache..
ECHO Удаление кэша Microsoft Visual Studio..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Microsoft\VisualStudio') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Microsoft\VisualStudio\*\ComponentModelCache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 36/62] Processing: Removing GitHub Desktop cache..
ECHO Удаление кэша GitHub Desktop..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\GitHub Desktop') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\GitHub Desktop\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 37/62] Processing: Removing Java cache..
ECHO Удаление кэша Java..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\LocalLow\Sun\Java') {Remove-Item '%SystemDrive%\Users\*\AppData\LocalLow\Sun\Java\Deployment\cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 38/62] Processing: Deleting Minecraft cache..
ECHO Удаление кэша Minecraft..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\.minecraft') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\.minecraft\webcache*\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 39/62] Processing: Deleting Steam cache..
ECHO Удаление кэша Steam..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Steam') {Remove-Item '%SystemDrive%\Program Files*\Steam\appcache\*','%SystemDrive%\Users\*\AppData\Local\Steam\htmlcache\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 40/62] Processing: Deleting Epic Launcher cache..
ECHO Удаление кэша Epic Launcher..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Epic Games') {Remove-Item '%SystemDrive%\ProgramData\Epic\EpicGamesLauncher\Data\ContentCache\*','%SystemDrive%\Users\*\AppData\Local\EpicGamesLauncher\Saved\*\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 41/62] Processing: Deleting Origin/EA Launcher cache..
ECHO Удаление кэша Origin / EA Launcher..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Origin') {Remove-Item '%SystemDrive%\ProgramData\Origin\CatalogCache\*','%SystemDrive%\Users\*\AppData\Local\Origin\Origin\cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 42/62] Processing: Deleting Battle.net cache..
ECHO Удаление кэша Battle.net..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Battle.net') {Remove-Item '%SystemDrive%\ProgramData\Battle.net\Agent\data\cache\*','%SystemDrive%\Users\*\AppData\Local\Battle.net\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 43/62] Processing: Deleting Ubisoft Connect cache..
ECHO Удаление кэша Ubisoft Connect (Uplay)..
PowerShell -Command "if (Test-Path '%SystemDrive%\Program Files*\Ubisoft') {Remove-Item '%SystemDrive%\Program Files*\Ubisoft\Ubisoft Game Launcher\cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 44/62] Processing: Deleting Rockstar Games cache..
ECHO Удаление кэша Rockstar Games..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\Documents\Rockstar Games') {Remove-Item '%SystemDrive%\Users\*\Documents\Rockstar Games\Social Club\Launcher\Renderer\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 45/62] Processing: Deleting GOG cache..
ECHO Удаление кэша GOG..
PowerShell -Command "if (Test-Path '%SystemDrive%\ProgramData\GOG.com') {Remove-Item '%SystemDrive%\ProgramData\GOG.com\Galaxy\webcache\common\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 46/62] Processing: Deleting SteelSeries GG cache..
ECHO Удаление кэша SteelSeries GG..
PowerShell -Command "if (Test-Path '%SystemDrive%\ProgramData\SteelSeries\GG') {Remove-Item '%SystemDrive%\ProgramData\SteelSeries\GG\updates\*','%SystemDrive%\Users\*\AppData\Roaming\steelseries-gg-client\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 47/62] Processing: Deleting OpenVPN Connect cache..
ECHO Удаление кэша OpenVPN Connect..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\OpenVPN Connect') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\OpenVPN Connect\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 48/62] Processing: Deleting Windows 11 Widgets cache..
ECHO Удаление кэша виджетов Windows 11..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Packages\MicrosoftWindows.Client.WebExperience*') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Packages\MicrosoftWindows.Client.WebExperience*\LocalState\EBWebView\Default\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 49/62] Processing: Deleting CryptnetUrlCache cache..
ECHO Удаление кэша CryptnetUrlCache..
PowerShell -Command Remove-Item '%SystemDrive%\Users\*\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content\*' -Recurse -Force 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 50/62] Processing: Deleting Internet Explorer cache..
ECHO Удаление кэша Internet Explorer..
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 51/62] Processing: Deleting Microsoft Edge cache..
ECHO Удаление кэша Microsoft Edge..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Microsoft\Edge') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Microsoft\Edge\User Data\*\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 52/62] Processing: Deleting Google Chrome cache..
ECHO Удаление кэша Google Chrome..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Google\Chrome') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Google\Chrome\User Data\*\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 53/62] Processing: Deleting Yandex Browser cache..
ECHO Удаление кэша Yandex Browser..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Yandex') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Yandex\YandexBrowser\User Data\*\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 54/62] Processing: Deleting Opera cache..
ECHO Удаление кэша Opera..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Opera Software') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Opera Software\Opera*\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 55/62] Processing: Deleting Mozilla Firefox cache..
ECHO Удаление кэша Mozilla Firefox..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Mozilla\Firefox') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Mozilla\Firefox\Profiles\*\cache2\entries\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 56/62] Processing: Deleting Thunderbird cache..
ECHO Удаление кэша Thunderbird..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Thunderbird') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Thunderbird\Profiles\*\cache2\entries\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 57/62] Processing: Deleting Vivaldi cache..
ECHO Удаление кэша Vivaldi..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Vivaldi') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Vivaldi\User Data\*\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 58/62] Processing: Deleting Brave Browser cache..
ECHO Удаление кэша Brave Browser..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\BraveSoftware') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\BraveSoftware\Brave-Browser\User Data\*\Cache\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 59/62] Processing: Deleting Roblox cache..
ECHO Удаление кэша Roblox..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Roblox') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Roblox\logs\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 60/62] Processing: Deleting Qbittorrent cache..
ECHO Удаление кэша Qbittorrent..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\qBittorrent') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\qBittorrent\logs\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 61/62] Processing: Deleting Vortex Mod Manager cache..
ECHO Удаление кэша Vortex Mod Manager..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\Vortex') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\Vortex\temp\*','%SystemDrive%\Users\*\AppData\Roaming\Vortex\logs\*' -Recurse -Force}" 2>nul >nul

cls
COLOR F9
ECHO.&ECHO [Task 62/62] Processing: Clearing fonts and icons cache..
ECHO Очистка кэша шрифтов и значков..
TaskKill /F /IM Explorer.exe 2>nul >nul
net Stop "FontCache" /yes 2>nul >nul
PowerShell -Command Remove-Item '%SystemDrive%\Windows\System32\FNTCACHE.DAT','%SystemDrive%\Users\*\AppData\Local\Microsoft\Windows\Explorer\*.db' -Recurse -Force 2>nul >nul
net Start "FontCache" 2>nul >nul
Start Explorer.exe 2>nul >nul

cls
PowerShell -command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Cache and junk files removed successfully!\nКэш и ненужные файлы успешно удалены!', 'CleareNova Success', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}"
EXIT
