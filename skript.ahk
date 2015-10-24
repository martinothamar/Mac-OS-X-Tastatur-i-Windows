; ----------------------
; Mac keymap for Windows
; ----------------------
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN

; ---------------
; Basic settings
; ---------------
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

; -------------
; OS Shortcuts
; -------------
LWin & Tab::Send !{Tab} 					; Alt-tabbing
LWin & t::Send ^{t}							; Cmd T > Ctrl T - Open Tab
LWin & w::Send ^{w}							; Cmd W > Ctrl W - Close tab
LWin & c::Send ^{c}							; Copy
LWin & v::Send ^{v}							; Paste
LWin & x::Send ^{x}							; Cut
LWin & z::Send ^{z}							; Undo
LWin & y::Send ^{y}							; Redo
LWin & s::Send ^{s}							; Save
LWin & a::Send ^{a}							; Select all
LWin & f::Send ^{f}							; Find
LWin & q::Send !{f4}						; Quit

; -----------
; Characters
; -----------
$'::Send {@}
$|::Send {'} 
$\::Send {´}
$+\::Send {``}
Shift & 4::Send {$}

; -------------------
; Special characters
; -------------------
LAlt & 8::Send {[}							; Square bracket
LAlt & 9::Send {]}							; Opposite square bracket
LAlt & 7::Send {|}							; |
LShift & 7::								; Backslash
	If GetKeyState("LAlt", "P")
		Send {\}
	Else Send {/}
Return

LShift & 8::								; Curly brace
	If GetKeyState("LAlt","P")
		Send {{}
	Else Send {(}
Return
LShift & 9::								; Opposite curly brace
	If GetKeyState("LAlt","P")
		Send {}}
	Else Send {)}
Return

; ----------------
; Text navigation
; ----------------
LAlt & Left::Send ^{Left}					; Beginning of word
LAlt & Right::Send ^{Right}					; End of word
LWin & Left::SendInput {Home}				; Beginning of line	
LWin & Right::SendInput {End}				; End of line

LShift & Right::							; When Left Shift and Right Arrow
	If GetKeyState("LWin","P")				; If Left Windows is pressed
		SendInput +{End}					; Mark to end of line
	Else If GetKeyState("LAlt","P") 		; Else if Left Alt is pressed
		SendInput ^+{Right}					; Mark to end of word
	Else SendInput +{Right}					; Else mark 1 char right
Return

LShift & Left::								; When Left Shift and Left Arrow
	If GetKeyState("LWin","P")				; If Left Windows is pressed
		SendInput +{Home}					; Mark to beginning of line	
	Else If GetKeyState("LAlt","P")			; Else If Left Alt is pressed
		SendInput ^+{Left}					; Mark to beginning of word
	Else SendInput +{Left}					; Else mark 1 char left
Return

