@echo off
REM ============================================================
REM   Mini-OS / SERC build script
REM   Double-click this file to build both serc_cli.exe and
REM   serc_gui.exe.  Requires MSYS2 UCRT64 at C:\msys64.
REM ============================================================

setlocal
set "MSYS=C:\msys64\ucrt64\bin"

if not exist "%MSYS%\gcc.exe" (
    echo.
    echo  ERROR: gcc not found at %MSYS%
    echo  Install MSYS2 from https://www.msys2.org and run:
    echo     pacman -S mingw-w64-ucrt-x86_64-gcc mingw-w64-ucrt-x86_64-raylib
    echo.
    pause
    exit /b 1
)

set "PATH=%MSYS%;%PATH%"
set "INC=-Iinclude"
set "CF=-std=c11 -Wall -Wextra -O2"
set "CORE=src\pcb.c src\scheduler.c src\memory.c src\ipc.c src\deadlock.c src\logger.c"

echo.
echo [1/2] Building serc_cli.exe (console)...
gcc %CF% %INC% %CORE% src\main_cli.c -o serc_cli.exe -lm
if errorlevel 1 goto :err

echo [2/2] Building serc_gui.exe (raylib dashboard)...
gcc %CF% %INC% %CORE% src\main_gui.c -o serc_gui.exe -lraylib -lopengl32 -lgdi32 -lwinmm -lm
if errorlevel 1 goto :err

if not exist logs mkdir logs
echo.
echo  Build OK.   Run:    serc_cli.exe     or    serc_gui.exe
echo.
pause
exit /b 0

:err
echo.
echo  Build failed. Check error messages above.
pause
exit /b 1
