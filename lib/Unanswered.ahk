#NoEnv

class ComplaintMonitor
{

    Show() {

        For index, element in REPORT_MAIN_ARRAY {
            IEMonitor.document.parentWindow.execScript("addElementToReport(" . element[2] . ", '" . element[3] "', '" . element[5] . "','" . element[4] . "')")
        }
		For index, element in QUESTION_MAIN_ARRAY {
            IEMonitor.document.parentWindow.execScript("addElementToAsk(" . element[2] . ", '" . element[3] "', '" . element[5] . "','" . element[4] . "')")
        }

		try{
        ComObjConnect(AHKMonitorButtonClose, "AHKMonitorButtonClose_")
        ComObjConnect(AHKMonitorButtonCancel, "AHKMonitorButtonCancel_")
        ComObjConnect(AHKButton_DeleteRep, "AHKButton_DeleteRep_") 
        ComObjConnect(AHKButton_DeleteAllRep, "AHKButton_DeleteAllRep_") 
        ComObjConnect(AHKButton_DeleteAsk, "AHKButton_DeleteAsk_") 
        ComObjConnect(AHKButton_DeleteAllAsk, "AHKButton_DeleteAllAsk_")
		}
		Catch, e {
			log.error(e.message . " " . e.line . " " . e.what)
            ComObjConnect(AHKMonitorButtonClose, "AHKMonitorButtonClose_")
			ComObjConnect(AHKMonitorButtonCancel, "AHKMonitorButtonCancel_")
			ComObjConnect(AHKButton_DeleteRep, "AHKButton_DeleteRep_") 
			ComObjConnect(AHKButton_DeleteAllRep, "AHKButton_DeleteAllRep_") 
			ComObjConnect(AHKButton_DeleteAsk, "AHKButton_DeleteAsk_") 
			ComObjConnect(AHKButton_DeleteAllAsk, "AHKButton_DeleteAllAsk_")
            Return
		}
        Gui, UnansweredReport:Show, w1180 h900 x0 y0, % "Themis - Монитор неотвеченных запросов"
    }

}

UpdateUnansweredReportMonitor(ReportArray, QuestionsArray) 
{

	try{

		IEMonitor.document.parentWindow.execScript("clearReport()")
		IEMonitor.document.parentWindow.execScript("clearAsk()")

		For index, element in ReportArray {
			IEMonitor.document.parentWindow.execScript("addElementToReport(" . element[2] . ", '" . element[3] "', '" . element[5] . "','" . element[4] . "')")
		}
		For index, element in QuestionsArray {
			IEMonitor.document.parentWindow.execScript("addElementToAsk(" . element[2] . ", '" . element[3] "', '" . element[5] . "','" . element[4] . "')")
		}
    
	}
	Catch, e {
		log.error(e.message . " " . e.line . " " . e.what)
		Menu, Tray, Disable, Монитор неотвеченных запросов
		Return
	}
}

AHKMonitorButtonClose_OnClick() {
	ExitApp
}

AHKMonitorButtonCancel_OnClick() {
	Gui, UnansweredReport:Hide
}

AHKButton_DeleteAllRep_OnClick() {
	IEMonitor.document.parentWindow.execScript("allCheckReport()")
	AHKButton_DeleteRep_OnClick()
}

AHKButton_DeleteAllAsk_OnClick() {
	IEMonitor.document.parentWindow.execScript("allCheckAsk()")
}

AHKButton_DeleteRep_OnClick() {	
	inputs := IEMonitor.document.getElementById("table_rep").getElementsByTagName("tbody")[0].querySelectorAll("input:checked")
	IEMonitor.document.parentWindow.execScript("document.getElementById('table_rep').getElementsByTagName('thead')[0].getElementsByTagName('input')[0].checked = false;")
	if inputs.Length == 0 {
		IEMonitor.document.parentWindow.execScript("showAlert.info('Выберите хотя бы один элемент для удаления')")
		Return
	}

	Loop, % inputs.length {
		rep_id := inputs[A_Index - 1].id
		rep_id := StrSplit(rep_id, "ID")[2]
		REPORT_MAIN_ARRAY.Delete(rep_id)
	}

	IEMonitor.document.parentWindow.execScript("clearReport()")

	For index, element in REPORT_MAIN_ARRAY {
		IEMonitor.document.parentWindow.execScript("addElementToReport(" . element[2] . ", '" . element[3] "', '" . element[5] . "','" . element[4] . "')")
	}
}

AHKButton_DeleteAsk_OnClick() {	
	inputs := IEMonitor.document.getElementById("table_ask").getElementsByTagName("tbody")[0].querySelectorAll("input:checked")
	IEMonitor.document.parentWindow.execScript("document.getElementById('table_ask').getElementsByTagName('thead')[0].getElementsByTagName('input')[0].checked = false;")
	if inputs.Length == 0 {
		IEMonitor.document.parentWindow.execScript("showAlert.info('Выберите хотя бы один элемент для удаления')")
		Return
	}

	Loop, % inputs.length {
		rep_id := inputs[A_Index - 1].id
		rep_id := StrSplit(rep_id, "ID")[2]
		REPORT_MAIN_ARRAY.Delete(rep_id)
	}

	IEMonitor.document.parentWindow.execScript("clearAsk()")
	For index, element in REPORT_MAIN_ARRAY {
		IEMonitor.document.parentWindow.execScript("addElementToReport(" . element[2] . ", '" . element[3] "', '" . element[5] . "','" . element[4] . "')")
	}

    Overlay.updateQuestions(QUESTION_MAIN_ARRAY)
	Return
}