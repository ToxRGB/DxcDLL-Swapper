@echo off
setlocal

rem Force working directory to script location
cd /d "%~dp0"

rem Case 1: if *.old versions exist — perform downgrade
if exist amdxc32.dll.old if exist amdxc64.dll.old (
    rem rename current DLLs as .new
    ren amdxc32.dll       amdxc32.dll.new
    ren amdxc64.dll       amdxc64.dll.new

    rem rename the .old files to .dll
    ren amdxc32.dll.old   amdxc32.dll
    ren amdxc64.dll.old   amdxc64.dll

    echo Dxc DLLs were downgraded. Press any key to exit.
    pause >nul
    goto :EOF
)

rem Case 2: if *.new versions exist — revert to .dll and rename current as .old
if exist amdxc32.dll.new if exist amdxc64.dll.new (
    rem rename current DLLs as .old
    ren amdxc32.dll       amdxc32.dll.old
    ren amdxc64.dll       amdxc64.dll.old

    rem rename the .new files to .dll
    ren amdxc32.dll.new   amdxc32.dll
    ren amdxc64.dll.new   amdxc64.dll

    echo Dxc DLLs were reverted. Press any key to exit.
    pause >nul
    goto :EOF
)

rem No matching .old or .new pairs found
echo No .old or .new DLL pairs found in this folder.
echo Make sure you are running this script in the correct directory.
echo Press any key to exit.
pause >nul