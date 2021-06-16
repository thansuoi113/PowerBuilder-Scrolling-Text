$PBExportHeader$uo_sle_typingtext.sru
forward
global type uo_sle_typingtext from singlelineedit
end type
end forward

global type uo_sle_typingtext from singlelineedit
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
event timer pbm_timer
end type
global uo_sle_typingtext uo_sle_typingtext

type prototypes
Subroutine Sleep(Long lMilliSec) Library "Kernel32.dll"
Function UInt SetTimer( UInt hwin, UInt idtimer, UInt TimeOut, Long tmprc ) Library "user32.dll"
Function Boolean KillTimer( UInt hwin, UInt idtimer ) Library "user32.dll"
end prototypes

type variables
String is_text
boolean ib_stop
long il_speed, il_char
end variables

forward prototypes
public subroutine of_start (long al_time)
public subroutine of_typing ()
public subroutine of_setspeed (long al_speed)
public subroutine of_stop ()
end prototypes

event timer;//of_typing()

il_char++
Text = Text + Mid(is_text, il_char, 1)

If il_char > Len(is_text) Then
	Text = ""
	il_char =  0
End If


end event

public subroutine of_start (long al_time);is_text = Text
Text = ""
il_char = 0
If al_time < 1 Then al_time = 1
SetTimer( Handle( This ), 0, al_time, 0 )

end subroutine

public subroutine of_typing ();If ib_stop Then Return

Long ll_len, li_r
String ls_Text

ls_Text = is_text
ll_len = Len(ls_Text)

Text = ""
For li_r = 1 To ll_len
	If ib_stop Then Exit
	Text = Text + Mid(ls_Text, li_r, 1)
	Sleep(il_speed)
Next

end subroutine

public subroutine of_setspeed (long al_speed);If al_speed < 1 Then al_speed = 1
il_speed = al_speed

end subroutine

public subroutine of_stop ();KillTimer( Handle( this ),0 )
end subroutine

on uo_sle_typingtext.create
end on

on uo_sle_typingtext.destroy
end on

