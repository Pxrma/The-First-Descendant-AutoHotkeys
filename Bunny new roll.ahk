macroOn := false

F1::
    macroOn := !macroOn  
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
        Send, {W down}
        Sleep, 5
        Send, {Ctrl down}
        Sleep, 5
        Send, {W up}
        Send, {Ctrl up}
        Sleep, 750
        Send, v
        Send, {S down}
        Sleep, 5
        Send, {Ctrl down}
        Sleep, 5
        Send, {S up}
        Send, {Ctrl up}
        Sleep, 750  
        Send, v
    }
    return