#NoEnv  

global AMAZING_PATH := ""
global AMAZING_SERVER := ""
global SEARCH_QUESTIONS := 0
global SEARCH_REPORT := 0
global SEARCH_CAPS := 0
global SEARCH_KILL := 0
global SEARCH_NRPNICK := 0
global SEARCH_AC := 0
global MAX_SP := 950
global AUTO_SPEC := ""
global AUTO_REPORT := ""


global ENABLE_INTERFACE := 0
global POSITION_INTERFACE := 0

global WIDGET_REPORT := 0
global WIDGET_QUESTIONS := 0
global WIDGET_INFO_REPORT := 0
global WIDGET_REPORT_COUNT := 0

global MAIN_COLOR := ""
global SECOND_COLOR := ""
global BACKGROUND_COLOR := ""


global KILL_NOTIFY := ""
global CAPSLOCK_NOTIFY := ""
global NRPNICK_NOTIFY := ""
global TIPOFF_NOTIFY := ""
global AC_NOTIFY := "" 
global FIRSTANSWER_NOTIFY := ""
global MIN5_ON_OFF := 0
global AC_KILL_IN_CHAT := 0


global NEW_REPORT_NOTIFY := "", global NEW_REPORT_SOUND := ""
global NEW_QUESTION_NOTIFY := "", global NEW_QUESTION_SOUND := ""
global NEW_CAPSLOCK_NOTIFY := "", global NEW_CAPSLOCK_SOUND := ""
global NEW_KILL_NOTIFY := "", global NEW_KILL_SOUND := ""
global NEW_NRPNICK_NOTIFY := "", global NEW_NRPNICK_SOUND := ""
global NEW_TIPOFF_NOTIFY := "", global NEW_TIPOFF_SOUND := ""
global AC_SOUND := "", global NEW_AC_NOTIFY := ""


global REPORT_WORKING := ""
global REPORT_NICEGAME := ""
global REPORT_NOVIOLAT := ""
global REPORT_PUNISHED := ""
global PREV_REPORT := ""
global REPORT_ANSID := ""
global REPORT_ANSID_PREV := ""

global TOOLS_KILL := ""
global TOOLS_CAPS := ""
global TOOLS_NICK := ""
global TOOLS_TIPOFF := ""
global TOOLS_AC := ""
global TOOLS_GETPCAR := ""
global TOOLS_SLAP := ""
global TOOLS_FLIP := ""
global TOOLS_GRUZ := ""
global TOOLS_GO_TO_SPEC := ""
global TOOLS_RSP := ""

global overlay_gen := Array()

class Config
{

    static configFile := A_ScriptDir "\data\config.ini"

    CheckConfigFile() {

        IfNotExist, %A_ScriptDir%\data\config.ini
        {
            IniWrite, C:\Amazing Games\Amazing Online, %A_ScriptDir%\data\config.ini, GENERAL, AMAZING_PATH
            IniWrite, 0, %A_ScriptDir%\data\config.ini, GENERAL, AMAZING_SERVER
            IniWrite, 1, %A_ScriptDir%\data\config.ini, GENERAL, AC_KILL_IN_CHAT
            IniWrite, 1, %A_ScriptDir%\data\config.ini, GENERAL, NOTIFY_TIME_REPORT

            IniWrite, 0, %A_ScriptDir%\data\config.ini, GENERAL, AUTO_SPEC
            IniWrite, 0, %A_ScriptDir%\data\config.ini, GENERAL, AUTO_REPORT
            IniWrite, 960, %A_ScriptDir%\data\config.ini, GENERAL, MAX_SP
            IniWrite, 1, %A_ScriptDir%\data\config.ini, GENERAL, SEARCH_REPORT
            IniWrite, 1, %A_ScriptDir%\data\config.ini, GENERAL, SEARCH_QUESTIONS
            IniWrite, 1, %A_ScriptDir%\data\config.ini, GENERAL, SEARCH_CAPS
            IniWrite, 1, %A_ScriptDir%\data\config.ini, GENERAL, SEARCH_KILL
            IniWrite, 1, %A_ScriptDir%\data\config.ini, GENERAL, SEARCH_NRPNICK
            IniWrite, 1, %A_ScriptDir%\data\config.ini, GENERAL, SEARCH_AC

            IniWrite, 1, %A_ScriptDir%\data\config.ini, INTEFRACE, ENABLE_INTERFACE
            IniWrite, 1, %A_ScriptDir%\data\config.ini, INTEFRACE, POSITION_INTERFACE
            IniWrite, 1, %A_ScriptDir%\data\config.ini, INTEFRACE, WIDGET_REPORT
            IniWrite, 1, %A_ScriptDir%\data\config.ini, INTEFRACE, WIDGET_QUESTIONS
            IniWrite, 1, %A_ScriptDir%\data\config.ini, INTEFRACE, WIDGET_INFO_REPORT
            IniWrite, 0, %A_ScriptDir%\data\config.ini, INTEFRACE, WIDGET_REPORT_COUNT
            IniWrite, 0xFFFFFFFF, %A_ScriptDir%\data\config.ini, INTEFRACE, MAIN_COLOR
            IniWrite, FFAF00, %A_ScriptDir%\data\config.ini, INTEFRACE, SECOND_COLOR
            IniWrite, 0x99000000, %A_ScriptDir%\data\config.ini, INTEFRACE, BACKGROUND_COLOR


            IniWrite, 1, %A_ScriptDir%\data\config.ini, SOUND, NEW_REPORT_NOTIFY
            IniWrite, 1, %A_ScriptDir%\data\config.ini, SOUND, NEW_REPORT_SOUND
            IniWrite, 0, %A_ScriptDir%\data\config.ini, SOUND, NEW_QUESTION_NOTIFY
            IniWrite, 1, %A_ScriptDir%\data\config.ini, SOUND, NEW_QUESTION_SOUND
            IniWrite, 0, %A_ScriptDir%\data\config.ini, SOUND, NEW_CAPSLOCK_NOTIFY
            IniWrite, 1, %A_ScriptDir%\data\config.ini, SOUND, NEW_CAPSLOCK_SOUND
            IniWrite, 0, %A_ScriptDir%\data\config.ini, SOUND, NEW_KILL_NOTIFY
            IniWrite, 1, %A_ScriptDir%\data\config.ini, SOUND, NEW_KILL_SOUND
            IniWrite, 0, %A_ScriptDir%\data\config.ini, SOUND, NEW_NRPNICK_NOTIFY
            IniWrite, 0, %A_ScriptDir%\data\config.ini, SOUND, NEW_AC_NOTIFY
            IniWrite, 0, %A_ScriptDir%\data\config.ini, SOUND, NEW_AC_SOUND
            IniWrite, 1, %A_ScriptDir%\data\config.ini, SOUND, NEW_NRPNICK_SOUND
            IniWrite, 0, %A_ScriptDir%\data\config.ini, SOUND, NEW_TIPOFF_NOTIFY
            IniWrite, 1, %A_ScriptDir%\data\config.ini, SOUND, NEW_TIPOFF_SOUND
            

            IniWrite, 1, %A_ScriptDir%\data\config.ini, NOTIFY, KILL_NOTIFY
            IniWrite, 1, %A_ScriptDir%\data\config.ini, NOTIFY, AC_NOTIFY
            IniWrite, 1, %A_ScriptDir%\data\config.ini, NOTIFY, CAPSLOCK_NOTIFY
            IniWrite, 1, %A_ScriptDir%\data\config.ini, NOTIFY, NRPNICK_NOTIFY
            IniWrite, 1, %A_ScriptDir%\data\config.ini, NOTIFY, TIPOFF_NOTIFY
            IniWrite, 0, %A_ScriptDir%\data\config.ini, NOTIFY, FIRSTANSWER_NOTIFY
            IniWrite, 1, %A_ScriptDir%\data\config.ini, NOTIFY, MIN5_ON_OFF
            IniWrite, 1, %A_ScriptDir%\data\config.ini, NOTIFY, AC_KILL_IN_CHAT
            

            IniWrite, NumPad5, %A_ScriptDir%\data\config.ini, HOTKEYS, REPORT_WORKING
            IniWrite, NumPad2, %A_ScriptDir%\data\config.ini, HOTKEYS, REPORT_NICEGAME
            IniWrite, NumPad6, %A_ScriptDir%\data\config.ini, HOTKEYS, REPORT_NOVIOLAT
            IniWrite, NumPad4, %A_ScriptDir%\data\config.ini, HOTKEYS, REPORT_PUNISHED
            IniWrite, NumPad7, %A_ScriptDir%\data\config.ini, HOTKEYS, PREV_REPORT
            IniWrite, NumPad8, %A_ScriptDir%\data\config.ini, HOTKEYS, REPORT_ANSID
            IniWrite, NumPad9, %A_ScriptDir%\data\config.ini, HOTKEYS, REPORT_ANSID_PREV

            IniWrite, !1, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_KILL
            IniWrite, !2, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_CAPS
            IniWrite, !3, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_NICK
            IniWrite, !4, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_AC
            IniWrite, !5, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_GETPCAR
            IniWrite, !6, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_FLIP
            IniWrite, !7, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_SLAP
            IniWrite, !8, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_GRUZ
            IniWrite, !9, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_GO_TO_SPEC
            IniWrite, !0, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_RSP
            IniWrite, F11, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_TIPOFF


        }

    }

    ReadConfig() {

        IniRead, AMAZING_PATH, %A_ScriptDir%\data\config.ini, GENERAL, AMAZING_PATH, %A_Space%
        IniRead, AMAZING_SERVER, %A_ScriptDir%\data\config.ini, GENERAL, AMAZING_SERVER, 0
        IniRead, AUTO_SPEC, %A_ScriptDir%\data\config.ini, GENERAL, AUTO_SPEC, 0
        IniRead, AUTO_REPORT, %A_ScriptDir%\data\config.ini, GENERAL, AUTO_REPORT, 0
        IniRead, MAX_SP, %A_ScriptDir%\data\config.ini, GENERAL, MAX_SP, 182
        IniRead, SEARCH_REPORT, %A_ScriptDir%\data\config.ini, GENERAL, SEARCH_REPORT, 1
        IniRead, SEARCH_QUESTIONS, %A_ScriptDir%\data\config.ini, GENERAL, SEARCH_QUESTIONS, 1
        IniRead, SEARCH_CAPS, %A_ScriptDir%\data\config.ini, GENERAL, SEARCH_CAPS, 1
        IniRead, SEARCH_KILL, %A_ScriptDir%\data\config.ini, GENERAL, SEARCH_KILL, 1
        IniRead, SEARCH_NRPNICK, %A_ScriptDir%\data\config.ini, GENERAL, SEARCH_NRPNICK, 1
        IniRead, SEARCH_AC, %A_ScriptDir%\data\config.ini, GENERAL, SEARCH_AC, 1

        IniRead, ENABLE_INTERFACE, %A_ScriptDir%\data\config.ini, INTEFRACE, ENABLE_INTERFACE, 1
        IniRead, POSITION_INTERFACE, %A_ScriptDir%\data\config.ini, INTEFRACE, POSITION_INTERFACE, 1
        IniRead, WIDGET_REPORT, %A_ScriptDir%\data\config.ini, INTEFRACE, WIDGET_REPORT, 1
        IniRead, WIDGET_QUESTIONS, %A_ScriptDir%\data\config.ini, INTEFRACE, WIDGET_QUESTIONS, 1
        IniRead, WIDGET_INFO_REPORT, %A_ScriptDir%\data\config.ini, INTEFRACE, WIDGET_INFO_REPORT, 1
        IniRead, WIDGET_REPORT_COUNT, %A_ScriptDir%\data\config.ini, INTEFRACE, WIDGET_REPORT_COUNT, 1
        IniRead, MAIN_COLOR, %A_ScriptDir%\data\config.ini, INTEFRACE, MAIN_COLOR, 0xFFFFFFFF
        IniRead, SECOND_COLOR, %A_ScriptDir%\data\config.ini, INTEFRACE, SECOND_COLOR, FFAF00
        IniRead, BACKGROUND_COLOR, %A_ScriptDir%\data\config.ini, INTEFRACE, BACKGROUND_COLOR, 0x99000000

        IniRead, NEW_REPORT_NOTIFY, %A_ScriptDir%\data\config.ini, SOUND, NEW_REPORT_NOTIFY, 1
        IniRead, NEW_REPORT_SOUND, %A_ScriptDir%\data\config.ini, SOUND, NEW_REPORT_SOUND, 12
        IniRead, NEW_QUESTION_NOTIFY, %A_ScriptDir%\data\config.ini, SOUND, NEW_QUESTION_NOTIFY, 0
        IniRead, NEW_QUESTION_SOUND, %A_ScriptDir%\data\config.ini, SOUND, NEW_QUESTION_SOUND, 12
        IniRead, NEW_CAPSLOCK_NOTIFY, %A_ScriptDir%\data\config.ini, SOUND, NEW_CAPSLOCK_NOTIFY, 0
        IniRead, NEW_CAPSLOCK_SOUND, %A_ScriptDir%\data\config.ini, SOUND, NEW_CAPSLOCK_SOUND, 13
        IniRead, NEW_KILL_NOTIFY, %A_ScriptDir%\data\config.ini, SOUND, NEW_KILL_NOTIFY, 0
        IniRead, NEW_KILL_SOUND, %A_ScriptDir%\data\config.ini, SOUND, NEW_KILL_SOUND, 13
        IniRead, NEW_AC_NOTIFY, %A_ScriptDir%\data\config.ini, SOUND, NEW_AC_NOTIFY, 0
        IniRead, AC_SOUND, %A_ScriptDir%\data\config.ini, SOUND, NEW_AC_SOUND, 13
        IniRead, NEW_NRPNICK_NOTIFY, %A_ScriptDir%\data\config.ini, SOUND, NEW_NRPNICK_NOTIFY, 1
        IniRead, NEW_NRPNICK_SOUND, %A_ScriptDir%\data\config.ini, SOUND, NEW_NRPNICK_SOUND, 13
        IniRead, NEW_TIPOFF_NOTIFY, %A_ScriptDir%\data\config.ini, SOUND, NEW_TIPOFF_NOTIFY, 1
        IniRead, NEW_TIPOFF_SOUND, %A_ScriptDir%\data\config.ini, SOUND, NEW_TIPOFF_SOUND, 13
        
        IniRead, KILL_NOTIFY, %A_ScriptDir%\data\config.ini, NOTIFY, KILL_NOTIFY, 1
        IniRead, CAPSLOCK_NOTIFY, %A_ScriptDir%\data\config.ini, NOTIFY, CAPSLOCK_NOTIFY, 1
        IniRead, NRPNICK_NOTIFY, %A_ScriptDir%\data\config.ini, NOTIFY, NRPNICK_NOTIFY, 1
        IniRead, AC_NOTIFY, %A_ScriptDir%\data\config.ini, NOTIFY, AC_NOTIFY, 1
        IniRead, TIPOFF_NOTIFY, %A_ScriptDir%\data\config.ini, NOTIFY, TIPOFF_NOTIFY, 1
        IniRead, FIRSTANSWER_NOTIFY, %A_ScriptDir%\data\config.ini, NOTIFY, FIRSTANSWER_NOTIFY, 0
        IniRead, MIN5_ON_OFF, %A_ScriptDir%\data\config.ini, NOTIFY, MIN5_ON_OFF, 1
        IniRead, AC_KILL_IN_CHAT, %A_ScriptDir%\data\config.ini, NOTIFY, AC_KILL_IN_CHAT, 1
        
        IniRead, REPORT_WORKING, %A_ScriptDir%\data\config.ini, HOTKEYS, REPORT_WORKING, %A_Space%
        IniRead, REPORT_NICEGAME, %A_ScriptDir%\data\config.ini, HOTKEYS, REPORT_NICEGAME, %A_Space%
        IniRead, REPORT_NOVIOLAT, %A_ScriptDir%\data\config.ini, HOTKEYS, REPORT_NOVIOLAT, %A_Space%
        IniRead, REPORT_PUNISHED, %A_ScriptDir%\data\config.ini, HOTKEYS, REPORT_PUNISHED, %A_Space%
        IniRead, PREV_REPORT, %A_ScriptDir%\data\config.ini, HOTKEYS, PREV_REPORT, %A_Space%
        IniRead, REPORT_ANSID, %A_ScriptDir%\data\config.ini, HOTKEYS, REPORT_ANSID, %A_Space%
        IniRead, REPORT_ANSID_PREV, %A_ScriptDir%\data\config.ini, HOTKEYS, REPORT_ANSID_PREV, %A_Space%
        IniRead, TOOLS_KILL, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_KILL, %A_Space%
        IniRead, TOOLS_CAPS, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_CAPS, %A_Space%
        IniRead, TOOLS_NICK, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_NICK, %A_Space%
        IniRead, TOOLS_AC, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_AC, %A_Space%
        IniRead, TOOLS_TIPOFF, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_TIPOFF, %A_Space%
        IniRead, TOOLS_GETPCAR, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_GETPCAR, %A_Space%
        IniRead, TOOLS_FLIP, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_FLIP, %A_Space%
        IniRead, TOOLS_GRUZ, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_GRUZ, %A_Space%
        IniRead, TOOLS_SLAP, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_SLAP, %A_Space%
        IniRead, TOOLS_GO_TO_SPEC, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_GO_TO_SPEC, %A_Space%
        IniRead, TOOLS_RSP, %A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_RSP, %A_Space%

        overlay_gen.visible :=      ENABLE_INTERFACE == 0 ? false : true
        overlay_gen.position :=     POSITION_INTERFACE

        overlay_gen.main_color := MAIN_COLOR
        overlay_gen.add_color := SECOND_COLOR
        overlay_gen.back_color := BACKGROUND_COLOR

        overlay_gen.questions :=    WIDGET_QUESTIONS == 0 ? false : true
        overlay_gen.report :=       WIDGET_REPORT == 0 ? false : true
        overlay_gen.rep_state :=    WIDGET_INFO_REPORT == 0 ? false : true
        overlay_gen.txt_report_count := WIDGET_REPORT_COUNT == 0 ? false : true

    }

}