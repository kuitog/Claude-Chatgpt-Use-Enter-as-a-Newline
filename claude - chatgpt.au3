; AutoHotkey - Enter/Shift+Enter swap for Claude/ChatGPT in Chrome
; If Chrome is open and Claude or Chatgpt is in the tab title: it will work
; Press Shift+Enter to send Shift+Enter (newline)
; Press Shift+Enter to send Enter (send message)


Global $bProcessing = False

HotKeySet("{ENTER}", "OnEnter")
HotKeySet("+{ENTER}", "OnShiftEnter")



While 1
    Sleep(100)
WEnd

Func OnEnter()
    If $bProcessing Then Return
    $bProcessing = True

    Local $sTitle = WinGetTitle("[ACTIVE]")

    ; Check if window title contains Chrome AND (Claude or ChatGPT)
    If (StringInStr($sTitle, "Chrome") > 0 Or StringInStr($sTitle, "Google Chrome") > 0) And _
       (StringInStr($sTitle, "Claude") > 0 Or StringInStr($sTitle, "ChatGPT") > 0) Then
        HotKeySet("{ENTER}")
        HotKeySet("+{ENTER}")
        Sleep(50)
        Send("{SHIFTDOWN}{ENTER}{SHIFTUP}") ; Explicit Shift control. Avoids shift stuck glitch if sending Shift+Enter in a single command.
        Sleep(50)
        HotKeySet("{ENTER}", "OnEnter")
        HotKeySet("+{ENTER}", "OnShiftEnter")
    Else
        HotKeySet("{ENTER}")
        Sleep(20)
        Send("{ENTER}")
        Sleep(20)
        HotKeySet("{ENTER}", "OnEnter")
    EndIf

    $bProcessing = False
EndFunc

Func OnShiftEnter()
    If $bProcessing Then Return
    $bProcessing = True

    Local $sTitle = WinGetTitle("[ACTIVE]")

    ; Check if window title contains Chrome AND (Claude or ChatGPT)
    If (StringInStr($sTitle, "Chrome") > 0 Or StringInStr($sTitle, "Google Chrome") > 0) And _
       (StringInStr($sTitle, "Claude") > 0 Or StringInStr($sTitle, "ChatGPT") > 0) Then
        HotKeySet("+{ENTER}")
        HotKeySet("{ENTER}")
        Sleep(50)
        Send("{SHIFTUP}") ; Release Shift first!
        Sleep(20)
        Send("{ENTER}") ; Just Enter
        Sleep(50)
        HotKeySet("+{ENTER}", "OnShiftEnter")
        HotKeySet("{ENTER}", "OnEnter")
    Else
        HotKeySet("+{ENTER}")
        Sleep(20)
        Send("{SHIFTDOWN}{ENTER}{SHIFTUP}") ; Explicit control
        Sleep(20)
        HotKeySet("+{ENTER}", "OnShiftEnter")
    EndIf

    $bProcessing = False
EndFunc


