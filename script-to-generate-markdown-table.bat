@echo off
setlocal enabledelayedexpansion

set "InputFile=EE_Vocabulary.txt"
set "OutputFile=EE_Vocabulary.md"

for /f "usebackq tokens=*" %%a in ("%InputFile%") do (
    set "line=%%a"
    if "!line:~0,1!"=="#" (
        echo %%a >> %OutputFile%
        echo.|set /p="|English|Chinese|" >> %OutputFile%
        echo.>> %OutputFile%
        echo ^|-^|-^| >> %OutputFile%
    ) else (
        set "line=%%a"
        call :trimSpaces line
        for /f "tokens=1,* delims=," %%b in ("!line!") do (
            echo.|set /p="|%%b|%%c|" >> %OutputFile%
            echo.>> %OutputFile%
        )
    )
)

echo Done. Table is in %OutputFile%
goto :eof

:trimSpaces
set "str=!%1!"
set "str=!str:	= !"
set "str=!str: ,=,!"
set "str=!str:, =,!"
set "%1=!str!"
goto :eof