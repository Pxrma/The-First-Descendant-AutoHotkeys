#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey 2

#IfWinActive, The First Descendant
macroOn := false
interval := 1  ; Interval for the main loop in milliseconds
AbilityDuration := 2200  ; Ability duration in milliseconds
vKeyLastPressed := 0
abilityKey := ""  ; Key for the ability

^!::Reload

F1::
    macroOn := !macroOn  
    if (macroOn) {
        SetTimer, PressKeys, %interval%
        SoundBeep, 1000, 200
        SoundBeep, 1100, 200
    } else {
        SetTimer, PressKeys, Off  
        SoundBeep, 500, 200  
    }
    Sleep, 1000  
    Tooltip  
    return

+F2::
    macroOn := false
    SetTimer, PressKeys, Off
    SoundBeep, 500, 200
    ; Release all keys
    SendInput {Shift up}
    SendInput {W up}
    ; Press keys again so windows doesnt get stuck 
    SendInput {Shift down}
    SendInput {W down}
    SendInput {Shift up}
    SendInput {W up}
    return

PressKeys:
    if (macroOn) {
        currentTime := A_TickCount

        ; Press keys first
        SendInput {Shift down}
        Sleep, 5
        SendInput {W down}
        Sleep, 35
        
        ; Move mouse after pressing keys
        step := 1  ; Smaller step for smoother movement
        totalMovement := 16
        steps := Abs(totalMovement) // step
        remainingMovement := totalMovement
        Loop %steps% {
            if (remainingMovement < -step) {
                DllCall("mouse_event", uint, 1, int, -step, int, 0, uint, 0, int, 0)
                remainingMovement += step
            } else {
                DllCall("mouse_event", uint, 1, int, remainingMovement, int, 0, uint, 0, int, 0)
                break
            }
        }
        
        ; Press ability key depending on ability duration
        if ((currentTime - vKeyLastPressed) > AbilityDuration) {
            SendInput {%abilityKey%}
            vKeyLastPressed := currentTime
        }
        
    }
    return
