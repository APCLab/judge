@echo off

:: check argument
if "%1" NEQ "" (
    set src=%1
) else (
    goto err
)
if "%2" NEQ "" (
    set out=%2
) else (
    goto err
)

:: setup environment
call "%VS140COMNTOOLS%\\vsvars32.bat"

:: looping
for /f "tokens=1 delims=." %%f in ('dir /b %1\*.c %1\*.cpp') do (
    echo %%f
    if "%3" NEQ "" (
        cl.exe /O2 /I=. /Fe:"%out%\\%%f.exe" "%src%\\%%f.cpp" > %3\\%%f.txt
    )
    else (
        cl.exe /O2 /Fe:"%out%\\%%f.exe" "%src%\\%%f.cpp"
    )
)

:: clean
rm -f *.obj

:exit
exit /b

:err
echo "argument is required"
