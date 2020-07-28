:: Programmed by hXR16F
:: hXR16F.ar@gmail.com, https://github.com/hXR16F

@echo off
setlocal EnableDelayedExpansion
set "name=discord-spy"

echo [%name%] Fetching data...
pushD "%temp%"
tasklist /v | findstr /i /c:"discord" > "%name%.txt"

for /f "tokens=2 delims=@" %%i in (%name%.txt) do (
	for /f "tokens=1 delims=-" %%j in ("%%i") do (
		set "person=%%j"
		echo [%name%] Person you've messaged recently: !person:~0,-1!.
	)
)

if not defined person (
	for /f "tokens=2 delims=#" %%i in (%name%.txt) do (
		for /f "tokens=1 delims= " %%j in ("%%i") do (
			set "channel=%%j"
			echo [%name%] Channel you've visited recently: !channel!.
		)
	)
)

if not defined person if not defined channel echo [%name%] Cannot find person/channel.
if exist "%name%.txt" del /f /q "%name%.txt" >nul
popD

goto :eof
