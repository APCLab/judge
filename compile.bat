@echo off

:: check argument
if "%1" EQU "" goto err
if "%2" EQU "" goto err

:: start
echo "compile %1 -> %2"

for /f %%f in ('dir /b %1\*.c %1\*.cpp') do (
    echo %%f
    if "%3" NEQ "" (
        cl.exe /O2 "%1\\%%f" > "%3\\%%f.txt"
    )
    else (
        cl.exe /O2 "%1\\%%f"
    )
)

:: move
mv *.exe %2

:: clean
rm -f *.obj

:exit
exit /b

:err
echo "argument is required"
