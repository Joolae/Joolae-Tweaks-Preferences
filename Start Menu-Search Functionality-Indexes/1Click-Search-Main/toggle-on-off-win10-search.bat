@echo off & cd /d "%~dp0"
fsutil dirty query %systemdrive% >nul && goto :GA || nsudo -U:E -P:E -UseCurrentConsole "%~0" %* && exit /b
:GA
cd /d "C:\Windows\SystemApps"
if exist "Microsoft.Windows.Search_cw5n1h2txyewy" (goto Disable) else (goto Enable)
:Disable
TASKKILL /F /IM SearchApp.exe /T
ren "Microsoft.Windows.Search_cw5n1h2txyewy" "++Microsoft.Windows.Search_cw5n1h2txyewy" || goto Disable
reg add "HKCR\DesktopBackground\Shell\1Toggle\shell\3Search" /v "icon" /t REG_SZ /d "c:\windows\SystemResources\compstui.dll.mun,-64007" /f
reg add "HKCR\DesktopBackground\Shell\1Toggle\shell\3Search" /v "MUIVerb" /t REG_SZ /d "Enable SearchApp" /f
exit
:Enable
ren "++Microsoft.Windows.Search_cw5n1h2txyewy" "Microsoft.Windows.Search_cw5n1h2txyewy"
reg add "HKCR\DesktopBackground\Shell\1Toggle\shell\3Search" /v "icon" /t REG_SZ /d "c:\windows\SystemResources\compstui.dll.mun,-64008" /f
reg add "HKCR\DesktopBackground\Shell\1Toggle\shell\3Search" /v "MUIVerb" /t REG_SZ /d "Disable SearchApp" /f
exit