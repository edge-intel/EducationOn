@echo off
setlocal

rem Short Description
echo This script redirects user folders (Desktop and Documents) to local paths on each machine.
echo It lists all users, allows the admin to select users and redirection options, and provides a summary of operations.
echo Inputs: Usernames, redirection choices (Desktop, Documents, or both).
echo Outputs: Success or failure of folder creation, content copy, and redirection.
echo No legal warranty from the author. Use at your own risk.
echo    For more help: info@education-on.org
echo.

rem ASCII Header
echo.
echo.           _                  _       _       _ 
echo.   ___  __| | __ _  ___      (_)_ __ | |_ ___| |
echo.  / _ \/ _` |/ _` |/ _ \_____| | '_ \| __/ _ \ |
echo. |  __/ (_| | (_| |  __/_____| | | | | ||  __/ |
echo.  \___|\__,_|\__, |\___|     |_|_| |_|\__\___|_|
echo.             |___/                              
echo.
echo.    --> edge-intel.com | education-on.org <--
echo.

rem Check for admin privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires administrative privileges. Please run as administrator.
    pause
    exit /b
)

rem Prompt for target usernames
echo Listing all users on this system:
for /d %%u in (C:\Users\*) do (
    set "username=%%~nxu"
    echo %username%
)

echo.
echo Please enter the usernames for which you want to apply the script, separated by spaces:
set /p targetUsers=Usernames: 

rem Prompt for redirection choices
echo.
echo Please choose which redirections to apply:
echo 1. Redirect Desktop only
echo 2. Redirect Documents only
echo 3. Redirect both Desktop and Documents
set /p redirectionChoice=Choice (1, 2, or 3): 

rem Validate the redirection choice
if "%redirectionChoice%" neq "1" if "%redirectionChoice%" neq "2" if "%redirectionChoice%" neq "3" (
    echo Invalid choice. Exiting.
    pause
    exit /b
)

rem Initialize summary variables
set "summary="
set "result="

rem Loop through each username and apply the folder redirections
for %%u in (%targetUsers%) do (
    call :redirectFolders %%u
)

echo.
echo ======================
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

if "%redirectionChoice%" neq "2" (
    if not exist "%LocalDesktopPath%" (
        mkdir "%LocalDesktopPath%"
        if %errorlevel% equ 0 (
            set "result=Desktop Folder Created"
        ) else (
            set "result=Failed to Create Desktop Folder"
        )
    ) else (
        set "result=Desktop Folder Already Exists"
    )

    rem Copy current Desktop contents to the local folder
    robocopy "C:\Users\%targetUser%\Desktop" "%LocalDesktopPath%" /mir /e
    if %errorlevel% lss 8 (
        set "result=%result%, Desktop Contents Copied"
    ) else (
        set "result=%result%, Failed to Copy Desktop Contents"
    )

    rem Redirect Desktop to the local folder
    reg load HKU\TempHive "C:\Users\%targetUser%\NTUSER.DAT"
    reg add "HKU\TempHive\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop /t REG_EXPAND_SZ /d "%LocalDesktopPath%" /f
    if %errorlevel% equ 0 (
        set "result=%result%, Desktop Redirected"
    ) else (
        set "result=%result%, Failed to Redirect Desktop"
    )
    reg unload HKU\TempHive
)

if "%redirectionChoice%" neq "1" (
    if not exist "%LocalDocumentsPath%" (
        mkdir "%LocalDocumentsPath%"
        if %errorlevel% equ 0 (
            set "result=%result%, Documents Folder Created"
        ) else (
            set "result=%result%, Failed to Create Documents Folder"
        )
    ) else (
        set "result=Documents Folder Already Exists"
    )

    rem Copy current Documents contents to the local folder
    robocopy "C:\Users\%targetUser%\Documents" "%LocalDocumentsPath%" /mir /e
    if %errorlevel% lss 8 (
        set "result=%result%, Documents Contents Copied"
    ) else (
        set "result=%result%, Failed to Copy Documents Contents"
    )

    rem Redirect Documents to the local folder
    reg load HKU\TempHive "C:\Users\%targetUser%\NTUSER.DAT"
    reg add "HKU\TempHive\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Personal /t REG_EXPAND_SZ /d "%LocalDocumentsPath%" /f
    if %errorlevel% equ 0 (
        set "result=%result%, Documents Redirected"
    ) else (
        set "result=%result%, Failed to Redirect Documents"
    )
    reg unload HKU\TempHive
)

rem Append the result to the summary
set "summary=%summary%%targetUser%: %result%%newline%"

echo Folder redirection complete for %targetUser%.

goto :eof
