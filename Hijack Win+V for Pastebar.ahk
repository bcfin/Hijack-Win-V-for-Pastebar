#Requires AutoHotkey v2.0
#SingleInstance Force

; Performance Optimization
ListLines 0
KeyHistory 0

; Admin Privileges Check
if !A_IsAdmin {
    Run "*RunAs " A_ScriptFullPath
    ExitApp
}

; Configuration
TargetShortcut := "^+Q"  ; Ctrl+Shift+Q (customize as needed)

; Robust Hotkey Implementation
$#v::
{
    ; Step 1: Ghost Suppression - Prevent Start Menu popup
    Send "{vkE8}"
    
    ; Step 2: Physical State Synchronization - Wait for actual Win key release
    KeyWait "LWin"
    KeyWait "RWin"
    
    ; Step 3: Payload Delivery - Send the target shortcut
    SendInput TargetShortcut
}
