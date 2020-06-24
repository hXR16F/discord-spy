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
			set "channel=%%j"
			echo [discord-spy] Channel you've visited recently: !channel!.
		)
	)
)

if not defined person if not defined channel echo [discord-spy] Cannot find person/channel.

pause
