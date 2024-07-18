#Persistent
toggle := true 
SetTimer, PressV, 13250 
GoSub, PressV 
Return

F1:: 
toggle := !toggle 
If (toggle)
{
    Send, v
    SetTimer, PressV, 13250 
    SoundBeep, 1000, 200
    Sleep, 1000 
    GoSub, PressV 
}
Else
{
    SetTimer, PressV, Off 
    ToolTip, Skript deaktiviert
    Sleep, 1000
    SoundBeep, 500, 200
}
Return

PressV:
Send, v 
Sleep, 200 
Click, down 
Sleep, 8000 
Click, up 
Return
