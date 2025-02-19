@echo off & cd /d "%~dp0"
fsutil dirty query %systemdrive% >nul && goto:GA || nsudo -U:E -P:E -UseCurrentConsole "%~0" %* && exit /b
:GA
echo.
echo [33m add to Desktop Right-click [0m
:: menu
reg add "HKCR\DesktopBackground\Shell\1Toggle" /v "SeparatorBefore" /t REG_SZ /d "" /f
reg add "HKCR\DesktopBackground\Shell\1Toggle" /v "SubCommands" /t REG_SZ /d "" /f
reg add "HKCR\DesktopBackground\Shell\1Toggle" /v "Icon" /t REG_SZ /d "c:\windows\system32\mmsys.cpl,-115" /f
reg add "HKCR\DesktopBackground\Shell\1Toggle" /v "MUIVerb" /t REG_SZ /d "Toggle Disable/Enable Search" /f
:: sub-menu
reg add "HKCR\DesktopBackground\Shell\1Toggle\shell\3Search" /v "icon" /t REG_SZ /d "c:\windows\SystemResources\compstui.dll.mun,-64008" /f
reg add "HKCR\DesktopBackground\Shell\1Toggle\shell\3Search" /v "MUIVerb" /t REG_SZ /d "Disable SearchApp" /f
reg add "HKCR\DesktopBackground\Shell\1Toggle\shell\3Search\command" /ve /t REG_SZ /d "\"%~dp0toggle-on-off-win10-search.bat\"" /f
pause
exit