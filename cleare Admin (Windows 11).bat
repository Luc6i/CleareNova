:: ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
:: ░                    by mmichaelKo                      ░
:: ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@ECHO OFF
setlocal EnableDelayedExpansion
CHCP 65001>NUL
TITLE Очистка кэша by mmichaelKo
MODE 80,26
COLOR f9
ECHO.&ECHO   Запуск от имени Администратора..
2>nul >nul net sess||(powershell saps '%0'-Verb RunAs&exit /b) || (
cls&echo.&echo   Rerun program ^& select "Запуск от имени Администратора..".
>nul pause&exit 0
)
>nul NET SESSION
if %ERRORLEVEL% == 0 (
ECHO.&ECHO   Запуск от имени Администратора..&ECHO.
) else (
ECHO   Недостаточно прав. Запускать от имени администратора!&ECHO.&pause
)

cls

ECHO.
ECHO.
ECHO.
ECHO.
CALL :COLOR f5
CALL :ECHO "                                       ###"
CALL :COLOR f5
CALL :ECHO "                                    #######"
CALL :COLOR f5
CALL :ECHO "                                  #########" 
CALL :COLOR f5
CALL :ECHO "                                 #########"
CALL :COLOR fD
CALL :ECHO "                               ###########" /
CALL :COLOR fD
CALL :ECHO "    #####"
CALL :COLOR fD
CALL :ECHO "                              ###########" /
CALL :COLOR fD
CALL :ECHO "  ########" 
CALL :COLOR f1
CALL :ECHO "                             #####" /
CALL :COLOR f1
CALL :ECHO "  ###############" 
CALL :COLOR f1
CALL :ECHO "                             ####" /
CALL :COLOR f1
CALL :ECHO "   ###############"
CALL :COLOR f9
CALL :ECHO "                                    #######" /
CALL :COLOR f9
CALL :ECHO "  ######" 
CALL :COLOR f9
CALL :ECHO "                                     ###" /
CALL :COLOR f9
CALL :ECHO "     #####"
CALL :COLOR f3
CALL :ECHO "                                             ####"
CALL :COLOR f3
CALL :ECHO "                                            ####"
CALL :COLOR f3
CALL :ECHO "                                            ####" 
CALL :COLOR f3
CALL :ECHO "                                            ####"
CALL :COLOR fB
CALL :ECHO "                                            ####"
CALL :COLOR fB
CALL :ECHO "                                           #####"
CALL :COLOR fB
CALL :ECHO "                                            ####" 
CALL :COLOR fB
CALL :ECHO "                                             ####" 
ping localhost -n 2 >NUL
goto clean
exit/b

:COLOR
 set c=%1& exit/b
:ECHO
 for /f %%i in ('"prompt $h& for %%i in (.) do rem"') do (
  pushd "%~dp0"& <NUL>"%~1_" set/p="%%i%%i  "& findstr/a:%c% . "%~1_*"
  (if "%~2" neq "/" ECHO.)& del "%~1_"& popd& set c=& exit/b
 )

:clean

cls

MODE 80,10

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Очистка диска Windows..
ECHO                 [32m[5m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Active Setup Temp Folders" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\BranchCache" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Downloaded Program Files" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\GameNewsFiles" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\GameStatisticsFiles" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\GameUpdateFiles" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Internet Cache Files" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Memory Dump Files" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Offline Pages Files" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Old ChkDsk Files" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Previous Installations" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
:: REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Recycle Bin" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Service Pack Cleanup" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Setup Log Files" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\System error memory dump files" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\System error minidump files" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Setup Files" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Sync Files" /V StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Update Cleanup" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>NUL 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Upgrade Discarded Files" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\User file versions" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Defender" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting Archive Files" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting Queue Files" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting System Archive Files" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting System Queue Files" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows ESD installation files" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Upgrade Log Files" /v StateFlags0099 /d 2 /t REG_DWORD /f 2>nul >nul
cleanmgr.exe /sagerun:99 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление временных файлов пользователя..
ECHO                 [32m[5m████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Temp\*' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление временных файлов диск C..
ECHO                 [32m[5m████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\Windows\Temp\*' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление файлов обновления Windows..
ECHO                 [32m[5m██████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\$WinREAgent' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\$Windows.~BT' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\$Windows.~WS' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Windows10Upgrade' -Recurse -Force" 2>nul >nul
net stop cryptsvc 2>nul >nul
powershell -command "Remove-Item 'C:\Windows\System32\catroot2\*' -Recurse -Force" 2>nul >nul
net start cryptsvc 2>nul >nul
powershell -command "Remove-Item 'C:\Windows\Logs\WindowsUpdate\*.log' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Windows\SoftwareDistribution\Download\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Cache\*' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление дампов памяти..
ECHO                 [32m[5m███████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\CrashDumps\*' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление кэша Microsoft Store..
ECHO                 [32m[5m████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
:: CD "C:\Windows\system32\"
:: WSReset.exe
:: REM taskkill /IM WinStore.App.exe /F 2>NUL

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Сброс DNS кэша..
ECHO                 [32m[5m█████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
ipconfig /flushdns 2>nul >nul
ipconfig /registerdns 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Сброс ARP кэша..
ECHO                 [32m[5m█████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
netsh interface ip delete arpcache 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Очистка папки WinSxS..
ECHO                 [32m[5m███████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
Dism.exe /Online /Cleanup-Image /StartComponentCleanup 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление пустых ненужных папок в system32 (фикс)..
ECHO                 [32m[5m████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
schtasks /change /disable /tn "\Microsoft\Windows\Management\Provisioning\Logon" 2>nul >nul
powershell -command "Remove-Item 'C:\Windows\System32\config\systemprofile\AppData\Local\*.tmp' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление кэша RDP..
ECHO                 [32m[5m█████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Microsoft\Terminal Server Client\cache\*' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление логов..
ECHO                 [32m[5m██████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\windows\*.log' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Windows\inf\*.log' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Windows\logs\*.log' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Windows\Panther\*.log' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\windows\logs\cbs\*.log' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Windows\Logs\MoSetup\*.log' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Windows\Microsoft.NET\*.log' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Microsoft\Windows\WebCache\*.log' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Microsoft\CLR_v4.0\UsageLogs\*.log' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Microsoft\Windows\SettingSync\*.log' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Microsoft\CLR_v4.0_32\UsageLogs\*.log' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Windows\SysWOW64\config\systemprofile\AppData\Local\Microsoft\CLR_v4.0_32\UsageLogs\*.log' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Logs\*.etl' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление ненужных папок Windows..
ECHO                 [32m[5m███████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\tmp' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\AMD' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\temp' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\INTEL' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\NVIDIA' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\PerfLogs' -Recurse -Force" 2>nul >nul


cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление кэша Nvidia..
ECHO                 [32m[5m██████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\ProgramData\NVIDIA\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\D3DSCache\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\NVIDIA\GLCache\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\ProgramData\NVIDIA Corporation\GeForce Experience\Logs\*.log' -Recurse -Force" 2>nul >nul
powershell -command "Get-ChildItem -path 'C:\ProgramData\NVIDIA Corporation\Downloader' -recurse | where {$_.Name -match '[0-9A-Z]{32}$'} | Remove-Item -Force -Recurse"

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление кэша Microsoft Office..
ECHO                 [32m[5m███████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\Users\*\AppData\Roaming\Microsoft\Office\*.tmp' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Roaming\Microsoft\Office\Recent\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Microsoft\Outlook\RoamCache\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Microsoft\OneNote\16.0\cache\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Microsoft\Office\15.0\OfficeFileCache\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Microsoft\Office\16.0\OfficeFileCache\*' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление истории последних открытых файлов..
ECHO                 [32m[5m███████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
:: powershell -command "Remove-Item 'C:\Users\*\AppData\Roaming\Microsoft\Windows\Recent\*' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление кэша программ..
ECHO                 [32m[5m████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\ProgramData\Package Cache\*' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление сетевых ярлыков..
ECHO                 [32m[5m█████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\Users\*\AppData\Roaming\Microsoft\Windows\Network Shortcuts\*' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление истории Windows..
ECHO                 [32m[5m██████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Microsoft\Windows\History\*' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление кэша Java..
ECHO                 [32m[5m███████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\Users\*\AppData\LocalLow\Sun\Java\Deployment\cache\*' -Recurse -Force" 2>nul >null

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление кэша Discord..
ECHO                 [32m[5m████████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\Users\*\AppData\Roaming\Discord\Cache\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Roaming\Discord\GPUCache\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Roaming\Discord\Code Cache\*' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление кэша Adobe..
ECHO                 [32m[5m███████████████████████████░░░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\Users\*\AppData\Roaming\Adobe\Common\Media Cache\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\LocalLow\Adobe\Common\Media Cache\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Roaming\Adobe\Common\Media Cache Files\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\LocalLow\Adobe\Common\Media Cache Files\*' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление кэша Spotify..
ECHO                 [32m[5m█████████████████████████████░░░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Spotify\Data\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Packages\SpotifyAB.SpotifyMusic_zpdnekdrzrea0\LocalCache\Spotify\Data\*' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление кэша ITunes..
ECHO                 [32m[5m███████████████████████████████░░░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\Users\*\AppData\Roaming\Apple Computer\iTunes\iPhone Software Updates\*' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление кэша Steam..
ECHO                 [32m[5m█████████████████████████████████░░░░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\Program Files (x86)\Steam\appcache\librarycache\*.jpg' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Program Files (x86)\Steam\appcache\librarycache\*.png' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление кэша Internet Explorer..
ECHO                 [32m[5m██████████████████████████████████░░░░░░░░░░░░░░░░░
CHCP 866>NUL
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8 2>NUL

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление кэша Microsoft Edge..
ECHO                 [32m[5m████████████████████████████████████░░░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\Program Files (x86)\Microsoft\EdgeUpdate\Download\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Microsoft\Edge\User Data\Default\Code Cache\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Microsoft\Edge\User Data\Default\Cache\Cache_Data\*' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление кэша Google Chrome..
ECHO                 [32m[5m██████████████████████████████████████░░░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\Program Files\Google\Update\Download\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Program Files (x86)\Google\Update\Download\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Google\Chrome\User Data\Default\Code Cache\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Google\Chrome\User Data\Default\Cache\Cache_Data\*' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление кэша Yandex Browser..
ECHO                 [32m[5m████████████████████████████████████████░░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Yandex\YandexBrowser\User Data\Default\Code Cache\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Yandex\YandexBrowser\User Data\Default\Cache\Cache_Data\*' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление кэша Microsoft Teams..
ECHO                 [32m[5m█████████████████████████████████████████░░░░░░░░░░
CHCP 866>NUL
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Microsoft\Teams\tmp\*' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Microsoft\Teams\Cache\*' -Recurse -Force" 2>nul >nul

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Очистка кэша шрифтов и значков..
ECHO                 [32m[5m█████████████████████████████████████████████░░░░░░
CHCP 866>NUL
reg delete "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /f 2>nul >nul
net stop "FontCache" 2>nul >nul
powershell -command "Remove-Item 'C:\Windows\System32\FNTCACHE.DAT' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Windows\ServiceProfiles\LocalService\AppData\Local\FontCache\*.dat' -Recurse -Force" 2>nul >nul
net start "FontCache" 2>nul >nul
taskkill /f /im explorer.exe 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\Microsoft\Windows\Explorer\*.db' -Recurse -Force" 2>nul >nul
powershell -command "Remove-Item 'C:\Users\*\AppData\Local\IconCache.db' -Recurse -Force" 2>nul >nul
start explorer.exe

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Отключение гибернации..
ECHO                 [32m[5m█████████████████████████████████████████████████░░
CHCP 866>NUL
powercfg.exe /hibernate off

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Очистка оперативной памяти..
ECHO                 [32m[5m██████████████████████████████████████████████████
CHCP 866>NUL
CD "C:\Windows\SysWOW64\"
rundll32.exe

cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
CHCP 65001>NUL
set /p Input=.           Удалить резервные копии Windows? (y (Да)/n (Нет):
CHCP 866>NUL
If /I "%Input%"=="y" goto shadows
goto noshadows

:shadows
cls

CHCP 65001>NUL
COLOR f9
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                 Удаление резервных копий Windows..
CHCP 866>NUL
powershell -Command "Disable-ComputerRestore -Drive 'C:\'" 2>nul >nul
vssadmin delete shadows /all /quiet 2>nul >nul
goto noshadows

:noshadows
cls

CHCP 65001>NUL
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Кэш и ненужные файлы успешно удалены. Место освобождено', 'Успешная очистка', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}"
exit