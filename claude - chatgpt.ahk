; AutoHotkey - Enter/Shift+Enter swap for Claude/ChatGPT in Chrome
; If Chrome is open and Claude or Chatgpt is in the tab title: it will work
; Press Shift+Enter to send Shift+Enter (newline)
; Press Shift+Enter to send Enter (send message)




#SingleInstance Force

; ESC to exit
Esc::ExitApp

; Shift+Enter key (must come BEFORE Enter to take priority)
+Enter::
{
    WinGetTitle, title, A
    
    ; Check if Chrome window with Claude or ChatGPT
    if (InStr(title, "Chrome") || InStr(title, "Google Chrome")) && (InStr(title, "Claude") || InStr(title, "ChatGPT"))
    {
        Send, {Enter}
        return
    }
    
    ; Otherwise pass through normally
    Send, {Shift down}{Enter}{Shift up}
    return
}

; Enter key
Enter::
{
    WinGetTitle, title, A
    
    ; Check if Chrome window with Claude or ChatGPT
    if (InStr(title, "Chrome") || InStr(title, "Google Chrome")) && (InStr(title, "Claude") || InStr(title, "ChatGPT"))
    {
        Send, {Shift down}{Enter}{Shift up}
        return
    }
    
    ; Otherwise pass through normally
    Send, {Enter}
    return
}