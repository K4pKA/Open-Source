#SingleInstance Force
#NoEnv
ListLines Off
SetBatchLines -1
SetKeyDelay -1
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
Process, Priority, , R
SetWinDelay, -1
SetControlDelay, -1

If (A_PtrSize != 4) {
    SplitPath A_AhkPath,, AhkDir
    MsgBox, 16, Themis - Ошибка, Запуск возможен только с помощью AutoHotKey ANSI 32-bit
    ExitApp
}

Menu Tray, Icon, %A_ScriptDir%\data\img\icon.ico
Menu, Tray, NoStandard
Menu, Tray, Tip, Themis - Помощник администратора
Menu, Tray, Add, Количество репорта, REPORT_SHOW_COUNT
Menu, Tray, Add, Установить количество отвеченных репортов, CHANGE_REPORT
Menu, Tray, Add, Монитор неотвеченных запросов, UNANSWERED_REPORT_MONITOR
Menu, Tray, Add
Menu, Tray, Add, Изменить ответы, CHANGE_ANS_FILES
Menu, Tray, Add
Menu, Tray, Add, Сбросить настройки, LABEL_DELETE_CONFIG
Menu, Tray, Add, Автор скрипта, LABEL_GET_AUTHOR
Menu, Tray, Add, Настройки, SHOW_SETTINGS
Menu, tray, add
Menu, Tray, Add, Перезагрузка, LABEL_RELOAD_AHK
Menu, Tray, Add, Закрыть, LABEL_EXIT


#Include, %A_ScriptDir%/lib/Config.ahk
#Include, %A_ScriptDir%/lib/Overlay.ahk
#include, %A_ScriptDir%/lib/UDF.ahk

global GAME_PID := "AMAZING ONLINE"

global FIRST_ACTIVE := -1
global GAME_IS_ACTIVE := 0

global CpMnType := ""
global CpMnTime := ""
global CpMnNickname := ""
global CpMnNumber := ""
global CpMnReason := ""

global REPORT_TICK := A_TickCount
global LAST_REPORT_TICK := A_TickCount

global LAST_REPORT_ID := ""
global PREV_REPORT_ID := ""

global REPORT_MAIN_ARRAY := []
global QUESTION_MAIN_ARRAY := []

global CHAT_ACTIVE := -1
global WSChat := -1

Config.CheckConfigFile()
Config.ReadConfig()

#Include, %A_ScriptDir%/lib/Loader.ahk

loader := new Loader()

global ACCESS_LEVEL := 0

global CRMP_USER_NICKNAME := ""
RegRead, CRMP_USER_NICKNAME, HKEY_CURRENT_USER, SOFTWARE\Amazing\Russia\Nicknames, %AMAZING_SERVER%
global CHATLOG_PATH := "" . AMAZING_PATH . "\amazing\chatlog.txt"
global CHATLOGS_PATH := A_MyDocuments "\Themis\chatlogs"
global THEMIS_PATH := A_ScriptDir

global REPORT_WORK := []
global REPORT_NICE := []
global REPORT_PUNISH := []
global REPORT_NO_VIOLATIONS := []
global PLUS_REP := []

global CRMP_LAST_TIP_OFF := []

readAnsFiles()
checkTodayReport()
global LastLine := ""

#Include, %A_ScriptDir%/lib/Settings.ahk
#Include, %A_ScriptDir%/lib/Hotkeys.ahk
#Include, %A_ScriptDir%/lib/Unanswered.ahk

global Overlay := new Overlay(overlay_gen)

KeyHot.Activate()

Gosub, GAME_FIRST_ACTIVE
global REPORT_COUNT := % getReportCount()
Goto, REPORT_LOOP
Return

GAME_FIRST_ACTIVE:
    If (GAME_IS_ACTIVE == 0)
    {   
        Loop
        {
            checkHandles()
            Sleep, 500

            Money := % getPlayerMoney()

            If (Money > 0)
            {
                loadInGame()
                Overlay.create()
                REPORT_COUNT := getReportCount()
                Overlay.setRepCount(REPORT_COUNT)

                GAME_IS_ACTIVE := 1
                FIRST_ACTIVE := 1
                SetTimer, GAME_ACTIVE, 1000
                Break
            }
            Sleep 500
        }
    }
Return

GAME_ACTIVE:
    If (FIRST_ACTIVE == 1)
    {
        If (GAME_IS_ACTIVE == 0)
            {
                Loop
                {
                    checkHandles()
                    Sleep, 50
                    Money := % getPlayerMoney()
        
                    If (Money > 0)
                    {
                        reloadInGame()
                        Overlay.create()

                        REPORT_COUNT := getReportCount()
                        Overlay.setRepCount(REPORT_COUNT)
                        GAME_IS_ACTIVE := 1
                        Break
                    }
                    Sleep 500
                }
            }
        If (GAME_IS_ACTIVE == 1)
            {
                IfWinNotExist, %GAME_PID%
                {

                    GAME_IS_ACTIVE := 0
                    overlay.destroy()                
                }
            }
    }
Return

REPORT_LOOP:
    Loop
    {
        If (GAME_IS_ACTIVE == 1)
        {
            FileEncoding
            ll := GetNewLine(CHATLOG_PATH)
            


            if (SEARCH_QUESTIONS == 1) {

                if (RegExMatch(ll, "\[(A|Новичок|YOUTUBE)\] ({66CC00}|)(Вопрос) от (.*) \[(.*)\]: ({FFA722})?(.*)", idPl)) 
                    {
                            QUESTION_PLAYERID := idPl5
                            QUESTION_CONTENT := SubStr(idPl7, 9)
                            QUESTION_PLAYER_NICKNAME := idPl4
                            QUESTION_MAIN_ARRAY[QUESTION_PLAYERID] := [false, QUESTION_PLAYERID, QUESTION_PLAYER_NICKNAME, QUESTION_CONTENT]
        
                            UpdateUnansweredReportMonitor(REPORT_MAIN_ARRAY, QUESTION_MAIN_ARRAY)
                            
                            If (NEW_QUESTION_NOTIFY == 1)
                                {
                                    Sound := NEW_QUESTION_SOUND . ".wav"
                                    SoundPlay, %THEMIS_PATH%\data\sounds\%Sound%
                                }

                            Overlay.updateQuestions(QUESTION_MAIN_ARRAY)

                }

            }

            if (RegExMatch(ll, "(.*?) ?(Администратор|Агент поддержки) (.*) \[(.*)\] для (.*) \[(.*)\]:(.*)", ANSWER_EVENT)) {
                    
                REPORT_RESPONDENT := ANSWER_EVENT3
                REPORT_FOR_PLAYERID := ANSWER_EVENT6
                REPORT_FOR_NICKNAME := ANSWER_EVENT5
                
                if (REPORT_RESPONDENT == CRMP_USER_NICKNAME and (REPORT_MAIN_ARRAY[REPORT_FOR_PLAYERID, 3] == REPORT_FOR_NICKNAME or QUESTION_MAIN_ARRAY[REPORT_FOR_PLAYERID, 3] == REPORT_FOR_NICKNAME))  
                {


                    REPORT_COUNT := getReportCount()
                    REPORT_COUNT += 1
                    
                    if (AUTO_SPEC == 1)
                        SendChat("/sp " . REPORT_FOR_PLAYERID)

                    writeReportCount(REPORT_COUNT)

                    random, RANDOM_ID, 1, PLUS_REP.MaxIndex()
                    REP_PLUS := % PLUS_REP[RANDOM_ID]
                    
                    Overlay.setRepCount(REPORT_COUNT)

                    type_action := REPORT_MAIN_ARRAY[REPORT_FOR_PLAYERID, 3] == REPORT_FOR_NICKNAME ? 2 : 1

                    if (REPORT_MAIN_ARRAY[REPORT_FOR_PLAYERID, 3] == REPORT_FOR_NICKNAME) {
                        Overlay.setRepID(REPORT_FOR_PLAYERID)
                        Overlay.setRepContent(REPORT_MAIN_ARRAY[REPORT_FOR_PLAYERID, 4])
                    }

                    addOneTodayAnsweredReport()

                    If (FIRSTANSWER_NOTIFY == 1)
                        addChatMessageEx(0x4169E1, "{4169E1}[&#9878; Themis] {F0FFFF}" . REP_PLUS)
                }

                if (REPORT_MAIN_ARRAY[REPORT_FOR_PLAYERID, 1] == false)
                {
                    delOneTodayMissedReport()
                    REPORT_MAIN_ARRAY.Delete(REPORT_FOR_PLAYERID)
                }

                Overlay.updateReport(REPORT_MAIN_ARRAY)

                if (QUESTION_MAIN_ARRAY[REPORT_FOR_PLAYERID, 1] == false)
                    QUESTION_MAIN_ARRAY.Delete(REPORT_FOR_PLAYERID)
                
                Overlay.updateQuestions(QUESTION_MAIN_ARRAY)
                UpdateUnansweredReportMonitor(REPORT_MAIN_ARRAY, QUESTION_MAIN_ARRAY)
                
            }
            
            if (RegExMatch(ll, "Вы начали следить за (.*) \[(.*)\]", lastSpec)) {

                LAST_SPEC_ID := lastSpec2

            } 

            If (ACCESS_LEVEL > 1) {


            if (SEARCH_REPORT == 1) {

                if (RegExMatch(ll, "\[(A|Новичок|YOUTUBE)\] ({66CC00}|)(Жалоба) от (.*) \[(.*)\]: ({FFA722})?(.*)", idPl)) 
                {
                    report_time := getTimeFormat()
                    REPORT_TICK := A_TickCount
                    REPORT_PLAYERID := idPl5
                    REPORT_CONTENT := SubStr(idPl7, 9)
                    REPORT_PLAYER_NICKNAME := idPl4
                    REPORT_MAIN_ARRAY[REPORT_PLAYERID] := [false, REPORT_PLAYERID, REPORT_PLAYER_NICKNAME, REPORT_CONTENT, report_time]

                    UpdateUnansweredReportMonitor(REPORT_MAIN_ARRAY, QUESTION_MAIN_ARRAY)
                    
                    If LAST_REPORT_ID
                        PREV_REPORT_ID := LAST_REPORT_ID

                    elapsed_tick := A_TickCount - LAST_REPORT_TICK

                    If (elapsed_tick > 300000)
                    {
                        EnvDiv, elapsed_tick, 1000
                        If (MIN5_ON_OFF == 1)
                            addChatMessageEx(0x4169E1, "{4169E1}[&#9878; Themis] {F0FFFF}Вы не отвечали на репорт {800000} " . elapsed_tick . "{F0FFFF} секунд!")
                    }


                    LAST_REPORT_ID := idPl5

                    If (NEW_REPORT_NOTIFY == 1)
                    {
                        Sound := NEW_REPORT_SOUND . ".wav"
                        SoundPlay, %THEMIS_PATH%\data\sounds\%Sound%
                    }

                    Overlay.updateReport(REPORT_MAIN_ARRAY)
                    addOneTodayMissedReport()

                }

            }

            if (SEARCH_NRPNICK == 1) {

                if (RegExMatch(ll, "\[(A)\] (.*) \[(.*)\] {FFFFFF}только что зарегистрировался", CRMP_REGISTATION_EVENT)) 
                {
                    CRMP_NICKNAME := CRMP_REGISTATION_EVENT2
                    if !(CRMP_NICKNAME ~= "[A-Z][a-z]+_[A-Z][a-z]+$")
                    {
                        CRMP_LAST_NONRP_NICK_ID := CRMP_REGISTATION_EVENT3
                        If (NRPNICK_NOTIFY == 1)
                            addChatMessageEx(0x4169E1, "{4169E1}[&#9878; Themis] {F0FFFF}Нажмите{ffa500} " . formatHotKey(TOOLS_NICK) . "{F0FFFF} Что бы предупредить игрока " . CRMP_REGISTATION_EVENT2 . " о NonRP никнейме")
                        If (NEW_NRPNICK_NOTIFY == 1)
                            {
                                Sound := NEW_NRPNICK_SOUND . ".wav"
                                SoundPlay, %THEMIS_PATH%\data\sounds\%Sound%
                            }
                    }

                }
            
            }

            if (SEARCH_CAPS == 1) {
            
                if (RegExMatch(ll, "\[A\] \((IC|OOC|F)\) <Капс> (.*) \[(.*)\]:(.*)", CRMP_CAPS_EVENT)) 
                {
                    CRMP_LAST_CAPSLOCK_ID := CRMP_CAPS_EVENT3
                    If (CAPSLOCK_NOTIFY == 1)
                        addChatMessageEx(0x4169E1, "{4169E1}[&#9878; Themis] {F0FFFF}Нажмите{ffa500} " . formatHotKey(TOOLS_CAPS) . "{F0FFFF} чтобы предупредить игрока за CAPS LOCK")
                    If (NEW_NRPNICK_NOTIFY == 1)
                        {
                            Sound := NEW_CAPSLOCK_SOUND . ".wav"
                            SoundPlay, %THEMIS_PATH%\data\sounds\%Sound%
                        }
                }

            }


            if (SEARCH_KILL == 1) {
                if (RegExMatch(ll, "\[K\] (.*) \[(.*)\] убил игрока (.*) \[(.*)\] \((.*)\)", CRMP_KILL_EVENT)) 
                {
                    CRMP_LAST_DEATH_ID := CRMP_KILL_EVENT2
                    If (KILL_NOTIFY == 1)
                        addChatMessageEx(0x4169E1, "{4169E1}[&#9878; Themis] {F0FFFF}Нажмите{ffa500} " . formatHotKey(TOOLS_KILL) . "{F0FFFF} чтобы перейти в спек за последним убийством")
                    If (NEW_KILL_NOTIFY == 1)
                        {
                            Sound := NEW_KILL_SOUND . ".wav"
                            SoundPlay, %THEMIS_PATH%\data\sounds\%Sound%
                        }
                }
            }

            if (SEARCH_KILL == 1) {
                if (RegExMatch(ll, "\[K\] (.*) \[(.*)\] только что убил новичка (.*) \[(.*)\] \((.*)\)", CRMP_NOVICE_KILL_EVENT)) 
                {

                    CRMP_LAST_DEATH_ID := CRMP_NOVICE_KILL_EVENT2
                    If (KILL_NOTIFY == 1)
                        addChatMessageEx(0x4169E1, "{4169E1}[&#9878; Themis] {F0FFFF}Нажмите{ffa500} " . formatHotKey(TOOLS_KILL) . "{F0FFFF} чтобы перейти в спек за убийством {800000}новичка")
                    If (NEW_KILL_NOTIFY == 1)
                        {
                            Sound := NEW_KILL_SOUND . ".wav"
                            SoundPlay, %THEMIS_PATH%\data\sounds\%Sound%
                        }
                }
            }


                if (RegExMatch(ll, "\[(A|H)\] (.*) \[(.*)\]:\s(.*)", CRMP_TIP_OFF_PUNISH))
                {

                    StringSplit, lines, CRMP_TIP_OFF_PUNISH4, %A_Space%
                    
                    if lines1 in /wa,/kick,/skick,/jail,/offjail,/mute,/offmute,/vmute,/offvmute,/warn,/offwarn,/ban,/offban,/unmute,/offunmute,/vunmute,/offvunmute,/unwarn,/offunwarn,/afree,/slap,/move,/setvw,/rscar,/dm,/nrp,/nonrp,/dmzz,/caps,/drive,/nick,/bh,/offtop,/setcarvw,/rmute,/offrmnute,/afree,/offafree,/offclear,/clear,/offrunmute,/runmute,/spa,/fspa
                    {
                        
                        StringSplit, nick_ad, CRMP_TIP_OFF_PUNISH2, "_"
                        initials := SubStr(nick_ad1, 1, 1) . "." . nick_ad2

                        CRMP_LAST_TIP_OFF := [lines1, CRMP_TIP_OFF_PUNISH4, initials]

                        If (TIPOFF_NOTIFY == 1)
                            addChatMessageEx(0x4169E1, "{4169E1}[&#9878; Themis] {F0FFFF}Нажмите {ffa500}" . formatHotKey(TOOLS_TIPOFF) . "{F0FFFF} для получения наводки")
                        If (NEW_TIPOFF_NOTIFY == 1)
                            {
                                Sound := NEW_TIPOFF_SOUND . ".wav"
                                SoundPlay, %THEMIS_PATH%\data\sounds\%Sound%
                            }
                    }

                }
                
                if (SEARCH_AC == 1) {
                if (RegExMatch(ll, "«AC» (.*) \[(.*)\] возможно {FFFFFF}(.*) {F2994A}(.*) {99CC00}\(Ping: (.*)\)", AC_EVENT))
                {   
                    IF (AC_NOTIFY == 1)
                        addChatMessageEx(0x4169E1, "{4169E1}[&#9878; Themis] {F0FFFF}Нажмите {ffa500}" . formatHotKey(TOOLS_AC) . "{F0FFFF} чтобы перейти в спек за " . AC_EVENT1 . " [" . AC_EVENT2 . "]")
                    If (NEW_AC_NOTIFY == 1)
                        {
                            Sound := AC_SOUND . ".wav"
                            SoundPlay, %THEMIS_PATH%\data\sounds\%Sound%
                        }
                    CRMP_ANTICHEAT_LAST_ID := AC_EVENT2
                }
            }

            }

        }
    }
Return

REP_WORK:
    SendMessage, 0x50,, 0x4190419,, A
    random, RANDOM_ID, 1, REPORT_WORK.MaxIndex()
    REPORT_ANSWER := % REPORT_WORK[RANDOM_ID]
    LEN_REPORT_ANSWER := StrLen(REPORT_ANSWER) + 1


    If (AUTO_REPORT == 1)
        sendChat("/ans " . LAST_REPORT_ID . " " . REPORT_ANSWER)

    If (AUTO_REPORT == 0) {
        SendInput,{F6}
        Sleep 65
        SendInput,/ans %LAST_REPORT_ID% %REPORT_ANSWER%{left %LEN_REPORT_ANSWER%}
    }

    LAST_ANSWERED_ID := LAST_REPORT_ID
    LAST_REPORT_TICK := A_TickCount
Return


::вы::Вы
::вас::Вас
::ваш::Ваш   
::ваша::Ваша
::вам::Вам
::вами::Вами
::вашей::Вашей
::вашему::Вашему

REP_NG:
    SendMessage, 0x50,, 0x4190419,, A
    random, RANDOM_ID, 1, REPORT_NICE.MaxIndex()
    REPORT_ANSWER := % REPORT_NICE[RANDOM_ID]
    LEN_REPORT_ANSWER := StrLen(REPORT_ANSWER)+1
    SendInput,{F6}
    Sleep 65
    SendInput,/ans %LAST_ANSWERED_ID% %REPORT_ANSWER%{left %LEN_REPORT_ANSWER%}
Return

REP_NVIOL:
    SendMessage, 0x50,, 0x4190419,, A
    random, RANDOM_ID, 1, REPORT_NO_VIOLATIONS.MaxIndex()
    REPORT_ANSWER := % REPORT_NO_VIOLATIONS[RANDOM_ID]
    LEN_REPORT_ANSWER := StrLen(REPORT_ANSWER)+1
    SendInput,{F6}
    Sleep 65
    SendInput,/ans %LAST_ANSWERED_ID% %REPORT_ANSWER%{left %LEN_REPORT_ANSWER%}
Return

REP_PUNISH:
    SendMessage, 0x50,, 0x4190419,, A
    random, RANDOM_ID, 1, REPORT_PUNISH.MaxIndex()
    REPORT_ANSWER := % REPORT_PUNISH[RANDOM_ID]
    LEN_REPORT_ANSWER := StrLen(REPORT_ANSWER)+1
    SendInput,{F6}
    Sleep 65
    SendInput,/ans %LAST_ANSWERED_ID% %REPORT_ANSWER%{left %LEN_REPORT_ANSWER%}
Return

REP_PREV:
    SendMessage, 0x50,, 0x4190419,, A
    random, RANDOM_ID, 1, REPORT_WORK.MaxIndex()
    REPORT_ANSWER := % REPORT_WORK[RANDOM_ID]
    LEN_REPORT_ANSWER := StrLen(REPORT_ANSWER) + 1
    SendInput,{F6}
    Sleep 65
    SendInput,/ans %PREV_REPORT_ID% %REPORT_ANSWER%{left %LEN_REPORT_ANSWER%}
    LAST_REPORT_TICK := A_TickCount
Return

REP_ANID:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput,{F6}
    Sleep 65
    SendInput,/ans %LAST_REPORT_ID%{space}
    LAST_REPORT_TICK := A_TickCount
Return

REP_ANSID_PR:
    SendMessage, 0x50,, 0x4190419,, A
    SendInput,{F6}
    Sleep 65
    SendInput,/ans %PREV_REPORT_ID%{space}
    LAST_REPORT_TICK := A_TickCount
Return

TL_KILL:
    SendMessage, 0x50,, 0x4190419,, A
    SendChat("/sp " . CRMP_LAST_DEATH_ID)
    If (AC_KILL_IN_CHAT == 1)
        SendChat("/a «TH» Начал следить за убийством от ID " . CRMP_LAST_DEATH_ID)
Return

TL_CAPS:
    SendMessage, 0x50,, 0x4190419,, A
    SendChat("/wa " . CRMP_LAST_CAPSLOCK_ID . " Выключите верхний регистр (CAPS LOCK)")
Return

TL_NICK:
    SendMessage, 0x50,, 0x4190419,, A
    SendChat("/nick " . CRMP_LAST_NONRP_NICK_ID)
Return

TL_TIPOFF:
    SendMessage, 0x50,, 0x4190419,, A

    type_tipoff := CRMP_LAST_TIP_OFF[1]
    content_tipoff := CRMP_LAST_TIP_OFF[2]
    initials_tipoff := CRMP_LAST_TIP_OFF[3]

    if type_tipoff in /wa,/slap,/setvw,/rscar,/nick,/setcarvw 
        {
        sendChat(content_tipoff)
        Return
    }

    if type_tipoff in /skick,/unmute,/offunmute,/vunmute,/offvunmute,/unwarn,/offunwarn,/afree,/offafree,/offclear,/clear,/offrunmute,/runmute,/spa,/fspa 
        {
        SendInput,{F6}
        Sleep 65
        SendInput,%content_tipoff%
        Return
    }

    if (type_tipoff == "/dm") {
        StringSplit, tipoff, content_tipoff, " "
        id_tipoff := tipoff2
        SendInput,{F6}
        Sleep 65
        SendInput, /jail %id_tipoff% 60 DM | %initials_tipoff%
        Return
    }

    if type_tipoff in /nrp,/nonrp
        {
        StringSplit, tipoff, content_tipoff, " "
        id_tipoff := tipoff2
        SendInput,{F6}
        Sleep 65
        SendInput, /jail %id_tipoff% 30 NonRP | %initials_tipoff%
        Return
    }

    if (type_tipoff == "/dmzz") {
        StringSplit, tipoff, content_tipoff, " "
        id_tipoff := tipoff2
        SendInput,{F6}
        Sleep 65
        SendInput, /jail %id_tipoff% 60 DM в ЗЗ | %initials_tipoff%
        Return
    }

    if (type_tipoff == "/caps") {
        StringSplit, tipoff, content_tipoff, " "
        id_tipoff := tipoff2
        SendInput,{F6}
        Sleep 65
        SendInput, /mute %id_tipoff% 20 CAPS LOCK | %initials_tipoff%
        Return
    }

    if (type_tipoff == "/drive") {
        StringSplit, tipoff, content_tipoff, " "
        id_tipoff := tipoff2
        SendInput,{F6}
        Sleep 65
        SendInput, /jail %id_tipoff% 30 NonRP езда | %initials_tipoff%
        Return
    }

    if (type_tipoff == "/mg") {
        StringSplit, tipoff, content_tipoff, " "
        id_tipoff := tipoff2
        SendInput,{F6}
        Sleep 65
        SendInput, /mute %id_tipoff% 30 MG | %initials_tipoff%
        Return
    }

    if type_tipoff in /kick,/jail,/offjail,/mute,/offmute,/vmute,/offvmute,/warn,/offwarn,/ban,/offban,/rmute,/offrmnute
    {
        SendInput,{F6}
        Sleep 65
        SendInput,%content_tipoff% | %initials_tipoff%
        Return
    }

Return

TL_AC:
    SendChat("/sp " . CRMP_ANTICHEAT_LAST_ID)
    If (AC_KILL_IN_CHAT == 1)
        SendChat("/a «TH» Начал следить по античиту за ID " . CRMP_ANTICHEAT_LAST_ID)
Return

TL_GETPCAR:
    SendChat("/getpcar " . LAST_SPEC_ID)
Return

TL_SLAP:
    sendChat("/slap " . LAST_SPEC_ID)
Return

TL_GRUZ:
    sendChat("/gruz " . LAST_SPEC_ID)
Return

TL_FLIP:
    sendChat("/flip " . LAST_SPEC_ID)
Return

TL_GO_TO_SPEC:
    sendChat("/sp " . LAST_REPORT_ID)
Return

TL_RSP:
    rsp_id := 0
    random, rsp_id, 0, MAX_SP
    sendChat("/sp " . rsp_id)
Return



UnansweredReportGuiEscape:
UnansweredReportGuiClose:
    Menu, Tray, Enable, Помощник проверки жалоб
    Gui, Destroy
Return

LicenseGuiEscape:
LicenseGuiClose:
ExitApp, 77
Return

ComplainMonitorGuiEscape:
ComplainMonitorGuiClose:
    Menu, Tray,  Enable, Монитор неотвеченных запросов
    Gui, Destroy
Return

SettingsGuiEscape:
SettingsGuiClose:
    Gui, Destroy
Return

CHANGE_ANS_FILES:
    Run, %A_MyDocuments%\Themis\ans
Return

CHANGE_REPORT:
    InputBox, REPORT_COUNT, Themis — Количество репорта, Введите новое количество репорта:,,350, 140, %A_ScreenWidth% / 2, %A_ScreenWidth% /2
    If ErrorLevel
        Return
    writeReportCount(REPORT_COUNT)
    TrayTip, Themis — Количество репорта,Количество репорта успешно измененено, 3
Return

REPORT_SHOW_COUNT:
    rc := % getReportCount()
    MsgBox, 64, Themis — Количество репорта, Вы ответили первым на %rc% репорт(-а, -ов)
Return

LABEL_GET_AUTHOR:
	Run, % getAuthorThemis()
Return

LABEL_RELOAD_AHK:
    online := getOnline()
    online := online + secs
    writeOnline(online)
    Reload
Return

LABEL_DELETE_CONFIG:
    FileDelete, %A_AppData%\Themis\data\config.ini
    online := getOnline()
    online := online + secs
    writeOnline(online)
    Reload
Return

SHOW_SETTINGS:
    Settings.ShowGUI()
Return

LABEL_EXIT:
    TODAY := A_DD . "." . A_MM . "." . A_YYYY
    NOW := A_Hour . "-" . A_Min . "-" . A_Sec

    overlay.destroy()

    online := getOnline()
    online := online + secs
    writeOnline(online)
    FileMove, %CHATLOG_PATH%, %CHATLOGS_PATH%\%TODAY%\%NOW%.txt
    ExitApp
Return

COMPLAINT_MONITOR:
    Menu, Tray, Disable, Монитор неотвеченных запросов
    ComplaintMonitor.Show()
Return

UNANSWERED_REPORT_MONITOR:
    ComplaintMonitor.Show()
    Menu, Tray, Disable, Помощник проверки жалоб
Return

:?*:/delrep::
REPORT_MAIN_ARRAY := []
QUESTION_MAIN_ARRAY := []
UpdateUnansweredReportMonitor(REPORT_MAIN_ARRAY, QUESTION_MAIN_ARRAY)
Overlay.updateReport(REPORT_MAIN_ARRAY)
Overlay.updateQuestions(QUESTION_MAIN_ARRAY)
Return

:?*:/rsp::
    rsp_id := 0
    random, rsp_id, 0, MAX_SP
    sendChat("/sp " . rsp_id)
Return


:?B0:/getrep::
SendMessage, 0x50,, 0x4190419,, A
Input, Txt, V M, {Enter}
if (ErrorLevel == "NewInput" or ErrorLevel == "EndKey:Esc")
    {
        SendInput, {F6}
        Sleep 60
        SendInput, {Ctrl}+{A}{Del}
        Return
    }
else
    {
        SendInput, {Ctrl}+{A}{Del}
        Sleep 60
        checkHandles()
        sleep 250

        addChatMessageEx(0x4169E1, "{4169E1}[&#9878; Themis] {F0FFFF}Информация о репорте ID " . REPORT_MAIN_ARRAY[Txt, 2])
        addChatMessageEx(0x4169E1, "{4169E1}[&#9878; Themis] {F0FFFF}ID игрока: {FFA500}" . REPORT_MAIN_ARRAY[Txt, 2])
        addChatMessageEx(0x4169E1, "{4169E1}[&#9878; Themis] {F0FFFF}Никнейм игрока: {FFA500}" . REPORT_MAIN_ARRAY[Txt, 3])
        addChatMessageEx(0x4169E1, "{4169E1}[&#9878; Themis] {F0FFFF}Суть репорта: {FFA500}" . REPORT_MAIN_ARRAY[Txt, 4])
    }
Return

:?B0:/getask::
SendMessage, 0x50,, 0x4190419,, A
Input, Txt, V M, {Enter}
if (ErrorLevel == "NewInput" or ErrorLevel == "EndKey:Esc")
    {
        SendInput, {F6}
        Sleep 60
        SendInput, {Ctrl}+{A}{Del}
        Return
    }
else
    {
        SendInput, {Ctrl}+{A}{Del}
        Sleep 60
        checkHandles()
        sleep 250
        addChatMessageEx(0, "{4169E1}[&#9878; Themis] {F0FFFF}Информация о вопросе ID " . QUESTION_MAIN_ARRAY[Txt, 2])
        addChatMessageEx(0, "{4169E1}[&#9878; Themis] {F0FFFF}ID игрока: {FFA500}" . QUESTION_MAIN_ARRAY[Txt, 2])
        addChatMessageEx(0, "{4169E1}[&#9878; Themis] {F0FFFF}Никнейм игрока: {FFA500}" . QUESTION_MAIN_ARRAY[Txt, 3])
        addChatMessageEx(0, "{4169E1}[&#9878; Themis] {F0FFFF}Суть репорта: {FFA500}" . QUESTION_MAIN_ARRAY[Txt, 4])
    }
Return

getReportCount()
{
    RegRead, vars, HKEY_CURRENT_USER, SOFTWARE\Themis\Report, Reports

    if ErrorLevel = 1
    {
        vars := 0
        ErrorLevel := 0
    }
    Return vars
}

writeReportCount(countRep)
{
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, SOFTWARE\Themis\Report, Reports, %countRep%
}

checkTodayReport()
{
    RegRead, day, HKEY_CURRENT_USER, SOFTWARE\Themis\Report, DayReport

    if (ErrorLevel == 1)
        day := 0

    If (day == A_DD)
        return

    RegWrite, REG_DWORD, HKEY_CURRENT_USER, SOFTWARE\Themis\Report, DayReport, %A_DD%
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, SOFTWARE\Themis\Report, TodayReport, 0
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, SOFTWARE\Themis\Report, TodayMissed, 0

}

readTodayAnsweredReport()
{
    RegRead, TodayRep, HKEY_CURRENT_USER, SOFTWARE\Themis\Report, TodayReport
    if (ErrorLevel == 1)
        TodayRep := 0
    
    Return TodayRep
}

readTodayMissedReport()
{
    RegRead, TodayMissed, HKEY_CURRENT_USER, SOFTWARE\Themis\Report, TodayMissed
    if (ErrorLevel == 1)
        TodayMissed := 0
    
    Return TodayMissed
}

addOneTodayAnsweredReport()
{
    TodayRep := 0
    RegRead, TodayRep,HKEY_CURRENT_USER, SOFTWARE\Themis\Report, TodayReport
    
    if (ErrorLevel == 1)
        TodayRep := 0

    TodayRep := TodayRep + 1
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, SOFTWARE\Themis\Report, TodayReport, %TodayRep% 
}

addOneTodayMissedReport()
{
    TodayMissed := 0
    RegRead, TodayMissed, HKEY_CURRENT_USER, SOFTWARE\Themis\Report, TodayMissed
    
    if (ErrorLevel == 1)
        TodayMissed := 0

    TodayMissed := TodayMissed + 1
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, SOFTWARE\Themis\Report, TodayMissed, %TodayMissed% 
}

delOneTodayMissedReport()
{
    TodayMissed := 0
    RegRead, TodayMissed, HKEY_CURRENT_USER, SOFTWARE\Themis\Report, TodayMissed

    if (ErrorLevel == 1)
        TodayMissed := 1

    TodayMissed := TodayMissed - 1
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, SOFTWARE\Themis\Report, TodayMissed, %TodayMissed%
}

getOnline()
{
    RegRead, online, HKEY_CURRENT_USER, SOFTWARE\Themis, Online 

    return online
}

getOnlineDate()
{
    RegRead, onlineDate, HKEY_CURRENT_USER, SOFTWARE\Themis, OnlineDate

    return onlineDate
}

writeOnline(countOnline)
{
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, SOFTWARE\Themis, Online, %countOnline%
}

writeOnlineDate(temper)
{
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, SOFTWARE\Themis, OnlineDate, %temper%
}

secToTime(sec)
{
    h := sec/3600 ^ 0
    m := (sec-h*3600)/60 ^ 0
    s := sec-h*3600-m*60

    Return (h < 10 ? "0" h : h) ":" (m < 10 ? "0" m : m) ":" (s < 10 ? "0" s : s)
}

getAuthorThemis() {
    return "https://vk.com/alexsandros12"
}

getTimeFormat()
{
    Time := A_NowUTC
    Time += 3, h
    yTime := SubStr(Time, 1, 4)
    mTime := SubStr(Time, 5, 2)
    dTime := SubStr(Time, 7, 2)
    hTime := SubStr(Time, 9, 2)
    minTime := SubStr(Time, 11, 2)
    secTime := SubStr(Time, 13, 2)

    Return, dTime "-" mTime "-" yTime " " hTime ":" minTime ":" secTime ".000000"
}

loadInGame() {
    if (!checkHandles())
        checkHandles()
    Sleep 500		
    addChatMessageEx(0x4169E1, "          ")
    addChatMessageEx(0x4169E1, "{4518ff}_______________________________________ Themis _________________________________________")
    addChatMessageEx(0x4169E1, "          ")
    addChatMessageEx(0x4169E1, "{4169E1}[&#9878; Themis]{F0FFFF} Добро пожаловать, " . CRMP_USER_NICKNAME)
    addChatMessageEx(0x4169E1, "{4169E1}[&#9878; Themis]{F0FFFF} Нашли какую-то ошибку? - {ffa500}/bugrep")
    addChatMessageEx(0x4169E1, "{4169E1}[&#9878; Themis]{F0FFFF} Удачной работы и слежки!")
    addChatMessageEx(0x4169E1, "{4518ff}_________________________________________________________________________________________")
    addChatMessageEx(0x4169E1, "          ")
}

reloadInGame() {
    if (!checkHandles())
        checkHandles()
    Sleep 500
    addChatMessageEx(0, "          ")
    addChatMessageEx(0, "{4518ff}_______________________________________ Themis _________________________________________")
    addChatMessageEx(0, "          ")
    addChatMessageEx(0, "{4169E1}[&#9878; Themis]{F0FFFF} С возвращением в игру, " . CRMP_USER_NICKNAME)
    addChatMessageEx(0, "{4169E1}[&#9878; Themis]{F0FFFF} Нашли какую-то ошибку? - {ffa500}/bugrep")
    addChatMessageEx(0, "{4169E1}[&#9878; Themis]{F0FFFF} Удачной работы и слежки!")
    addChatMessageEx(0, "{4518ff}________________________________________________________________________________________")
    addChatMessageEx(0, "          ")
}

:?:/bugrep::
Run, https://vk.com/write-218914983
Return

formatHotKey(STRING) {
    formated_str := STRING
    Loop, Parse, STRING
    {
        If (A_LoopField == "!")
        {
            formated_str := StrReplace(STRING, "!", "Alt + ")
        }
        If (A_LoopField == "#")
        {
            formated_str := StrReplace(STRING, "#", "Win + ")
        }
        If (A_LoopField == "^")
        {
            formated_str := StrReplace(STRING, "^", "Ctrl + ")
        }
        If (A_LoopField == "+")
        {
            formated_str := StrReplace(STRING, "+", "Shift + ")
        }
    }

    Return, formated_str

}

readAnsFiles()
{
    FileEncoding, UTF-8
    Loop, read, %A_MyDocuments%\Themis\ans\REPORT.txt
        {
            inx := A_Index
            Loop, parse, A_LoopReadLine, %A_Tab%
            {
                REPORT_WORK.InsertAt(inx, A_LoopField)
            }
        }
    Loop, read, %A_MyDocuments%\Themis\ans\NICEGAME.txt
        {
            inx := A_Index
            Loop, parse, A_LoopReadLine, %A_Tab%
            {
                REPORT_NICE.InsertAt(inx, A_LoopField)
            }
        }
    Loop, read, %A_MyDocuments%\Themis\ans\PUNISH.txt
        {
            inx := A_Index
            Loop, parse, A_LoopReadLine, %A_Tab%
            {
                REPORT_PUNISH.InsertAt(inx, A_LoopField)
            }
        }
    Loop, read, %A_MyDocuments%\Themis\ans\NOVIOLAT.txt
        {
            inx := A_Index
            Loop, parse, A_LoopReadLine, %A_Tab%
            {
                REPORT_NO_VIOLATIONS.InsertAt(inx, A_LoopField)
            }
        }
    Loop, read, %A_MyDocuments%\Themis\ans\FIRST.txt
        {
            inx := A_Index
            Loop, parse, A_LoopReadLine, %A_Tab%
            {
                PLUS_REP.InsertAt(inx, A_LoopField)
            }
        }
}

GetNewLine(CRMP_CHATLOG_FILE) {

	static CRMP_CHATLOG_OLD_SIZE
	static CRMP_CHATLOG_NEW_SIZE
	
	if !CRMP_CHATLOG_OLD_SIZE 
	{
		FileGetSize, CRMP_CHATLOG_OLD_SIZE, %CRMP_CHATLOG_FILE%
		CRMP_CHATLOG_NEW_SIZE := CRMP_CHATLOG_OLD_SIZE
	}
	
	while CRMP_CHATLOG_OLD_SIZE = CRMP_CHATLOG_NEW_SIZE 
	{
		Sleep 3
		FileGetSize, CRMP_CHATLOG_NEW_SIZE, %CRMP_CHATLOG_FILE%
	}
	
	if CRMP_CHATLOG_NEW_SIZE >= 51200
		{
			TODAY := A_DD . "." . A_MM . "." . A_YYYY
			NOW := A_Hour . "-" . A_Min . "-" . A_Sec
			FileMove, %CRMP_CHATLOG_FILE%, %CHATLOGS_PATH%\%TODAY%\%NOW%.txt
			FileDelete, %CRMP_CHATLOG_FILE%
		}
		
	
	CRMP_CHATLOG_OLD_SIZE := CRMP_CHATLOG_NEW_SIZE
	Loop, read, %CRMP_CHATLOG_FILE%
	{
		if A_LoopReadLine
			CRMP_CHATLOG_LAST_LINE := A_LoopReadLine
	}
	return CRMP_CHATLOG_LAST_LINE
}