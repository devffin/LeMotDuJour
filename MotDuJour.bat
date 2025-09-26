@echo off
setlocal enabledelayedexpansion

set "fichier=liste.txt"
if not exist "%fichier%" (
    echo Le fichier %fichier% est introuvable.
	pause
    exit /b
)
set /a lignes=0
for /f "usebackq delims=" %%A in ("%fichier%") do (
    set /a lignes+=1
)
if %lignes%==0 (
    echo Le fichier est vide.
	pause
    exit /b
)
set /a choix=(%random% %% %lignes%) + 1
set /a c=0
for /f "usebackq delims=" %%A in ("%fichier%") do (
    set /a c+=1
    if !c! equ %choix% (
        set "mot=%%A"
    )
)
powershell -command "Add-Type -AssemblyName PresentationFramework;[System.Windows.MessageBox]::Show('Le mot du jour est %mot%','Mot du jour')"

endlocal
exit
