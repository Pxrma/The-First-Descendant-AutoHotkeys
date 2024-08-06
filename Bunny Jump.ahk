abilityKey := "v" ; Enter the desired key here
abilityKeyInterval := 5000  ; Interval in milliseconds (e.g., 5000 for 5 seconds)
spaceInterval := 100 ; Interval for space key (e.g., 100 milliseconds)

macroOn := false

F1::
    macroOn := !macroOn
    if (macroOn) {

        Send, {%abilityKey%}
        SetTimer, PressSpace, %spaceInterval%
        SetTimer, PressabilityKey, %abilityKeyInterval%
        
        SoundBeep, 1000, 200
    } else {

        SetTimer, PressSpace, Off
        SetTimer, PressabilityKey, Off
        SoundBeep, 500, 200
    }
    Sleep, 1000
    Tooltip
    return

PressSpace:
    if (macroOn) {
        Send, {Space down}
        Sleep, 50
        Send, {Space up}
    }
    return

PressabilityKey:
    if (macroOn) {
        Send, {%abilityKey%}
    }
    return
