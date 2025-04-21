@ECHO OFF
CHCP 65001>NUL
COLOR F9
TITLE CleareNova (Windows 10, 11) by luc6i

ECHO CleareNova By Luc6i Forked From MilesthoN
ECHO.

:: Check for admin rights
net sess>NUL 2>&1||(powershell try{saps '%0'-Verb RunAs}catch{}&exit)

cls
MODE 62,8
set total_tasks=59

ECHO [Task 1/59 - 1.69%%] Processing: Deleting temporary files..
PowerShell -Command "Remove-Item '%SystemDrive%\ProgramData\Temp\*','%SystemDrive%\Windows\Temp\*','%SystemDrive%\Users\*\AppData\Local\Temp\*','%SystemDrive%\Users\*\AppData\Local\Packages\*\AC\Temp\*' -Recurse -Force -ErrorAction SilentlyContinue" 2>nul >nul

ECHO [Task 2/59 - 3.39%%] Processing: Removing Windows update files..
net stop cryptsvc /yes 2>nul >nul
PowerShell -Command "Remove-Item '%SystemDrive%\$Windows.~BT','%SystemDrive%\$Windows.~WS','%SystemDrive%\Windows\SoftwareDistribution\Download\*','%SystemDrive%\Windows\Logs\WindowsUpdate\*.log' -Recurse -Force -ErrorAction SilentlyContinue" 2>nul >nul
net start cryptsvc 2>nul >nul

ECHO [Task 3/59 - 5.08%%] Processing: Deleting logs..
PowerShell -Command "Remove-Item '%SystemDrive%\Windows\*.log','%SystemDrive%\Windows\logs\*.log','%SystemDrive%\Windows\Panther\*.log' -Recurse -Force -ErrorAction SilentlyContinue" 2>nul >nul

ECHO [Task 4/59 - 6.78%%] Processing: Removing unnecessary Windows folders..
PowerShell -Command "if (Test-Path '%SystemDrive%\PerfLogs') {Remove-Item '%SystemDrive%\PerfLogs' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 5/59 - 8.47%%] Processing: Deleting memory dumps..
PowerShell -Command "Remove-Item '%SystemDrive%\*.dmp','%SystemDrive%\Users\*\AppData\Local\CrashDumps\*' -Recurse -Force -ErrorAction SilentlyContinue" 2>nul >nul

ECHO [Task 6/59 - 10.17%%] Processing: Deleting SRUDB.dat..
net stop DPS /yes 2>nul >nul
PowerShell -Command "Remove-Item '%SystemDrive%\Windows\System32\sru\*' -Recurse -Force -ErrorAction SilentlyContinue" 2>nul >nul
net start DPS 2>nul >nul

ECHO [Task 7/59 - 11.86%%] Processing: Cleaning up Windows Search (Windows.edb)..
Sc config wsearch start=disabled 2>nul >nul
Net stop wsearch 2>nul >nul
EsentUtl.exe /d "%SystemDrive%\ProgramData\Microsoft\Search\Data\Applications\Windows\Windows.edb" 2>nul >nul
Sc config wsearch start=delayed-auto 2>nul >nul
Net start wsearch 2>nul >nul

ECHO [Task 8/59 - 13.56%%] Processing: Removing empty folders in system32..
PowerShell -Command "Remove-Item '%SystemDrive%\Windows\System32\config\systemprofile\AppData\Local\*.tmp' -Recurse -Force -ErrorAction SilentlyContinue" 2>nul >nul

ECHO [Task 9/59 - 15.25%%] Processing: Disable program cache..
PowerShell -Command "Remove-Item '%SystemDrive%\Windows\Installer\*.tmp' -Recurse -Force -ErrorAction SilentlyContinue" 2>nul >nul

ECHO [Task 10/59 - 16.95%%] Processing: Deleting Windows history..
PowerShell -Command "Remove-Item '%SystemDrive%\Users\*\AppData\Local\Microsoft\Windows\History\*' -Recurse -Force -ErrorAction SilentlyContinue" 2>nul >nul

ECHO [Task 11/59 - 18.64%%] Processing: Removing network shortcuts..
PowerShell -Command "Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\Microsoft\Windows\Network Shortcuts\*' -Recurse -Force -ErrorAction SilentlyContinue" 2>nul >nul

ECHO [Task 12/59 - 20.34%%] Processing: Deleting RDP cache..
PowerShell -Command "Remove-Item '%SystemDrive%\Users\*\AppData\Local\Microsoft\Terminal Server Client\cache\*' -Recurse -Force -ErrorAction SilentlyContinue" 2>nul >nul

ECHO [Task 13/59 - 22.03%%] Processing: Deleting DirectX Shader cache..
PowerShell -Command "Remove-Item '%SystemDrive%\Users\*\AppData\Local\D3DSCache\*' -Recurse -Force -ErrorAction SilentlyContinue" 2>nul >nul

ECHO [Task 14/59 - 23.73%%] Processing: Deleting Microsoft Store cache..
Start /min /wait WSReset.exe 2>nul >nul

ECHO [Task 15/59 - 25.42%%] Processing: Deleting OneDrive cache..
PowerShell -Command "Remove-Item '%SystemDrive%\Users\*\AppData\Local\Microsoft\OneDrive\logs\*' -Recurse -Force -ErrorAction SilentlyContinue" 2>nul >nul

ECHO [Task 16/59 - 27.12%%] Processing: Deleting Nvidia cache.. PowerShell -Command "if (Test-Path '%SystemDrive%\ProgramData\NVIDIA') {Remove-Item '%SystemDrive%\ProgramData\NVIDIA*','%SystemDrive%\ProgramData\NVIDIA Corporation\GeForce Experience\Logs*.log','%SystemDrive%\ProgramData\NVIDIA Corporation\NV_Cache*','%SystemDrive%\Users*\AppData\Local\NVIDIA\GLCache*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NV_Cache*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NVIDIA GeForce Experience\CefCache\Cache*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NVIDIA GeForce Experience\CefCache\Code Cache*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NVIDIA GeForce Experience\CefCache\Crashpad*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NVIDIA GeForce Experience\CefCache\GPUCache*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NVIDIA GeForce Experience\CefCache\Service Worker\CacheStorage*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NVIDIA GeForce Experience\CefCache\Service Worker\ScriptCache*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NVIDIA Notification\CefCache\Cache*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NVIDIA Notification\CefCache\Code Cache*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NVIDIA Notification\CefCache\Crashpad*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NVIDIA Notification\CefCache\GPUCache*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NVIDIA Notification\CefCache\Service Worker\CacheStorage*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NVIDIA Notification\CefCache\Service Worker\ScriptCache*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NVIDIA Share\CefCache\Cache*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NVIDIA Share\CefCache\Code Cache*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NVIDIA Share\CefCache\Crashpad*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NVIDIA Share\CefCache\GPUCache*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NVIDIA Share\CefCache\Service Worker\CacheStorage*','%SystemDrive%\Users*\AppData\Local\NVIDIA Corporation\NVIDIA Share\CefCache\Service Worker\ScriptCache*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul PowerShell -Command "if (Test-Path '%SystemDrive%\ProgramData\NVIDIA') {Get-ChildItem -Path '%SystemDrive%\ProgramData\NVIDIA Corporation\Downloader' -Recurse | Where {$_.Name -as [guid]} | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 17/59 - 28.81%%] Processing: Deleting Adobe cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\Adobe') {Remove-Item '%SystemDrive%\Users\*\AppData\LocalLow\Adobe\Common\Media Cache\*','%SystemDrive%\Users\*\AppData\Roaming\Adobe\Common\Media Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 18/59 - 30.51%%] Processing: Deleting Microsoft Teams cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Microsoft\Teams') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Microsoft\Teams\Cache\*','%SystemDrive%\Users\*\AppData\Roaming\Microsoft\Teams\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 19/59 - 32.20%%] Processing: Deleting Zoom cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\Zoom') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\Zoom\data\WebviewCache\*\zoomapps\*\EBWebView\Default\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 20/59 - 33.90%%] Processing: Deleting Telegram cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\Telegram Desktop') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\Telegram Desktop\tdata\user_data*\cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 21/59 - 35.59%%] Processing: Deleting Discord cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\Discord') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\Discord\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 22/59 - 37.29%%] Processing: Deleting WhatsApp cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\WhatsApp') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\WhatsApp\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 23/59 - 38.98%%] Processing: Deleting OBS cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\obs-studio') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\obs-studio\plugin_config\obs-browser\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 24/59 - 40.68%%] Processing: Deleting Streamlabs cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\slobs-client') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\slobs-client\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 25/59 - 42.37%%] Processing: Deleting Twitch Studio cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\Twitch Studio') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\Twitch Studio\*\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 26/59 - 44.07%%] Processing: Deleting Apple (iTunes) cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Apple') {Remove-Item '%SystemDrive%\ProgramData\Apple\Installer Cache\*','%SystemDrive%\Users\*\Music\iTunes\Album Artwork\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 27/59 - 45.76%%] Processing: Deleting Spotify cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Spotify') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Spotify\Data\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 28/59 - 47.46%%] Processing: Deleting Clipchamp cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Packages\Clipchamp*') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Packages\Clipchamp*\LocalState\EBWebView\Default\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 29/59 - 49.15%%] Processing: Deleting PowerToys cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Microsoft\PowerToys') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Microsoft\PowerToys\Updates\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 30/59 - 50.85%%] Processing: Deleting ScreenClip cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Packages\MicrosoftWindows.Client.CBS*') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Packages\MicrosoftWindows.Client.CBS*\TempState\ScreenClip\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 31/59 - 52.54%%] Processing: Removing Python (pip) cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\pip') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\pip\cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 32/59 - 54.24%%] Processing: Removing Visual Studio cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Microsoft\VisualStudio') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Microsoft\VisualStudio\*\ComponentModelCache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 33/59 - 55.93%%] Processing: Removing GitHub Desktop cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\GitHub Desktop') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\GitHub Desktop\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 34/59 - 57.63%%] Processing: Removing Java cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\LocalLow\Sun\Java') {Remove-Item '%SystemDrive%\Users\*\AppData\LocalLow\Sun\Java\Deployment\cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 35/59 - 59.32%%] Processing: Deleting Minecraft cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\.minecraft') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\.minecraft\webcache*\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 36/59 - 61.02%%] Processing: Deleting Steam cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Steam') {Remove-Item '%SystemDrive%\Program Files*\Steam\appcache\*','%SystemDrive%\Users\*\AppData\Local\Steam\htmlcache\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 37/59 - 62.71%%] Processing: Deleting Epic Launcher cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Epic Games') {Remove-Item '%SystemDrive%\ProgramData\Epic\EpicGamesLauncher\Data\ContentCache\*','%SystemDrive%\Users\*\AppData\Local\EpicGamesLauncher\Saved\*\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 38/59 - 64.41%%] Processing: Deleting Origin/EA Launcher cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Origin') {Remove-Item '%SystemDrive%\ProgramData\Origin\CatalogCache\*','%SystemDrive%\Users\*\AppData\Local\Origin\Origin\cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 39/59 - 66.10%%] Processing: Deleting Battle.net cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Battle.net') {Remove-Item '%SystemDrive%\ProgramData\Battle.net\Agent\data\cache\*','%SystemDrive%\Users\*\AppData\Local\Battle.net\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 40/59 - 67.80%%] Processing: Deleting Ubisoft Connect cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Program Files*\Ubisoft') {Remove-Item '%SystemDrive%\Program Files*\Ubisoft\Ubisoft Game Launcher\cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 41/59 - 69.49%%] Processing: Deleting Rockstar Games cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\Documents\Rockstar Games') {Remove-Item '%SystemDrive%\Users\*\Documents\Rockstar Games\Social Club\Launcher\Renderer\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 42/59 - 71.19%%] Processing: Deleting GOG cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\ProgramData\GOG.com') {Remove-Item '%SystemDrive%\ProgramData\GOG.com\Galaxy\webcache\common\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 43/59 - 72.88%%] Processing: Deleting SteelSeries GG cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\ProgramData\SteelSeries\GG') {Remove-Item '%SystemDrive%\ProgramData\SteelSeries\GG\updates\*','%SystemDrive%\Users\*\AppData\Roaming\steelseries-gg-client\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 44/59 - 74.58%%] Processing: Deleting OpenVPN Connect cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\OpenVPN Connect') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\OpenVPN Connect\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 45/59 - 76.27%%] Processing: Deleting Windows 11 Widgets cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Packages\MicrosoftWindows.Client.WebExperience*') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Packages\MicrosoftWindows.Client.WebExperience*\LocalState\EBWebView\Default\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 46/59 - 77.97%%] Processing: Deleting CryptnetUrlCache cache..
PowerShell -Command "Remove-Item '%SystemDrive%\Users\*\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content\*' -Recurse -Force -ErrorAction SilentlyContinue" 2>nul >nul

ECHO [Task 47/59 - 79.66%%] Processing: Deleting Internet Explorer cache..
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8 2>nul >nul

ECHO [Task 48/59 - 81.36%%] Processing: Deleting Microsoft Edge cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Microsoft\Edge') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Microsoft\Edge\User Data\*\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 49/59 - 83.05%%] Processing: Deleting Google Chrome cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Google\Chrome') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Google\Chrome\User Data\*\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 50/59 - 84.75%%] Processing: Deleting Yandex Browser cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Yandex') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Yandex\YandexBrowser\User Data\*\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 51/59 - 86.44%%] Processing: Deleting Opera cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Opera Software') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Opera Software\Opera*\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 52/59 - 88.14%%] Processing: Deleting Mozilla Firefox cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Mozilla\Firefox') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Mozilla\Firefox\Profiles\*\cache2\entries\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 53/59 - 89.83%%] Processing: Deleting Thunderbird cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Thunderbird') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Thunderbird\Profiles\*\cache2\entries\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 54/59 - 91.53%%] Processing: Deleting Vivaldi cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Vivaldi') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Vivaldi\User Data\*\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 55/59 - 93.22%%] Processing: Deleting Brave Browser cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\BraveSoftware') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\BraveSoftware\Brave-Browser\User Data\*\Cache\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 56/59 - 94.92%%] Processing: Deleting Roblox cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\Roblox') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\Roblox\logs\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 57/59 - 96.61%%] Processing: Deleting Qbittorrent cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Local\qBittorrent') {Remove-Item '%SystemDrive%\Users\*\AppData\Local\qBittorrent\logs\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 58/59 - 98.31%%] Processing: Deleting Vortex Mod Manager cache..
PowerShell -Command "if (Test-Path '%SystemDrive%\Users\*\AppData\Roaming\Vortex') {Remove-Item '%SystemDrive%\Users\*\AppData\Roaming\Vortex\temp\*','%SystemDrive%\Users\*\AppData\Roaming\Vortex\logs\*' -Recurse -Force -ErrorAction SilentlyContinue}" 2>nul >nul

ECHO [Task 59/59 - 100.00%%] Processing: Clearing fonts and icons cache..
TaskKill /F /IM Explorer.exe 2>nul >nul
net Stop "FontCache" /yes 2>nul >nul
PowerShell -Command "Remove-Item '%SystemDrive%\Windows\System32\FNTCACHE.DAT','%SystemDrive%\Users\*\AppData\Local\Microsoft\Windows\Explorer\*.db' -Recurse -Force -ErrorAction SilentlyContinue" 2>nul >nul
net Start "FontCache" 2>nul >nul
Start Explorer.exe 2>nul >nul

cls
PowerShell -command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Cache and junk files removed successfully!', 'CleareNova Success', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}"
EXIT
