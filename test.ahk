#Persistent
#NoEnv
SetBatchLines, -1
ListLines, Off
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

; Definiere die Farben und die Position
blueColor := 0x0000FF  ; Blau, z.B. RGB(0, 0, 255)
redColor := 0xFF0000   ; Rot, z.B. RGB(255, 0, 0)
searchPositionX := 100  ; Beispielposition X
searchPositionY := 100  ; Beispielposition Y
radius := 10
screenWidth := A_ScreenWidth
screenHeight := A_ScreenHeight

; Variable für die gespeicherte Maustaste
global savedButton := ""

; Funktion zur Farbsuche an einer bestimmten Position
FindColorAtPosition(color, x, y) {
    PixelSearch, foundX, foundY, x - 1, y - 1, x + 1, y + 1, color, 0, Fast
    return (ErrorLevel = 0)
}

; Funktion zum Klicken der Maustaste
ClickMouseButton(button) {
    Click, %button%
}

; Hauptschleife
Loop {
    ; Suche nach der blauen Farbe an der gegebenen Position
    if (FindColorAtPosition(blueColor, searchPositionX, searchPositionY)) {
        ; Die blaue Farbe wurde gefunden, speichere die zu verwendende Maustaste
        savedButton := "left"
    } else {
        ; Die blaue Farbe wurde nicht gefunden, speichere die rechte Maustaste
        savedButton := "right"
    }
    
    ; Warte einen Moment, um die Farbumwandlung zu überwachen
    Sleep, 1000 ; Anpassbar, je nachdem, wie schnell sich die Farbe ändert

    ; Suche nach der roten Farbe im Bereich, der den 10-Pixel-Radius um die ursprüngliche Position ignoriert
    ; Der nicht ignorierte Bereich besteht aus vier Rechtecken
    ; 1. Oben links vom Ignorierbereich
    PixelSearch, foundX, foundY, 0, 0, searchPositionX - radius - 1, searchPositionY - radius - 1, redColor, 0, Fast
    if (ErrorLevel = 0) {
        ClickMouseButton(savedButton)
        continue
    }
    
    ; 2. Oben rechts vom Ignorierbereich
    PixelSearch, foundX, foundY, searchPositionX + radius + 1, 0, screenWidth, searchPositionY - radius - 1, redColor, 0, Fast
    if (ErrorLevel = 0) {
        ClickMouseButton(savedButton)
        continue
    }

    ; 3. Unten links vom Ignorierbereich
    PixelSearch, foundX, foundY, 0, searchPositionY + radius + 1, searchPositionX - radius - 1, screenHeight, redColor, 0, Fast
    if (ErrorLevel = 0) {
        ClickMouseButton(savedButton)
        continue
    }
    
    ; 4. Unten rechts vom Ignorierbereich
    PixelSearch, foundX, foundY, searchPositionX + radius + 1, searchPositionY + radius + 1, screenWidth, screenHeight, redColor, 0, Fast
    if (ErrorLevel = 0) {
        ClickMouseButton(savedButton)
        continue
    }
    
    ; Warten, bevor die nächste Überprüfung durchgeführt wird
    Sleep, 1000
}
