@echo off

:: check argument
if "%1" NEQ "" (
    set td=%1
    echo set test data to `%td%`
) else (
    goto err
)

if "%2" NEQ "" (
    set exes=%2
    echo set execuable directory to `%exes%`
) else (
    goto err
)

if "%3" NEQ "" (
    set outs=%3
    echo set output directory to `%outs%`
) else (
    goto err
)

:: check output folder exist
if not exist %outs% (
    mkdir %outs%
    echo makedir `%outs%`
)

:: feed
for /f "tokens=1 delims=." %%e in ('dir /b %exes%\\*.exe') do (
    echo feeding %%e
    type %td% | %exes%\\%%e.exe > %outs%\\%%e.txt
)

exit /b

:err
echo argument required
