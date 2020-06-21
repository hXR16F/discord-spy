@echo off
setlocal EnableDelayedExpansion

for /f "tokens=2 delims=@" %%i in (
	'tasklist /v ^| findstr /i /c:"discord"'
) do (
	for /f "tokens=1 delims= " %%j in ("%%i") do (
		set "person=%%j"
		echo [discord-spy] Person you've messaged recently: !person!.
	)
)

if not defined person (
	for /f "tokens=2 delims=#" %%i in (
		'tasklist /v ^| findstr /i /c:"discord"'
	) do (
		for /f "tokens=1 delims= " %%j in ("%%i") do (
			set "server=%%j"
			echo [discord-spy] Channel you've visited recently !server!.
		)
	)
)

if not defined person if not defined server echo [discord-spy] Cannot find person/channel.

pause
