@echo off

set /P VERSION=<VERSION

for /f "tokens=1,2 delims=." %%a in ("%VERSION%") do (
    set VERSION_MAJOR_PART=%%a
    set VERSION_MINOR_PART=%%b
)

set VERSION_MAJOR="%VERSION_MAJOR_PART%"
set VERSION_MINOR="%VERSION_MAJOR_PART%.%VERSION_MINOR_PART%"

docker build ^
 -t touchifyapp/ssh ^
 -t touchifyapp/ssh:latest ^
 -t touchifyapp/ssh:%VERSION_MAJOR% ^
 -t touchifyapp/ssh:%VERSION_MINOR% ^
 -t touchifyapp/ssh:%VERSION% ^
 .
