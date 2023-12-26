#NoEnv

class Settings {

    ShowGUI() {
        Run RunDll32.exe InetCpl.cpl`,ClearMyTracksByProcess 8

        RegRead, SettingNickname, HKEY_CURRENT_USER, SOFTWARE\Amazing\Russia\Nicknames, %AMAZING_SERVER%

        sleep 100

        AHKSettings_Nickname.value := SettingNickname
        
        AHKSettings_GamePath.value := AMAZING_PATH
        AHKSettings_AmazingServer.value := AMAZING_SERVER


        AHKSettings_CheckBox_SoundNewReport.Checked := NEW_REPORT_NOTIFY == 1 ? true : false
        AHKSettings_Select_ReportSound.value := NEW_REPORT_SOUND

        AHKSettings_CheckBox_SoundNewAsk.Checked := NEW_QUESTION_NOTIFY  == 1 ? true : false
        AHKSettings_Select_AskSound.value := NEW_QUESTION_SOUND

        AHKSettings_CheckBox_SoundKill.Checked := NEW_KILL_NOTIFY == 1 ? true : false
        AHKSettings_Select_KillSound.value := NEW_KILL_SOUND

        AHKSettings_CheckBox_SoundCAPS.Checked := NEW_CAPSLOCK_NOTIFY == 1 ? true : false
        AHKSettings_Select_CAPSSound.value := NEW_CAPSLOCK_SOUND
        
        AHKSettings_CheckBox_SoundNick.Checked := NEW_NRPNICK_NOTIFY == 1 ? true : false
        AHKSettings_Select_NickSound.value := NEW_NRPNICK_SOUND
        
        AHKSettings_CheckBox_SoundAntiCheat.Checked := NEW_AC_NOTIFY == 1 ? true : false
        AHKSettings_Select_AntiCheatSound.value := AC_SOUND
        
        AHKSettings_CheckBox_SoundTipOff.Checked := NEW_TIPOFF_NOTIFY == 1 ? true : false
        AHKSettings_Select_TipOffSound.value := NEW_TIPOFF_SOUND
        

        AHKSettings_CheckBox_NotifyKill.Checked := KILL_NOTIFY == 1 ? true : false
        AHKSettings_CheckBox_NotifyCAPS.Checked := CAPSLOCK_NOTIFY == 1 ? true : false
        AHKSettings_CheckBox_NotifyNick.Checked := NRPNICK_NOTIFY == 1 ? true : false
        AHKSettings_CheckBox_NotifyAntiCheat.Checked := AC_NOTIFY == 1 ? true : false
        AHKSettings_CheckBox_NotifyFirstAns.Checked := FIRSTANSWER_NOTIFY == 1 ? true : false
        AHKSettings_CheckBox_NotifyTipOff.Checked := TIPOFF_NOTIFY == 1 ? true : false

        AHKSettings_Input_HotkeyCurrentReport.value := REPORT_WORKING
        AHKSettings_Input_HotkeyPrevReport.value := PREV_REPORT
        AHKSettings_Input_HotkeyNiceGame.value := REPORT_NICEGAME
        AHKSettings_Input_HotkeyNoViolat.value := REPORT_NOVIOLAT
        AHKSettings_Input_HotkeyPunish.value := REPORT_PUNISHED
        AHKSettings_Input_AnsIDCurrent.value := REPORT_ANSID
        AHKSettings_Input_AnsIDPrev.value := REPORT_ANSID_PREV
        AHKSettings_Input_HotkeyKill.value := TOOLS_KILL
        AHKSettings_Input_HotkeyCAPS.value := TOOLS_CAPS
        AHKSettings_Input_HotkeyCheat.value := TOOLS_AC
        AHKSettings_Input_HotkeyNick.value := TOOLS_NICK
        AHKSettings_Input_HotkeyTipOff.value := TOOLS_TIPOFF

        AHKSettings_CheckBox_SearchQuestions.Checked := SEARCH_QUESTIONS == 1 ? true : false
        AHKSettings_CheckBox_SearchReport.Checked := SEARCH_REPORT == 1 ? true : false
        AHKSettings_CheckBox_AutoReport.Checked := AUTO_REPORT == 1 ? true : false
        AHKSettings_CheckBox_SearchCAPS.Checked := SEARCH_CAPS == 1 ? true : false
        AHKSettings_CheckBox_SearchKill.Checked := SEARCH_KILL == 1 ? true : false
        AHKSettings_CheckBox_SearchAC.Checked := SEARCH_AC == 1 ? true : false
        AHKSettings_CheckBox_SearchNrpNick.Checked := SEARCH_NRPNICK == 1 ? true : false
        AHKSettings_CheckBox_AutoReportSpec.Checked := AUTO_SPEC == 1 ? true : false
        AHKSettings_CheckBox_ACSend.Checked := AC_KILL_IN_CHAT == 1 ? true : false
        AHKSettings_CheckBox_5min.Checked := MIN5_ON_OFF == 1 ? true : false

        AHKSettings_Input_MaxRsp.Value := MAX_SP
        AHKSettings_Input_HotkeyGetpcar.Value := TOOLS_GETPCAR
        AHKSettings_Input_HotkeySlap.Value := TOOLS_SLAP
        AHKSettings_Input_HotkeyGruz.Value := TOOLS_GRUZ
        AHKSettings_Input_HotkeyFlip.Value := TOOLS_FLIP

        AHKSettings_CheckBox_EnableInterface.Checked := ENABLE_INTERFACE == 1 ? true : false
        AHKSettings_CheckBox_WidgetReport.Checked := WIDGET_REPORT == 1 ? true : false
        AHKSettings_CheckBox_WidgetAsk.Checked := WIDGET_QUESTIONS == 1 ? true : false
        AHKSettings_Input_MainColor.Value := MAIN_COLOR
        AHKSettings_Input_SecondColor.Value := SECOND_COLOR
        AHKSettings_Input_BackColor.Value := BACKGROUND_COLOR
        AHKSettings_Select_IntefracePosition.Value := POSITION_INTERFACE
        AHKSettings_Input_RepSpec.Value := TOOLS_GO_TO_SPEC
        AHKSettings_Input_SpRandom.Value := TOOLS_RSP
        AHKSettings_CheckBox_WidgetInfoRep.Checked := WIDGET_INFO_REPORT == 1 ? true : false
        AHKSettings_CheckBox_WidgetContRep.Checked := WIDGET_REPORT_COUNT == 1 ? true : false



        ComObjConnect(AHKSettings_AmazingServer, "AHKSettings_AmazingServer_")
        ComObjConnect(AHKButtonClose, "AHKButtonClose_")
        ComObjConnect(AHKButtonCancel, "SettingsAHKButtonCancel_")
        ComObjConnect(AHKButtonSave, "AHKButtonSave_")
        ComObjConnect(AHKButtonApply, "AHKButtonApply_")
        ComObjConnect(AHKButtonGamePath, "AHKButtonGamePath_")
        ComObjConnect(AHKButton_Listen_AntiCheat, "AHKButton_Listen_AntiCheat_")
        ComObjConnect(AHKButton_Listen_Ask, "AHKButton_Listen_Ask_")
        ComObjConnect(AHKButton_Listen_CAPS, "AHKButton_Listen_CAPS_")
        ComObjConnect(AHKButton_Listen_Kill, "AHKButton_Listen_Kill_")
        ComObjConnect(AHKButton_Listen_Nick, "AHKButton_Listen_Nick_")
        ComObjConnect(AHKButton_Listen_Report, "AHKButton_Listen_Report_")
        ComObjConnect(AHKButton_Listen_TipOff, "AHKButton_Listen_TipOff_")

        Gui, Settings:Show, w1080 h750, % "Themis - Настройки"

    }

}

AHKSettings_AmazingServer_OnChange() {
    a := AHKSettings_AmazingServer.value
    RegRead, SettingNickname, HKEY_CURRENT_USER, SOFTWARE\Amazing\Russia\Nicknames, %a%
    AHKSettings_Nickname.value := SettingNickname
}

AHKButtonApply_OnClick() {
    
    SettingsGamePath := AHKSettings_GamePath.value, SettingsServer := AHKSettings_AmazingServer.value

    SettingsSearchReport :=         AHKSettings_CheckBox_SearchReport.Checked == 0 ? 0 : 1
    SettingsSearchQuestions :=      AHKSettings_CheckBox_SearchQuestions.Checked == 0 ? 0 : 1
    SettingsSearchCAPS :=           AHKSettings_CheckBox_SearchCAPS.Checked == 0 ? 0 : 1
    SettingsSearchKill :=           AHKSettings_CheckBox_SearchKill.Checked == 0 ? 0 : 1
    SettingsSearchNrpNick :=        AHKSettings_CheckBox_SearchNrpNick.Checked == 0 ? 0 : 1
    SettingsSearchAC :=             AHKSettings_CheckBox_SearchAC.Checked == 0 ? 0 : 1
    SettingsMaxSP :=                AHKSettings_Input_MaxRsp.value
    SettingsAutoSpec :=             AHKSettings_CheckBox_AutoReportSpec.Checked == 0 ? 0 : 1
    SettingsAutoReport :=           AHKSettings_CheckBox_AutoReport.Checked == 0 ? 0 : 1

    SettingEnableInterface :=       AHKSettings_CheckBox_EnableInterface.Checked == 0 ? 0 : 1
    SettingPositionInterface :=     AHKSettings_Select_IntefracePosition.value
    SettingWidgetReport :=          AHKSettings_CheckBox_WidgetReport.Checked == 0 ? 0 : 1
    SettingWidgetQuestions :=       AHKSettings_CheckBox_WidgetAsk.Checked == 0 ? 0 : 1
    SettingWidgetInfoReport :=      AHKSettings_CheckBox_WidgetInfoRep.Checked == 0 ? 0 : 1
    SettingWidgetReportCount :=     AHKSettings_CheckBox_WidgetContRep.Checked == 0 ? 0 : 1
    SettingMainColor :=             AHKSettings_Input_MainColor.value
    SettingSecondColor :=           AHKSettings_Input_SecondColor.value
    SettingBackColor :=             AHKSettings_Input_BackColor.value

    SettingsSndNotifyReport :=      AHKSettings_CheckBox_SoundNewReport.Checked == 0 ? 0 : 1
    SettingsSndNotifyQuestion :=    AHKSettings_CheckBox_SoundNewAsk.Checked == 0 ? 0 : 1
    SettingsSndNotifyCAPS :=        AHKSettings_CheckBox_SoundCAPS.Checked == 0 ? 0 : 1
    SettingsSndNotifyKill :=        AHKSettings_CheckBox_SoundKill.Checked == 0 ? 0 : 1
    SettingsSndNotifyNick :=        AHKSettings_CheckBox_SoundNick.Checked == 0 ? 0 : 1
    SettingsSndNotifyTipOff :=      AHKSettings_CheckBox_SoundTipOff.Checked == 0 ? 0 : 1
    SettingsSndNotifyAC :=          AHKSettings_CheckBox_SoundAntiCheat.Checked == 0 ? 0 : 1

    SettingsSoundReport :=          AHKSettings_Select_ReportSound.value
    SettingsSoundQuestion :=        AHKSettings_Select_AskSound.value
    SettingsSoundCAPS :=            AHKSettings_Select_CAPSSound.value
    SettingsSoundKill :=            AHKSettings_Select_KillSound.value
    SettingsSoundNrpNick :=         AHKSettings_Select_NickSound.value
    SettingsSoundTipOff :=          AHKSettings_Select_TipOffSound.value
    SettingsSoundAC :=              AHKSettings_Select_AntiCheatSound.value

    SettingsNoticeKill :=           AHKSettings_CheckBox_NotifyKill.Checked == 0 ? 0 : 1
    SettingsNoticeCAPS :=           AHKSettings_CheckBox_NotifyCAPS.Checked == 0 ? 0 : 1
    SettingsNoticeNick :=           AHKSettings_CheckBox_NotifyNick.Checked == 0 ? 0 : 1
    SettingsNoticeTipOff :=         AHKSettings_CheckBox_NotifyTipOff.Checked == 0 ? 0 : 1
    SettingsNoticeFirst :=          AHKSettings_CheckBox_NotifyFirstAns.Checked == 0 ? 0 : 1
    SettingsNoticeAC :=             AHKSettings_CheckBox_NotifyAntiCheat.Checked == 0 ? 0 : 1
    Settings5min :=                 AHKSettings_CheckBox_5min.Checked == 0 ? 0 : 1
    SettingsAcKillInChat :=         AHKSettings_CheckBox_ACSend.Checked == 0 ? 0 : 1

    SettingsHotkeyLastReport :=     AHKSettings_Input_HotkeyCurrentReport.value
    SettingsHotkeyNiceGame :=       AHKSettings_Input_HotkeyNiceGame.value
    SettingsHotkeyNoViolat :=       AHKSettings_Input_HotkeyNoViolat.value
    SettingsHotkeyPunish :=         AHKSettings_Input_HotkeyPunish.value
    SettingsHotkeyPrevReport :=     AHKSettings_Input_HotkeyPrevReport.value
    SettingsHotkeyAnsID :=          AHKSettings_Input_AnsIDCurrent.value
    SettingsHotkeyPrevAnsID :=      AHKSettings_Input_AnsIDPrev.value
    SettingsHotkeyKill :=           AHKSettings_Input_HotkeyKill.value
    SettingsHotkeyCAPS :=           AHKSettings_Input_HotkeyCAPS.value
    SettingsHotkeyNick :=           AHKSettings_Input_HotkeyNick.value
    SettingsHotkeyTipOff :=         AHKSettings_Input_HotkeyTipOff.value
    SettingsHotkeyAC :=             AHKSettings_Input_HotkeyCheat.value
    SettingHotkeyGetpcar :=         AHKSettings_Input_HotkeyGetpcar.value
    SettingHotkeySlap :=            AHKSettings_Input_HotkeySlap.value
    SettingHotkeyFlip :=            AHKSettings_Input_HotkeyFlip.value
    SettingHotkeyGruz :=            AHKSettings_Input_HotkeyGruz.value
    SettingHotkeyGoToSpec :=        AHKSettings_Input_RepSpec.value
    SettingHotkeyRsp :=             AHKSettings_Input_SpRandom.value

    IniWrite, %SettingsGamePath%,%A_ScriptDir%\data\config.ini, GENERAL, AMAZING_PATH
    IniWrite, %SettingsServer%,%A_ScriptDir%\data\config.ini, GENERAL, AMAZING_SERVER

    IniWrite, %SettingsAutoSpec%,%A_ScriptDir%\data\config.ini, GENERAL, AUTO_SPEC
    IniWrite, %SettingsAutoReport%,%A_ScriptDir%\data\config.ini, GENERAL, AUTO_REPORT
    IniWrite, %SettingsMaxSP%,%A_ScriptDir%\data\config.ini, GENERAL, MAX_SP
    IniWrite, %SettingsSearchReport%,%A_ScriptDir%\data\config.ini, GENERAL, SEARCH_REPORT
    IniWrite, %SettingsSearchQuestions%,%A_ScriptDir%\data\config.ini, GENERAL, SEARCH_QUESTIONS
    IniWrite, %SettingsSearchCAPS%,%A_ScriptDir%\data\config.ini, GENERAL, SEARCH_CAPS
    IniWrite, %SettingsSearchKill%,%A_ScriptDir%\data\config.ini, GENERAL, SEARCH_KILL
    IniWrite, %SettingsSearchNrpNick%,%A_ScriptDir%\data\config.ini, GENERAL, SEARCH_NRPNICK
    IniWrite, %SettingsSearchAC%,%A_ScriptDir%\data\config.ini, GENERAL, SEARCH_AC

    IniWrite, %SettingEnableInterface%,%A_ScriptDir%\data\config.ini, INTEFRACE, ENABLE_INTERFACE
    IniWrite, %SettingPositionInterface%,%A_ScriptDir%\data\config.ini, INTEFRACE, POSITION_INTERFACE
    IniWrite, %SettingWidgetReport%,%A_ScriptDir%\data\config.ini, INTEFRACE, WIDGET_REPORT
    IniWrite, %SettingWidgetQuestions%,%A_ScriptDir%\data\config.ini, INTEFRACE, WIDGET_QUESTIONS
    IniWrite, %SettingWidgetInfoReport%,%A_ScriptDir%\data\config.ini, INTEFRACE, WIDGET_INFO_REPORT
    IniWrite, %SettingWidgetReportCount%,%A_ScriptDir%\data\config.ini, INTEFRACE, WIDGET_REPORT_COUNT
    IniWrite, %SettingMainColor%,%A_ScriptDir%\data\config.ini, INTEFRACE, MAIN_COLOR
    IniWrite, %SettingSecondColor%,%A_ScriptDir%\data\config.ini, INTEFRACE, SECOND_COLOR
    IniWrite, %SettingBackColor%,%A_ScriptDir%\data\config.ini, INTEFRACE, BACKGROUND_COLOR

    IniWrite, %SettingsSndNotifyReport%,%A_ScriptDir%\data\config.ini, SOUND, NEW_REPORT_NOTIFY
    IniWrite, %SettingsSoundReport%,%A_ScriptDir%\data\config.ini, SOUND, NEW_REPORT_SOUND
    IniWrite, %SettingsSndNotifyQuestion%,%A_ScriptDir%\data\config.ini, SOUND, NEW_QUESTION_NOTIFY
    IniWrite, %SettingsSoundQuestion%,%A_ScriptDir%\data\config.ini, SOUND, NEW_QUESTION_SOUND
    IniWrite, %SettingsSndNotifyCAPS%,%A_ScriptDir%\data\config.ini, SOUND, NEW_CAPSLOCK_NOTIFY
    IniWrite, %SettingsSoundCAPS%,%A_ScriptDir%\data\config.ini, SOUND, NEW_CAPSLOCK_SOUND
    IniWrite, %SettingsSndNotifyKill%,%A_ScriptDir%\data\config.ini, SOUND, NEW_KILL_NOTIFY
    IniWrite, %SettingsSoundKill%,%A_ScriptDir%\data\config.ini, SOUND, NEW_KILL_SOUND
    IniWrite, %SettingsSndNotifyNick%,%A_ScriptDir%\data\config.ini, SOUND, NEW_NRPNICK_NOTIFY
    IniWrite, %SettingsSoundNrpNick%,%A_ScriptDir%\data\config.ini, SOUND, NEW_NRPNICK_SOUND
    IniWrite, %SettingsSndNotifyTipOff%,%A_ScriptDir%\data\config.ini, SOUND, NEW_TIPOFF_NOTIFY
    IniWrite, %SettingsSoundTipOff%,%A_ScriptDir%\data\config.ini, SOUND, NEW_TIPOFF_SOUND
    IniWrite, %SettingsSndNotifyAC%,%A_ScriptDir%\data\config.ini, SOUND, NEW_AC_NOTIFY
    IniWrite, %SettingsSoundAC%,%A_ScriptDir%\data\config.ini, SOUND, NEW_AC_SOUND

    IniWrite, %SettingsNoticeKill%,%A_ScriptDir%\data\config.ini, NOTIFY, KILL_NOTIFY
    IniWrite, %SettingsNoticeCAPS%,%A_ScriptDir%\data\config.ini, NOTIFY, CAPSLOCK_NOTIFY
    IniWrite, %SettingsNoticeNick%,%A_ScriptDir%\data\config.ini, NOTIFY, NRPNICK_NOTIFY
    IniWrite, %SettingsNoticeTipOff%,%A_ScriptDir%\data\config.ini, NOTIFY, TIPOFF_NOTIFY
    IniWrite, %SettingsNoticeFirst%,%A_ScriptDir%\data\config.ini, NOTIFY, FIRSTANSWER_NOTIFY
    IniWrite, %SettingsNoticeAC%,%A_ScriptDir%\data\config.ini, NOTIFY, AC_NOTIFY
    IniWrite, %Settings5min%,%A_ScriptDir%\data\config.ini, NOTIFY, MIN5_ON_OFF
    IniWrite, %SettingsAcKillInChat%,%A_ScriptDir%\data\config.ini, NOTIFY, AC_KILL_IN_CHAT

    IniWrite, %SettingsHotkeyLastReport%,%A_ScriptDir%\data\config.ini, HOTKEYS, REPORT_WORKING
    IniWrite, %SettingsHotkeyNiceGame%,%A_ScriptDir%\data\config.ini, HOTKEYS, REPORT_NICEGAME
    IniWrite, %SettingsHotkeyNoViolat%,%A_ScriptDir%\data\config.ini, HOTKEYS, REPORT_NOVIOLAT
    IniWrite, %SettingsHotkeyPunish%,%A_ScriptDir%\data\config.ini, HOTKEYS, REPORT_PUNISHED
    IniWrite, %SettingsHotkeyPrevReport%,%A_ScriptDir%\data\config.ini, HOTKEYS, PREV_REPORT
    IniWrite, %SettingsHotkeyAnsID%,%A_ScriptDir%\data\config.ini, HOTKEYS, REPORT_ANSID
    IniWrite, %SettingsHotkeyPrevAnsID%,%A_ScriptDir%\data\config.ini, HOTKEYS, REPORT_ANSID_PREV
    IniWrite, %SettingsHotkeyKill%,%A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_KILL
    IniWrite, %SettingsHotkeyCAPS%,%A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_CAPS
    IniWrite, %SettingsHotkeyNick%,%A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_NICK
    IniWrite, %SettingsHotkeyTipOff%,%A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_TIPOFF
    IniWrite, %SettingsHotkeyAC%,%A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_AC

    IniWrite, %SettingHotkeyGetpcar%,%A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_GETPCAR
    IniWrite, %SettingHotkeyFlip%,%A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_FLIP
    IniWrite, %SettingHotkeySlap%,%A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_SLAP
    IniWrite, %SettingHotkeyGruz%,%A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_GRUZ
    IniWrite, %SettingHotkeyGoToSpec%,%A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_GO_TO_SPEC
    IniWrite, %SettingHotkeyRsp%,%A_ScriptDir%\data\config.ini, HOTKEYS, TOOLS_RSP
    
    TrayTip, Themis - Settings, Настройки сохранены, 5
    Return
}

AHKButtonClose_OnClick() {
	ExitApp
    Return
}

SettingsAHKButtonCancel_OnClick() {
	Gui, Settings:Hide
    Return
}

AHKButtonSave_OnClick() {
    AHKButtonApply_OnClick()
	Reload
    Return
}


SettingsGamePathBrowse(CtrlHwnd, GuiEvent, EventInfo, ErrLevel := "") {
    FileSelectFolder , SETTINGS_AMAZING_PATH, ::{20d04fe0-3aea-1069-a2d8-08002b30309d}, 3, Выберите папку игры (по-уполчанию: AMAZING RUSSIA)
    GuiControl,,SettingsGamePath,% SETTINGS_AMAZING_PATH
Return
}

SettingsListenReport(CtrlHwnd, GuiEvent, EventInfo, ErrLevel := "") {
    Gui, Submit, NoHide
    Sound := SettingsSoundReport . ".wav"
    SoundPlay,%A_ScriptDir%\data\sounds\%Sound%
Return
}

AHKButtonGamePath_OnClick() {
    FileSelectFolder , SETTINGS_AMAZING_PATH, ::{20d04fe0-3aea-1069-a2d8-08002b30309d}, 3, Выберите папку игры (по-уполчанию: AMAZING RUSSIA)
    AHKSettings_GamePath.value := SETTINGS_AMAZING_PATH
}

AHKButton_Listen_Report_OnClick() {
    snd := AHKSettings_Select_ReportSound.value
    SoundPlay,%A_ScriptDir%\data\sounds\%snd%.wav
}

AHKButton_Listen_Ask_OnClick() {
    snd := AHKSettings_Select_AskSound.value
    SoundPlay,%A_ScriptDir%\data\sounds\%snd%.wav
}

AHKButton_Listen_Kill_OnClick() {
    snd := AHKSettings_Select_KillSound.value
    SoundPlay,%A_ScriptDir%\data\sounds\%snd%.wav
}

AHKButton_Listen_CAPS_OnClick() {
    snd := AHKSettings_Select_CAPSSound.value
    SoundPlay,%A_ScriptDir%\data\sounds\%snd%.wav
}

AHKButton_Listen_Nick_OnClick() {
    snd := AHKSettings_Select_NickSound.value
    SoundPlay,%A_ScriptDir%\data\sounds\%snd%.wav
}

AHKButton_Listen_AntiCheat_OnClick() {
    snd := AHKSettings_Select_AntiCheatSound.value
    SoundPlay,%A_ScriptDir%\data\sounds\%snd%.wav
}

AHKButton_Listen_TipOff_OnClick() {
    snd := AHKSettings_Select_TipOffSound.value
    SoundPlay,%A_ScriptDir%\data\sounds\%snd%.wav
}