@echo off
:: Ultimate Windows Repair - Batch Script Version

:: Set colors
color 0A

:: Title
title Ultimate Windows Repair Script

:: Function to check if a command executed successfully
:check_error
if %errorlevel% neq 0 (
    echo Error occurred during the last command.
    exit /b %errorlevel%
)

:: Remove temporary files
echo Removing temporary files...
del /q /f "%temp%\*"
call :check_error

:: Repair system files
echo Checking for system file integrity...
sfc /scannow
call :check_error

:: Clean up disk
echo Cleaning up disk...
diskcleanup.exe /s
call :check_error

:: Disable unnecessary startup items
echo Disabling unnecessary startup items...
msconfig.exe /auto
call :check_error

:: Repair and reset apps
echo Resetting apps...
for /L %%i in (1,1,10) do (
    wsreset.exe
    call :check_error
)

:: Finished
echo Ultimate Windows Repair script completed successfully!
pause
