#Requires AutoHotkey v2.0

global HelixMode := False
global HelixCommandMode := False
global HelixInsertMode := False
global HelixGotoMode := False
global HelixViewMode := False
global HelixViewGotoMode := False

; from https://stackoverflow.com/questions/77949869/detecting-if-a-text-is-selected-in-autohotkey
IsTextSelected()
{
    SavedClip := ClipboardAll()
    A_Clipboard := ""
    Send("^c")
    Result := ClipWait(0.05) ; Wait for the clipboard to contain data
    A_Clipboard := SavedClip
    SavedClip := ""
    return Result
}


!\::{
	global HelixMode := True
	global HelixCommandMode := False
	global HelixInsertMode := False
	global HelixGotoMode := False
	global HelixViewMode := False
	global HelixViewGotoMode := False
}

#HotIf HelixMode
; Normal mode
$h::Send "{Left}"
$j::Send "{Down}"
$k::Send "{Up}"
$l::Send "{Right}"
$w::Send "^{Right}"
$b::Send "^{Left}"
$e::Send "^{Right}"
$+e::MsgBox "Unimplemented"
$+w::MsgBox "Unimplemented"
$+b::MsgBox "Unimplemented"
$t::MsgBox "Unimplemented"
$f::MsgBox "Unimplemented"
$+t::MsgBox "Unimplemented"
$+f::MsgBox "Unimplemented"
$+G::MsgBox "Unimplemented"
$^b::Send "{PgUp}"
$^f::Send "{PgDn}"
$^u::MsgBox "Unimplemented"
$^d::MsgBox "Unimplemented"
$^i::MsgBox "Unimplemented"
$^o::MsgBox "Unimplemented"
$^s::MsgBox "Unimplemented"
; Changes
$r::MsgBox "Unimplemented"
$+r::Send "^v"
$+`::MsgBox "Unimplemented"
$`::MsgBox "Unimplemented"
$!`::MsgBox "Unimplemented"
$i::{
	global HelixMode := False
	global HelixInsertMode := True
	if (IsTextSelected()) {
		Send "{Left}"
	}
}
$a::{
	global HelixMode := False
	global HelixInsertMode := True
	if (IsTextSelected()) {
		Send "{Right}"
	}
}
$+i::{
	global HelixMode := False
	global HelixInsertMode := True
	Send "{Home}"
}
$+a::{
	global HelixMode := False
	global HelixInsertMode := True
	Send "{End}"
}
$o::{
	global HelixMode := False
	global HelixInsertMode := True
	Send "{End}{Enter}"
}
$+o::{
	global HelixMode := False
	global HelixInsertMode := True
	Send "{Home}{Enter}{Left}"
}
$.::MsgBox "Unimplemented"
$u::Send "^z"
$+u::Send "^+z"
$!u::MsgBox "Unimplemented"
$!+u::MsgBox "Unimplemented"
$y::Send "^c"
$p::{
	if (IsTextSelected()) {
		Send "{Right}"
	}
	Send "^v"
}
$+p::{
	if (IsTextSelected()) {
		Send "{Left}"
	}
	Send "^v"
}
$+.::MsgBox "Unimplemented"
$+'::MsgBox "Unimplemented"
$=::MsgBox "Unimplemented"
$d::{
	Send "^c"
	Send "{Delete}"
}
$!d::Send "{Delete}"
$c::{
	global HelixMode := False
	global HelixInsertMode := True
	Send "^c"
	ClipWait(0.05)
	Send "{Delete}"
}
$!c::{
	global HelixMode := False
	global HelixInsertMode := True
	Send "{Delete}"
}
$^a::MsgBox "Unimplemented"
$^x::MsgBox "Unimplemented"
$+q::MsgBox "Unimplemented"
$q::MsgBox "Unimplemented"

; Shell
$+\::MsgBox "Unimplemented"
$!+\::MsgBox "Unimplemented"
$+1::MsgBox "Unimplemented"
$+4::MsgBox "Unimplemented"

; Selections
$s::MsgBox "Unimplemented"
$+s::MsgBox "Unimplemented"
$!s::MsgBox "Unimplemented"
$!-::MsgBox "Unimplemented"
$!+-::MsgBox "Unimplemented"
$+7::MsgBox "Unimplemented"
$+-::MsgBox "Unimplemented"
$;::{
	if (IsTextSelected()) {
		Send "{Left}"
	}
}
$!;::MsgBox "Unimplemented"
$,::MsgBox "Unimplemented"
$!,::MsgBox "Unimplemented"
$+c::MsgBox "Unimplemented"
$!+c::MsgBox "Unimplemented"
$+9::MsgBox "Unimplemented"
$+0::MsgBox "Unimplemented"
$!+9::MsgBox "Unimplemented"
$!+0::MsgBox "Unimplemented"
$+5::Send "^a"
$x::{
	Send "{Home}"
	Send "+{End}"
}
$+x::MsgBox "Unimplemented"
$!x::MsgBox "Unimplemented"
$+j::MsgBox "Unimplemented"
$!+j::MsgBox "Unimplemented"
$+k::MsgBox "Unimplemented"
$!+k::MsgBox "Unimplemented"
$^c::MsgBox "Unimplemented"

; Search
$/::MsgBox "Unimplemented"
$+/::MsgBox "Unimplemented"
$n::MsgBox "Unimplemented"
$+n::MsgBox "Unimplemented"
$+8::MsgBox "Unimplemented"

; Other Modes
$z::MsgBox "Unimplemented"
$g::{
	global HelixMode := False
	global HelixGotoMode := True
}
$m::MsgBox "Unimplemented"
$Space::MsgBox "Unimplemented"
$]::MsgBox "Unimplemented"
$[::MsgBox "Unimplemented"
$v::{
	global HelixMode := False
	global HelixViewMode := True
}
$+;::{
	global HelixMode := False
	global HelixCommandMode := True
}

#HotIf HelixCommandMode
$Capslock::{
	global HelixCommandMode := False
	global HelixMode := True
}
$w::{
	global HelixCommandMode := False
	global HelixMode := True
	Send "^s"
}
$q::{
	global HelixCommandMode := False
}
$x::{
	global HelixCommandMode := False
	Send "^s"
}

#HotIf HelixGotoMode
$Capslock::{
	global HelixGotoMode := False
	global HelixMode := True
}
$g::{
	global HelixGotoMode := False
	global HelixMode := True
	Send "^a"
	Send "{Left}"
}
$e::{
	global HelixGotoMode := False
	global HelixMode := True
	Send "^a"
	Send "{Right}"
}
$f::{
	global HelixGotoMode := False
	global HelixMode := True
	MsgBox "Unimplemented"
}
$h::{
	global HelixGotoMode := False
	global HelixMode := True
	Send "{Home}"
}
$l::{
	global HelixGotoMode := False
	global HelixMode := True
	Send "{End}"
}
$s::{
	global HelixGotoMode := False
	global HelixMode := True
	MsgBox "Unimplemented"
}
$t::{
	global HelixGotoMode := False
	global HelixMode := True
	MsgBox "Unimplemented"
}
$c::{
	global HelixGotoMode := False
	global HelixMode := True
	MsgBox "Unimplemented"
}
$b::{
	global HelixGotoMode := False
	global HelixMode := True
	MsgBox "Unimplemented"
}
$d::{
	global HelixGotoMode := False
	global HelixMode := True
	MsgBox "Unimplemented"
}
$y::{
	global HelixGotoMode := False
	global HelixMode := True
	MsgBox "Unimplemented"
}
$r::{
	global HelixGotoMode := False
	global HelixMode := True
	MsgBox "Unimplemented"
}
$i::{
	global HelixGotoMode := False
	global HelixMode := True
	MsgBox "Unimplemented"
}
$a::{
	global HelixGotoMode := False
	global HelixMode := True
	MsgBox "Unimplemented"
}
$m::{
	global HelixGotoMode := False
	global HelixMode := True
	MsgBox "Unimplemented"
}
$n::{
	global HelixGotoMode := False
	global HelixMode := True
	MsgBox "Unimplemented"
}
$p::{
	global HelixGotoMode := False
	global HelixMode := True
	MsgBox "Unimplemented"
}
$.::{
	global HelixGotoMode := False
	global HelixMode := True
	MsgBox "Unimplemented"
}
$j::{
	global HelixGotoMode := False
	global HelixMode := True
	MsgBox "Unimplemented"
}
$k::{
	global HelixGotoMode := False
	global HelixMode := True
	MsgBox "Unimplemented"
}
$w::{
	global HelixGotoMode := False
	global HelixMode := True
	MsgBox "Unimplemented"
}

#HotIf HelixInsertMode
$Capslock::{
	global HelixInsertMode := False
	global HelixMode := True
}

#HotIf HelixViewMode
$Capslock::{
	global HelixViewMode := False
	global HelixMode := True
}
$h::Send "+{Left}"
$j::Send "+{Down}"
$k::Send "+{Up}"
$l::Send "+{Right}"
$w::Send "^+{Right}"
$b::Send "^+{Left}"
$e::Send "^+{Right}"
$+r::{
	global HelixViewMode := False
	global HelixMode := True
	Send "^v"
}
$i::{
	global HelixViewMode := False
	global HelixInsertMode := True
	if (IsTextSelected()) {
		Send "{Left}"
	}
}
$a::{
	global HelixViewMode := False
	global HelixInsertMode := True
	if (IsTextSelected()) {
		Send "{Right}"
	}
}
$+i::{
	global HelixViewMode := False
	global HelixInsertMode := True
	Send "{Home}"
}
$+a::{
	global HelixViewMode := False
	global HelixInsertMode := True
	Send "{End}"
}
$o::{
	global HelixViewMode := False
	global HelixInsertMode := True
	Send "{End}{Enter}"
}
$+o::{
	global HelixViewMode := False
	global HelixInsertMode := True
	Send "{Home}{Enter}{Left}"
}
$u::Send "^z"
$+u::Send "^+z"
$y::{
	global HelixViewMode := False
	global HelixMode := True
	Send "^c"
}
$p::{
	global HelixViewMode := False
	global HelixMode := True
	if (IsTextSelected()) {
		Send "{Right}"
	}
	Send "^v"
}
$+p::{
	global HelixViewMode := False
	global HelixMode := True
	if (IsTextSelected()) {
		Send "{Left}"
	}
	Send "^v"
}
$d::{
	global HelixViewMode := False
	global HelixMode := True
	Send "^c"
	Send "{Delete}"
}
$!d::{
	global HelixViewMode := False
	global HelixMode := True
	Send "{Delete}"
}
$c::{
	global HelixViewMode := False
	global HelixInsertMode := True
	Send "^c"
	ClipWait(0.05)
	Send "{Delete}"
}
$!c::{
	global HelixViewMode := False
	global HelixInsertMode := True
	Send "{Delete}"
}
$;::{
	global HelixViewMode := False
	global HelixInsertMode := True
	if (IsTextSelected()) {
		Send "{Left}"
	}
}
$+5::Send "^a"
$x::{
	Send "{Home}"
	Send "+{End}"
}
$v::{
	global HelixViewMode := False
	global HelixMode := True
}
$g::{
	global HelixViewMode := False
	global HelixViewGotoMode := True
}

#HotIf HelixViewGotoMode
$h::{
	global HelixViewGotoMode := False
	global HelixViewMode := True
	Send "+{Home}"
}
$l::{
	global HelixViewGotoMode := False
	global HelixViewMode := True
	Send "+{End}"
}
$Capslock::{
	global HelixViewGotoMode := False
	global HelixViewMode := True
}
