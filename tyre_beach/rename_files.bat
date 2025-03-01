@echo off
setlocal enabledelayedexpansion

:: Get the current folder name
for %%I in (.) do set "foldername=%%~nxI"

:: Initialize counter
set /a counter=1

:: Loop through all files in the current directory
for %%F in (*) do (
    :: Skip the batch file itself
    if not "%%~nxF"=="%~nx0" (
        :: Build the new filename
        set "newname=!foldername!_!counter!%%~xF"
        
        :: Rename the file
        ren "%%F" "!newname!"
        
        :: Increment counter
        set /a counter+=1
        
        echo Renamed: %%F to !newname!
    )
)

echo.
echo Renaming complete.
pause