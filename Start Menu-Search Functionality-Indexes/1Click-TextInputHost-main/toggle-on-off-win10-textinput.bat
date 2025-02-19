@echo off & cd /d "%~dp0"
fsutil dirty query %systemdrive% >nul && goto :GA || nsudo -U:E -P:E -UseCurrentConsole "%~0" %* && exit /b
:GA
cd /d "C:\Windows\SystemApps"
if exist "MicrosoftWindows.Client.CBS_cw5n1h2txyewy" (goto Disable) else (goto Enable)
:Disable
TASKKILL /F /IM TextInputHost.exe /T
ren "MicrosoftWindows.Client.CBS_cw5n1h2txyewy" "++MicrosoftWindows.Client.CBS_cw5n1h2txyewy" || goto Disable
reg add "HKCR\DesktopBackground\Shell\2Toggle\shell\3Text" /v "icon" /t REG_SZ /d "c:\windows\SystemResources\compstui.dll.mun,-64007" /f
reg add "HKCR\DesktopBackground\Shell\2Toggle\shell\3Text" /v "MUIVerb" /t REG_SZ /d "Enable Text Input" /f
exit
:Enable
ren "++MicrosoftWindows.Client.CBS_cw5n1h2txyewy" "MicrosoftWindows.Client.CBS_cw5n1h2txyewy"
reg add "HKCR\DesktopBackground\Shell\2Toggle\shell\3Text" /v "icon" /t REG_SZ /d "c:\windows\SystemResources\compstui.dll.mun,-64008" /f
reg add "HKCR\DesktopBackground\Shell\2Toggle\shell\3Text" /v "MUIVerb" /t REG_SZ /d "Disable Text Input" /f
exit