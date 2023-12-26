#NoEnv

class KeyHot {

    Activate() {

        
        If (ACCESS_LEVEL > 1)
        {
            Hotkey, IfWinActive, %GAME_PID%

            if (REPORT_WORKING != "")
                Hotkey, %REPORT_WORKING%, REP_WORK, T1 UseErrorLevel

            if (REPORT_NICEGAME != "")
                Hotkey, %REPORT_NICEGAME%, REP_NG, T1 UseErrorLevel

            if (REPORT_NOVIOLAT != "")
                Hotkey, %REPORT_NOVIOLAT%, REP_NVIOL, T1 UseErrorLevel
            
            if (REPORT_PUNISHED != "")
                Hotkey, %REPORT_PUNISHED%, REP_PUNISH, T1 UseErrorLevel
            
            if (PREV_REPORT != "")
                Hotkey, %PREV_REPORT%, REP_PREV, T1 UseErrorLevel
            
            if (REPORT_ANSID != "")
                Hotkey, %REPORT_ANSID%, REP_ANID, T1 UseErrorLevel
            
            if (REPORT_ANSID_PREV != "")
                Hotkey, %REPORT_ANSID_PREV%, REP_ANSID_PR, T1 UseErrorLevel
            
            if (TOOLS_KILL != "")
                Hotkey, %TOOLS_KILL%, TL_KILL, T1 UseErrorLevel
            
            if (TOOLS_CAPS != "")
                Hotkey, %TOOLS_CAPS%, TL_CAPS, T1 UseErrorLevel
            
            if (TOOLS_NICK != "")
                Hotkey, %TOOLS_NICK%, TL_NICK, T1 UseErrorLevel
            
            if (TOOLS_TIPOFF != "")
                Hotkey, %TOOLS_TIPOFF%, TL_TIPOFF, T1 UseErrorLevel

            if (TOOLS_AC != "")
                Hotkey, %TOOLS_AC%, TL_AC, T1 UseErrorLevel
            
            if (TOOLS_GETPCAR != "")
                Hotkey, %TOOLS_GETPCAR%, TL_GETPCAR, T1 UseErrorLevel

            if (TOOLS_FLIP != "")
                Hotkey, %TOOLS_FLIP%, TL_FLIP, T1 UseErrorLevel

            if (TOOLS_SLAP != "")
                Hotkey, %TOOLS_SLAP%, TL_SLAP, T1 UseErrorLevel

            if (TOOLS_GRUZ != "")
                Hotkey, %TOOLS_GRUZ%, TL_GRUZ, T1 UseErrorLevel

            if (TOOLS_GO_TO_SPEC != "")
                Hotkey, %TOOLS_GO_TO_SPEC%, TL_GO_TO_SPEC, T1 UseErrorLevel

            if (TOOLS_RSP != "")
                Hotkey, %TOOLS_RSP%, TL_RSP, T1 UseErrorLevel

        }

        If ErrorLevel in 1,2,3,4,5
        {
            MsgBox, 4112, Themis - Ошибка, Произошла ошибка в инициализации горячих клавиш!`nНеобходимо настроить горячие клавиши повторно.
        }

    }

}
