#IfWinActive, The First Descendant
#NoEnv

isRunning := false
isPaused := false


F1::
    isRunning := true
    isPaused := false
    SoundBeep, 1000, 200
    SetTimer, CheckColor, 100 
return


F2::
    SoundBeep, 500, 200
    isPaused := !isPaused
return


F3::
    isRunning := false
    isPaused := false
    SetTimer, CheckColor, Off 
return

CheckColor:
    if (isRunning && !isPaused)
    {
        PixelGetColor, color, 1015, 101, RGB
        if (color = 0xE4312D)
        {
            SoundBeep, 1100, 200
            Send, {V}
            Sleep, 250
            Send, {ESC}
            Sleep, 100 
            Click, 147, 334
            Sleep, 150
            Send, {Space}
            Sleep, 1000
            Send {Lbutton Down}
            Sleep, 1200
            Send {Lbutton Up}
        }
    }
return
