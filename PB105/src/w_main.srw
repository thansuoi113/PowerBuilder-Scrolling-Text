$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type sle_4 from uo_sle_typingtext within w_main
end type
type sle_3 from singlelineedit within w_main
end type
type sle_2 from uo_sle_scrollingtext within w_main
end type
type sle_1 from uo_sle_scrollingtext within w_main
end type
type st_3 from statictext within w_main
end type
type sle_speed from singlelineedit within w_main
end type
type cb_2 from commandbutton within w_main
end type
type cb_1 from commandbutton within w_main
end type
end forward

global type w_main from window
integer width = 2875
integer height = 1284
boolean titlebar = true
string title = "Scrolling Text"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_4 sle_4
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
st_3 st_3
sle_speed sle_speed
cb_2 cb_2
cb_1 cb_1
end type
global w_main w_main

forward prototypes
public function string wf_running (string as_text, long as_num)
end prototypes

public function string wf_running (string as_text, long as_num);Return Mid(as_text ,(as_num + 1) ) + Left(as_text ,as_num)


end function

on w_main.create
this.sle_4=create sle_4
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.st_3=create st_3
this.sle_speed=create sle_speed
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.sle_4,&
this.sle_3,&
this.sle_2,&
this.sle_1,&
this.st_3,&
this.sle_speed,&
this.cb_2,&
this.cb_1}
end on

on w_main.destroy
destroy(this.sle_4)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.sle_speed)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event timer;sle_3.Text = wf_running(sle_3.Text,1)

end event

type sle_4 from uo_sle_typingtext within w_main
integer x = 73
integer y = 744
integer width = 2670
integer height = 144
integer taborder = 20
integer textsize = -18
string text = "https://programmingmethodsit.com"
end type

type sle_3 from singlelineedit within w_main
integer x = 73
integer y = 32
integer width = 2670
integer height = 172
integer taborder = 10
integer textsize = -18
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "https://programmingmethodsit.com "
borderstyle borderstyle = stylelowered!
end type

type sle_2 from uo_sle_scrollingtext within w_main
integer x = 73
integer y = 516
integer width = 2670
integer height = 144
integer taborder = 10
integer textsize = -18
string text = "https://programmingmethodsit.com"
end type

type sle_1 from uo_sle_scrollingtext within w_main
integer x = 73
integer y = 288
integer width = 2670
integer height = 144
integer taborder = 10
integer textsize = -18
string text = "https://programmingmethodsit.com "
end type

type st_3 from statictext within w_main
integer x = 73
integer y = 1024
integer width = 219
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Speed:"
boolean focusrectangle = false
end type

type sle_speed from singlelineedit within w_main
integer x = 293
integer y = 1004
integer width = 439
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "100"
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_main
integer x = 1097
integer y = 1004
integer width = 293
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Stop"
end type

event clicked;sle_1.of_stop()
sle_2.of_stop()
timer(0)
sle_4.of_stop()
end event

type cb_1 from commandbutton within w_main
integer x = 768
integer y = 1004
integer width = 293
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Start"
end type

event clicked;sle_1.of_start( 1, Long(sle_speed.Text))
sle_2.of_start( 2, Long(sle_speed.Text))
timer(Long(sle_speed.Text)/1000)

sle_4.of_start( Long(sle_speed.Text))
end event

