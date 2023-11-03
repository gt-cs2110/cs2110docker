@echo off
setlocal enabledelayedexpansion

set release=stable
set imageBaseName=gtcs2110/cs2110docker-c
set imageName=%imageBaseName%:%release%

set description="Run the CS 2110 C Docker Container: cs2110docker.bat [start|stop|help]"


set action=" "
set "arg=%1"
if not defined arg (
    set action=start
    goto end_if
)
if /i "%arg%"=="start" (
    set action=start
    goto end_if
)
if /i "%arg%"=="stop" (
    set action=stop
    goto end_if
) 
if /i "%arg%"=="help" (
    echo %description%
    exit /b 0
) 
set "arg=%2"
if defined arg (
    echo Error: unrecognized argument %2
    exit /b 1
)
:end_if

docker container ps > nul 2>&1
if "%errorlevel%" neq "0" (
    echo ERROR: Docker not found. Ensure that Docker is installed and is running before running this script. Refer to the CS 2110 Docker Guide.
    exit /b 1
)

echo Found Docker Installation

if "%action%"=="stop" (
    for /f "tokens=3" %%A in ('docker images ^| findstr /c:"gtcs2110/cs2110docker-c"') do set imageId=%%A
    for /f "tokens=1" %%i in ('docker ps -qf "ancestor=%imageId%"') do (
        set containerId=%%i
        echo !containerId!
        if !containerId!=="" (
            echo No existing CS 2110 containers
        ) else (
            docker stop !containerId!
            docker rm -f !containerId!
        )
    )
    echo Successfully stopped all CS 2110 containers
    exit /b 0
)

echo Pulling down most recent image of %imageName%
docker pull %imageName%
if "%errorlevel%" neq "0" (
    echo ERROR: Unable to pull down the most recent image of %imageName%
    exit /b 1
)

set currDir=%cd%

if "%action%"=="start" (
    docker run --rm -v "%currDir%:/cs2110/host" --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it "%imageName%"
    exit /b 0
)
