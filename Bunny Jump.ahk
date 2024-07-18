macroOn := false

F1::
    macroOn := !macroOn  ;
    if (macroOn) {
        SetTimer, PressKeys, 100 
        SoundBeep, 1000, 200
    } else {
        SetTimer, PressKeys, Off  
        SoundBeep, 500, 200
    }
    Sleep, 1000
    Tooltip  
    return

PressKeys:
    if (macroOn) {
        Send, {Space down}
        Send, {Space up}
        Send, {Space down}
        Send, {Space up}
        Send, v
    }
    return