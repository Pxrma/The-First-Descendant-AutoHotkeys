#Requires AutoHotkey v2.0

F1:: {
    Send("{V}")
    Sleep(100)
    Send("{ESC}")
    Sleep(100)  
    Click(147, 334, "L")
    Sleep(100)  
    Send("{Space}")
}