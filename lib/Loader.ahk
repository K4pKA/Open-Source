#NoEnv

#Include %A_ScriptDir%\lib\Files.ahk

global IESettings := "", global AHKButtonClose := "", global AHKButtonCancel := "", global AHKButtonSave := "", global AHKButtonApply := "", global AHKSettings_LicenseKey := "", global AHKSettings_DateOfEnd := "", global AHKSettings_CurrentVersion := "", global AHKSettings_PreviousVersion := ""  ,global AHKSettings_AmazingServer := "", global AHKSettings_GamePath := "", global AHKButtonGamePath := "", global AHKSettings_Nickname := "", global AHKSettings_CheckBox_SoundNewReport := "", global AHKSettings_Select_ReportSound := "", global AHKButton_Listen_Report := "" , global AHKSettings_CheckBox_SoundNewAsk := "", global AHKSettings_Select_AskSound := "", global AHKButton_Listen_Ask := "", global AHKSettings_CheckBox_SoundKill := "", global AHKSettings_Select_KillSound := "", global AHKButton_Listen_Kill := "" , global AHKSettings_CheckBox_SoundCAPS := "", global AHKSettings_Select_CAPSSound := "", global AHKButton_Listen_CAPS := "" , global AHKSettings_CheckBox_SoundNick := "", global AHKSettings_Select_NickSound := "", global AHKButton_Listen_Nick := "" , global AHKSettings_CheckBox_SoundAntiCheat := "", global AHKSettings_Select_AntiCheatSound := "", global AHKButton_Listen_AntiCheat := "", global AHKSettings_CheckBox_SoundTipOff := "", global AHKSettings_Select_TipOffSound := "", global AHKButton_Listen_TipOff := "" , global AHKSettings_CheckBox_NotifyKill := "", global AHKSettings_CheckBox_NotifyCAPS := "", global AHKSettings_CheckBox_NotifyNick := "", global AHKSettings_CheckBox_NotifyAntiCheat := "", global AHKSettings_CheckBox_NotifyFirstAns := "", global AHKSettings_CheckBox_NotifyTipOff := "", global AHKSettings_CheckBox_WidgetReport := "", global AHKSettings_CheckBox_WidgetAsk := "", global AHKSettings_CheckBox_WidgetWorkRep := "" , global AHKSettings_CheckBox_WidgetContRep := "", global AHKSettings_CheckBox_WidgetTime := "", global AHKSettings_Select_IntefracePosition := "" , global AHKSettings_Input_HotkeyCurrentReport := "", global AHKSettings_Input_HotkeyPrevReport := "", global AHKSettings_Input_HotkeyNiceGame := "" , global AHKSettings_Input_HotkeyNoViolat := "", global AHKSettings_Input_HotkeyPunish := "", global AHKSettings_Input_AnsIDCurrent := "" , global AHKSettings_Input_AnsIDPrev := "", global AHKSettings_Input_HotkeyKill := "", global AHKSettings_Input_HotkeyCAPS := "" , global AHKSettings_Input_HotkeyCheat := "", global AHKSettings_Input_HotkeyNick := "", global AHKSettings_Input_HotkeyTipOff := "" , global AHKMonitorButtonClose := "", global AHKMonitorButtonCancel := "", global AHKButton_DeleteAllRep := "" ,  global AHKButton_DeleteAsk := "" ,  global  AHKButton_DeleteAllAsk := "" ,  global  AHKButton_DeleteRep := "" ,  global  AHKSettings_CheckBox_SearchQuestions := "" ,  global  AHKSettings_CheckBox_SearchReport := "" ,  global  AHKSettings_CheckBox_AutoReport := "" ,  global  AHKSettings_CheckBox_SearchCAPS := "" ,  global  AHKSettings_CheckBox_SearchKill := "" ,  global  AHKSettings_CheckBox_SearchAC := "" ,  global  AHKSettings_CheckBox_SearchNrpNick := "" ,  global  AHKSettings_CheckBox_AutoReportSpec := "" ,  global  AHKSettings_CheckBox_ACSend := "" ,  global  AHKSettings_CheckBox_5min := "" ,  global  AHKSettings_Input_MaxRsp := "" ,  global  AHKSettings_Input_HotkeyGetpcar := "" ,  global  AHKSettings_Input_HotkeySlap := "" ,  global  AHKSettings_Input_HotkeyGruz := "" ,  global  AHKSettings_Input_HotkeyFlip := "" ,  global  AHKSettings_CheckBox_EnableInterface := "" ,  global  AHKSettings_CheckBox_WidgetReport := "" ,  global  AHKSettings_CheckBox_WidgetAsk := "" ,  global  AHKSettings_Input_MainColor := "" ,  global  AHKSettings_Input_SecondColor := "" ,  global  AHKSettings_Input_BackColor := "" ,  global  AHKSettings_Select_IntefracePosition := "" ,  global  AHKSettings_Input_RepSpec := "" ,  global  AHKSettings_Input_SpRandom := "" ,  global  AHKSettings_CheckBox_WidgetInfoRep := "" ,  global  SettingsGamePath := "" ,  global  SettingsServer := "" ,  global  SettingsNickname := "" ,  global  SettingsSearchReport := "" ,  global  SettingsSearchQuestions := "" ,  global  SettingsSearchCAPS := "" ,  global  SettingsSearchKill := "" ,  global  SettingsSearchNrpNick := "" ,  global  SettingsSearchAC := "" ,  global  SettingsMaxSP := "" ,  global  SettingsAutoSpec := "" ,  global  SettingsAutoReport := "" ,  global  SettingEnableInterface := "" ,  global  SettingPositionInterface := "" ,  global  SettingWidgetReport := "" ,  global  SettingWidgetQuestions := "" ,  global  SettingWidgetInfoReport := "" ,  global  SettingWidgetReportCount := "" ,  global  SettingMainColor := "" ,  global  SettingSecondColor := "" ,  global  SettingBackColor := "" ,  global  SettingsSndNotifyReport := "" ,  global  SettingsSndNotifyQuestion := "" ,  global  SettingsSndNotifyKill := "" ,  global  SettingsSndNotifyCAPS := "" ,  global  SettingsSndNotifyNick := "" ,  global  SettingsSndNotifyAC := "" ,  global  SettingsSndNotifyTO := "" ,  global  SettingsSoundReport := "" ,  global  SettingsSoundQuestion := "" ,  global  SettingsSoundCAPS := "" ,  global  SettingsSoundCAPS := "" ,  global  SettingsSoundKill := "" ,  global  SettingsSoundAC := "" ,  global  SettingsSoundTipOff := "" ,  global  SettingsSoundNrpNick := "" ,  global  SettingsNoticeKill := "" ,  global  SettingsNoticeCAPS := "" ,  global  SettingsNoticeNick := "" ,  global  SettingsNoticeAC := "" ,  global  SettingsNoticeFirst := "" ,  global  SettingsNoticeTipOff := "" ,  global  Settings5min := "" ,  global  SettingsAcKillInChat := "" ,  global  SettingsHotkeyLastReport := "" ,  global  SettingsHotkeyPrevReport := "" ,  global  SettingsHotkeyNiceGame := "" ,  global  SettingsHotkeyNoViolat := "" ,  global  SettingsHotkeyPunish := "" ,  global  SettingsHotkeyAnsID := "" ,  global  SettingsHotkeyPrevAnsID := "" ,  global  SettingsHotkeyKill := "" ,  global  SettingsHotkeyCAPS := "" ,  global  SettingsHotkeyNick := "" ,  global  SettingsHotkeyAC := "" ,  global  SettingsHotkeyTipOff := "" ,  global  SettingHotkeyGetpcar := "" ,  global  SettingHotkeySlap := "" ,  global  SettingHotkeyFlip := "" ,  global  SettingHotkeyGruz := "" ,  global  SettingHotkeyGoToSpec := "" ,  global  SettingHotkeyRsp := "" ,  global  MonitorType := 1 ,  global  LVRep := "", global LVAsk := "", global JB := "", global IEMonitor := "" ,  global  index := 0, global element := "" ,  global  SettingsInfoCommands := ""  ,  global  IELoader := "" ,  global  IEInpBox := "" ,  global  IEInputBox_Nickname := "" ,  global  IE := "" ,  global  BlockStart := 0 ,  global  MonitorType := 1 ,  global  LVRep := "", global LVAsk := "", global JB := "" ,  global  IEMonitor := "" ,  global  index := 0, global element := "" ,  global  IEHotstring := "" ,  global  AHK_Hotstring_Content := "" ,  global  AHK_Hotstring_Command := "" ,  global  AHK_Hotstring_Check :=  "" ,  global  AHKHotstringButtonOpenFile := "" ,  global  AHKHotstringButtonClose := "" ,  global  AHKHotstringsButtonCancel := "" ,  global  AHKHotstringButtonSave := ""

class Loader {


    __New() {

        Gui, Loader:New, -Caption +AlwaysOnTop -SysMenu
        Gui, Loader:Add, ActiveX, x0 y0 w480 h480 hwndIEhwnd vIELoader, Shell.Explorer
		Gui, Loader: +LastFound
		WinSet, Region, 1-1 w480 h480 R45-45
        IELoader.Navigate(A_ScriptDir . "\lib\html\loader.html")

        IESettings.silent := true
        while IESettings.busy
            sleep 50

        sleep 500

        Status_Loader := IELoader.document.GetElementById["Status_Loader"]
        Info_Loader := IELoader.document.GetElementById["Info_Loader"]

        Gui, Loader:Show, w480 h480, % "Themis"

        Status_Loader.innerText := "Инициализация"
        Info_Loader.innerText := "Проверка целостности файлов"

        FileSystem.checkFileSystem()

        Status_Loader.innerText := "Инициализация интерфейсов"
        Info_Loader.innerText := "Инициализация настроек"

        
        Gui, Settings:New, -Caption
        Gui, Settings:Add, ActiveX, x0 y0 w1080 h750 hwndIEhwnd vIESettings, Shell.Explorer

        IESettings.Navigate(A_ScriptDir . "\lib\html\settings_script_debug.html")

        IESettings.silent := true
        while IESettings.busy
            sleep 50

        sleep 1500

        AHKButtonClose := IESettings.document.GetElementById["AHKButtonClose"]
        AHKButtonCancel := IESettings.document.GetElementById["AHKButtonCancel"]
        AHKButtonSave := IESettings.document.GetElementById["AHKButtonSave"]
        AHKButtonApply := IESettings.document.GetElementById["AHKButtonApply"]

        AHKSettings_LicenseKey := IESettings.document.GetElementById["AHKSettings_LicenseKey"]
        AHKSettings_DateOfEnd := IESettings.document.GetElementById["AHKSettings_DateOfEnd"]
        AHKSettings_CurrentVersion := IESettings.document.GetElementById["AHKSettings_CurrentVersion"]
        AHKSettings_PreviousVersion := IESettings.document.GetElementById["AHKSettings_PreviousVersion"]

        AHKSettings_AmazingServer := IESettings.document.GetElementById["AHKSettings_AmazingServer"]
        AHKSettings_GamePath := IESettings.document.GetElementById["AHKSettings_GamePath"]
        AHKButtonGamePath := IESettings.document.GetElementById["AHKButtonGamePath"]
        AHKSettings_Nickname := IESettings.document.GetElementById["AHKSettings_Nickname"]

        AHKSettings_CheckBox_SoundNewReport := IESettings.document.GetElementById["AHKSettings_CheckBox_SoundNewReport"]
        AHKSettings_Select_ReportSound := IESettings.document.GetElementById["AHKSettings_Select_ReportSound"]
        AHKButton_Listen_Report := IESettings.document.GetElementById["AHKButton_Listen_Report"]

        AHKSettings_CheckBox_SoundNewAsk := IESettings.document.GetElementById["AHKSettings_CheckBox_SoundNewAsk"]
        AHKSettings_Select_AskSound := IESettings.document.GetElementById["AHKSettings_Select_AskSound"]
        AHKButton_Listen_Ask := IESettings.document.GetElementById["AHKButton_Listen_Ask"]

        AHKSettings_CheckBox_SoundKill := IESettings.document.GetElementById["AHKSettings_CheckBox_SoundKill"]
        AHKSettings_Select_KillSound := IESettings.document.GetElementById["AHKSettings_Select_KillSound"]
        AHKButton_Listen_Kill := IESettings.document.GetElementById["AHKButton_Listen_Kill"]

        AHKSettings_CheckBox_SoundCAPS := IESettings.document.GetElementById["AHKSettings_CheckBox_SoundCAPS"]
        AHKSettings_Select_CAPSSound := IESettings.document.GetElementById["AHKSettings_Select_CAPSSound"]
        AHKButton_Listen_CAPS := IESettings.document.GetElementById["AHKButton_Listen_CAPS"]

        AHKSettings_CheckBox_SoundNick := IESettings.document.GetElementById["AHKSettings_CheckBox_SoundNick"]
        AHKSettings_Select_NickSound := IESettings.document.GetElementById["AHKSettings_Select_NickSound"]
        AHKButton_Listen_Nick := IESettings.document.GetElementById["AHKButton_Listen_Nick"]

        AHKSettings_CheckBox_SoundAntiCheat := IESettings.document.GetElementById["AHKSettings_CheckBox_SoundAntiCheat"]
        AHKSettings_Select_AntiCheatSound := IESettings.document.GetElementById["AHKSettings_Select_AntiCheatSound"]
        AHKButton_Listen_AntiCheat := IESettings.document.GetElementById["AHKButton_Listen_AntiCheat"]

        AHKSettings_CheckBox_SoundTipOff := IESettings.document.GetElementById["AHKSettings_CheckBox_SoundTipOff"]
        AHKSettings_Select_TipOffSound := IESettings.document.GetElementById["AHKSettings_Select_TipOffSound"]
        AHKButton_Listen_TipOff := IESettings.document.GetElementById["AHKButton_Listen_TipOff"]

        AHKSettings_CheckBox_NotifyKill := IESettings.document.GetElementById["AHKSettings_CheckBox_NotifyKill"]
        AHKSettings_CheckBox_NotifyCAPS := IESettings.document.GetElementById["AHKSettings_CheckBox_NotifyCAPS"]
        AHKSettings_CheckBox_NotifyNick := IESettings.document.GetElementById["AHKSettings_CheckBox_NotifyNick"]
        AHKSettings_CheckBox_NotifyAntiCheat := IESettings.document.GetElementById["AHKSettings_CheckBox_NotifyAntiCheat"]
        AHKSettings_CheckBox_NotifyFirstAns := IESettings.document.GetElementById["AHKSettings_CheckBox_NotifyFirstAns"]
        AHKSettings_CheckBox_NotifyTipOff := IESettings.document.GetElementById["AHKSettings_CheckBox_NotifyTipOff"]

        AHKSettings_Input_HotkeyCurrentReport := IESettings.document.GetElementById["AHKSettings_Input_HotkeyCurrentReport"]
        AHKSettings_Input_HotkeyPrevReport := IESettings.document.GetElementById["AHKSettings_Input_HotkeyPrevReport"]
        AHKSettings_Input_HotkeyNiceGame := IESettings.document.GetElementById["AHKSettings_Input_HotkeyNiceGame"]
        AHKSettings_Input_HotkeyNoViolat := IESettings.document.GetElementById["AHKSettings_Input_HotkeyNoViolat"]
        AHKSettings_Input_HotkeyPunish := IESettings.document.GetElementById["AHKSettings_Input_HotkeyPunish"]
        AHKSettings_Input_AnsIDCurrent := IESettings.document.GetElementById["AHKSettings_Input_AnsIDCurrent"]
        AHKSettings_Input_AnsIDPrev := IESettings.document.GetElementById["AHKSettings_Input_AnsIDPrev"]
        AHKSettings_Input_HotkeyKill := IESettings.document.GetElementById["AHKSettings_Input_HotkeyKill"]
        AHKSettings_Input_HotkeyCAPS := IESettings.document.GetElementById["AHKSettings_Input_HotkeyCAPS"]
        AHKSettings_Input_HotkeyCheat := IESettings.document.GetElementById["AHKSettings_Input_HotkeyCheat"]
        AHKSettings_Input_HotkeyNick := IESettings.document.GetElementById["AHKSettings_Input_HotkeyNick"]
        AHKSettings_Input_HotkeyTipOff := IESettings.document.GetElementById["AHKSettings_Input_HotkeyTipOff"]

        AHKSettings_CheckBox_SearchQuestions := IESettings.document.GetElementById["AHKSettings_CheckBox_SearchQuestions"]
        AHKSettings_CheckBox_SearchReport := IESettings.document.GetElementById["AHKSettings_CheckBox_SearchReport"]
        AHKSettings_CheckBox_AutoReport := IESettings.document.GetElementById["AHKSettings_CheckBox_AutoReport"]
        AHKSettings_CheckBox_SearchCAPS := IESettings.document.GetElementById["AHKSettings_CheckBox_SearchCAPS"]
        AHKSettings_CheckBox_SearchKill := IESettings.document.GetElementById["AHKSettings_CheckBox_SearchKill"]
        AHKSettings_CheckBox_SearchAC := IESettings.document.GetElementById["AHKSettings_CheckBox_SearchAC"]
        AHKSettings_CheckBox_SearchNrpNick := IESettings.document.GetElementById["AHKSettings_CheckBox_SearchNrpNick"]
        AHKSettings_CheckBox_AutoReportSpec := IESettings.document.GetElementById["AHKSettings_CheckBox_AutoReportSpec"]
        AHKSettings_CheckBox_ACSend := IESettings.document.GetElementById["AHKSettings_CheckBox_ACSend"]
        AHKSettings_CheckBox_5min := IESettings.document.GetElementById["AHKSettings_CheckBox_5min"]
        AHKSettings_Input_MaxRsp := IESettings.document.GetElementById["AHKSettings_Input_MaxRsp"]
        AHKSettings_Input_HotkeyGetpcar := IESettings.document.GetElementById["AHKSettings_Input_HotkeyGetpcar"]
        AHKSettings_Input_HotkeySlap := IESettings.document.GetElementById["AHKSettings_Input_HotkeySlap"]
        AHKSettings_Input_HotkeyGruz := IESettings.document.GetElementById["AHKSettings_Input_HotkeyGruz"]
        AHKSettings_Input_HotkeyFlip := IESettings.document.GetElementById["AHKSettings_Input_HotkeyFlip"]

        AHKSettings_CheckBox_EnableInterface := IESettings.document.GetElementById["AHKSettings_CheckBox_EnableInterface"]
        AHKSettings_CheckBox_WidgetReport := IESettings.document.GetElementById["AHKSettings_CheckBox_WidgetReport"]
        AHKSettings_CheckBox_WidgetAsk := IESettings.document.GetElementById["AHKSettings_CheckBox_WidgetAsk"]
        AHKSettings_CheckBox_WidgetContRep := IESettings.document.GetElementById["AHKSettings_CheckBox_WidgetContRep"]
        AHKSettings_Input_MainColor := IESettings.document.GetElementById["AHKSettings_Input_MainColor"]
        AHKSettings_Input_SecondColor := IESettings.document.GetElementById["AHKSettings_Input_SecondColor"]
        AHKSettings_Input_BackColor := IESettings.document.GetElementById["AHKSettings_Input_BackColor"]
        AHKSettings_Select_IntefracePosition := IESettings.document.GetElementById["AHKSettings_Select_IntefracePosition"]
        AHKSettings_Input_RepSpec := IESettings.document.GetElementById["AHKSettings_Input_RepSpec"]
        AHKSettings_Input_SpRandom := IESettings.document.GetElementById["AHKSettings_Input_SpRandom"]
        AHKSettings_CheckBox_WidgetInfoRep := IESettings.document.GetElementById["AHKSettings_CheckBox_WidgetInfoRep"]

        Status_Loader.innerText := "Инициализация интерфейсов"
        Info_Loader.innerText := "Инициализация монитора неотвеченных запросов"

        sleep 500

        Gui, UnansweredReport:New, -SysMenu +HwndMonitor
        Gui, UnansweredReport:Add, ActiveX, x0 y0 w1180 h900 hwndIEhwnd vIEMonitor , Shell.Explorer
        IEMonitor.Navigate(A_ScriptDir . "\lib\html\complaint_monitor.html")
        IEMonitor.silent := true
        
        while IEMonitor.readystate != 4 or IEMonitor.busy
            sleep 50
        
        Gui, UnansweredReport:Show, w1180 h900 y-1080, % "Themis - Монитор неотвеченных запросов"
        Gui, UnansweredReport:Hide
        
        sleep 500
        
        AHKMonitorButtonClose := IEMonitor.document.getElementById("AHKMonitorButtonClose")
        AHKMonitorButtonCancel := IEMonitor.document.getElementById("AHKMonitorButtonCancel")
        AHKButton_DeleteAllRep := IEMonitor.document.getElementById("AHKButton_DeleteAllRep")
        AHKButton_DeleteAsk := IEMonitor.document.getElementById("AHKButton_DeleteAsk")
        AHKButton_DeleteAllAsk := IEMonitor.document.getElementById("AHKButton_DeleteAllAsk")
        AHKButton_DeleteRep := IEMonitor.document.getElementById("AHKButton_DeleteRep")

        Status_Loader.innerText := "Загрузка завершена"
        Info_Loader.innerText := "Запуск программы"

        sleep 500

        Gui, Loader:Destroy

    }



}