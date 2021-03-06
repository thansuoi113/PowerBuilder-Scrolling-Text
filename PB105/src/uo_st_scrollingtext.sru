$PBExportHeader$uo_st_scrollingtext.sru
forward
global type uo_st_scrollingtext from statictext
end type
type os_size from structure within uo_st_scrollingtext
end type
end forward

type os_size from structure
	long		cx
	long		cy
end type

global type uo_st_scrollingtext from statictext
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
event timer pbm_timer
end type
global uo_st_scrollingtext uo_st_scrollingtext

type prototypes
Function UInt SetTimer( UInt hwin, UInt idtimer, UInt TimeOut, Long tmprc ) Library "user32.dll"
Function Boolean KillTimer( UInt hwin, UInt idtimer ) Library "user32.dll"
Function ULong GetDC(ULong hWnd) Library "user32.dll"
Function ULong SelectObject(ULong hdc, ULong hWnd) Library "gdi32.dll"
Function Boolean GetTextExtentPoint32A(ULong hdcr, String lpString, Long nCount, Ref os_size size) Library "gdi32.dll"
Function Long ReleaseDC(ULong hWnd, ULong hdcr) Library "user32.dll"


end prototypes

type variables
Constant Integer WM_GETFONT = 49
end variables

forward prototypes
public subroutine adjustsize ()
public subroutine addspace ()
public function integer settext (string as_text)
public subroutine of_stop ()
public subroutine of_start (integer ai_type, long al_time)
end prototypes

event timer;SetRedraw(False)
Text = Mid(Text,2) + Left(Text,1)
SetRedraw(True)


end event

public subroutine adjustsize ();If Len(Text) < 1 Then Return

ULong lul_Handle, lul_hDC, lul_hFont
//integer li_font
os_size lstr_Size

//li_font = this.textsize + 1

// create device context for statictext
lul_Handle = Handle(This)
lul_hDC = GetDC(lul_Handle)
// get handle to the font used by statictext
lul_hFont = Send(lul_Handle, WM_GETFONT, 0, 0)
// Select it into the device context
SelectObject(lul_hDC, lul_hFont)

If Not GetTextExtentPoint32A(lul_hDC, Text, Len(Text), lstr_Size) Then
	ReleaseDC(lul_Handle, lul_hDC)
	Return
End If

// convert length in pixels to PBUnits
Width = PixelsToUnits(lstr_Size.cx, XPixelsToUnits!)
//Height = PixelsToUnits(lstr_Size.cy, YPixelsToUnits!)

// release the device context
ReleaseDC(lul_Handle, lul_hDC)



end subroutine

public subroutine addspace ();If Len(Text) < 1 Then Return

ULong lul_Handle, lul_hDC, lul_hFont
os_size lstr_Size

// create device context for statictext
lul_Handle = Handle(This)
lul_hDC = GetDC(lul_Handle)
// get handle to the font used by statictext
lul_hFont = Send(lul_Handle, WM_GETFONT, 0, 0)
// Select it into the device context
SelectObject(lul_hDC, lul_hFont)

String ls_text =  "  " 
long ll_widthchar, ll_numchar

If Not GetTextExtentPoint32A(lul_hDC, ls_text, Len(ls_text), lstr_Size) Then
	ReleaseDC(lul_Handle, lul_hDC)
	Return
End If

ll_widthchar =  PixelsToUnits(lstr_Size.cx , XPixelsToUnits!)
If ll_widthchar < 1 Then ll_widthchar = 1
ll_numchar = long(Width/ll_widthchar)

If ll_numchar <=0 Then ll_numchar = 1
Text =  Text + Fill(" ", ll_numchar)

// release the device context
ReleaseDC(lul_Handle, lul_hDC)

end subroutine

public function integer settext (string as_text);If IsNull(as_text) Then Return -1
If Len(as_text) = 0 Then Return -1
Text = as_text
Return 1
end function

public subroutine of_stop ();KillTimer( Handle( this ),0 )
end subroutine

public subroutine of_start (integer ai_type, long al_time);If al_time < 1 Then al_time = 1

Choose Case ai_type
	Case 1
		adjustsize( )
		SetTimer( Handle( This ), 0, al_time, 0 )
	Case 2
		addspace( )
		SetTimer( Handle( This ), 0, al_time, 0 )
End Choose



end subroutine

on uo_st_scrollingtext.create
end on

on uo_st_scrollingtext.destroy
end on

event destructor;KillTimer( Handle( this ),0 )
end event

