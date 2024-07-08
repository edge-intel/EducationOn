@echo on
setlocal

rem ASCII Header
echo. 
echo.     _____    _                 ___       _       _                        
echo.    | ____|__| | __ _  ___     |_ _|_ __ | |_ ___| |    ___ ___  _ __ ___  
echo.    |  _| / _` |/ _` |/ _ \_____| || '_ \| __/ _ \ |   / __/ _ \| '_ ` _ \ 
echo.    | |__| (_| | (_| |  __/_____| || | | | ||  __/ |  | (_| (_) | | | | | |
echo.    |_____\__,_|\__, |\___|    |___|_| |_|\__\___|_| (_)___\___/|_| |_| |_|
echo.                |___/                                                      
echo.                         --> edge-intel.com <--
echo.

rem Prompt for admin credentials
echo Please enter the username of an administrator to run this script:
set /p adminUser=Username: 
runas /user:%adminUser% cmd /c call :main

:main
rem Prompt for target usernames
echo Please enter the usernames for which you want to apply the script, separated by spaces:
set /p targetUsers=Usernames: 

rem Initialize summary variables
set "summary="
set "result="

rem Loop through each username and apply the folder redirections
for %%u in (%targetUsers%) do (
    call :redirectFolders %%u
)

echo.
echo Summary of Operations:
echo ======================
echo %summary%
echo.

goto :eof

:redirectFolders
set targetUser=%1

rem Define variables for folder redirection
set "LocalDesktopPath=C:\Users\%targetUser%\LocalDesktop"
set "LocalDocumentsPath=C:\Users\%targetUser%\LocalDocuments"

rem Create the local desktop and documents folders if they don't exist
set "result="
if not exist "%LocalDesktopPath%" (
    echo Creating local Desktop folder for %targetUser%...
    mkdir "%LocalDesktopPath%"
    if %errorlevel% equ 0 (
        set "result=Success"
    ) else (
        set "result=Failed"
    )
) else (
    echo Local Desktop folder already exists for %targetUser%.
    set "result=Exists"
)

if not exist "%LocalDocumentsPath%" (
    echo Creating local Documents folder for %targetUser%...
    mkdir "%LocalDocumentsPath%"
    if %errorlevel% equ 0 (
        set "result=%result%, Success"
    ) else (
        set "result=%result%, Failed"
    )
) else (
    echo Local Documents folder already exists for %targetUser%.
    set "result=%result%, Exists"
)

rem Copy current Desktop and Documents contents to the local folders
echo Copying current Desktop contents to local Desktop for %targetUser%...
robocopy "C:\Users\%targetUser%\Desktop" "%LocalDesktopPath%" /mir /e
if %errorlevel% lss 8 (
    set "result=%result%, Success"
) else (
    set "result=%result%, Failed"
)

echo Copying current Documents contents to local Documents for %targetUser%...
robocopy "C:\Users\%targetUser%\Documents" "%LocalDocumentsPath%" /mir /e
if %errorlevel% lss 8 (
    set "result=%result%, Success"
) else (
    set "result=%result%, Failed"
)

rem Redirect Desktop and Documents to the local folders
echo Redirecting Desktop to local folder for %targetUser%...
reg load HKU\TempHive "C:\Users\%targetUser%\NTUSER.DAT"
reg add "HKU\TempHive\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop /t REG_EXPAND_SZ /d "%LocalDesktopPath%" /f
if %errorlevel% equ 0 (
    set "result=%result%, Success"
) else (
    set "result=%result%, Failed"
)

echo Redirecting Documents to local folder for %targetUser%...
reg add "HKU\TempHive\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Personal /t REG_EXPAND_SZ /d "%LocalDocumentsPath%" /f
if %errorlevel% equ 0 (
    set "result=%result%, Success"
) else (
    set "result=%result%, Failed"
)
reg unload HKU\TempHive

rem Append the result to the summary
set "summary=%summary%%targetUser%: %result%%newline%"

echo Folder redirection complete for %targetUser%.

goto :eof
