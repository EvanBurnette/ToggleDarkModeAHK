#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; written with version 1.1.33.6
dark := true

^#t::
Send,#i
WinWaitActive, Settings,,2 ;if there's an active window "Settings" in less than 2 seconds
if ErrorLevel
{
	MsgBox, WinWait timed out.
	return
}
else
{
	Sleep,1000
	if dark
		Send,{Text}turn on light mode systemwide
	else
		Send,{Text}turn on dark mode systemwide
		Sleep,1000 ;windows is slow so we have to go slow here
	Sleep,1500
	Send,{Down}
	Sleep,200
	Send,{enter}
	Sleep,200
	if dark
	{
		sleep,500
		Send,{Up} ;select light mode
		dark := false
		Sleep,200
	}
	else
	{
		Sleep,200
		Send,{tab}
		Sleep,200
		Send,{tab}
		Sleep,200
		Send,{Down} ;select dark mode
		dark := true
	}
	Sleep,200
	WinClose, Settings
}
return