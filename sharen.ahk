#Persistent
toggle := true 
SetTimer, PressV, 15000 
GoSub, PressV 
Return

F1:: 
toggle := !toggle 
If (toggle)
{
    Send, qq
    SetTimer, PressV, 15000 
    Sleep, 1000 
    GoSub, PressV
    SoundBeep, 1000, 200
}
Else
{
    SetTimer, PressV, Off 
    Sleep, 1000 
    SoundBeep, 500, 200
}
Return

PressV:
Send, q 
Return
