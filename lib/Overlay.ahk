#NoEnv

#Include, %A_ScriptDir%/lib/overl.ahk
Init()
DestroyAllVisual()
SetParam("use_window", "1")
SetParam("window", "AMAZING ONLINE")

class Overlay {

    
    gen := -1

    
    overlay := Array()
    txt_type := ""

    
    overlay_type_main_down := Array()
    overlay_type_main_down.box_report := [0, 575, 265, 45]
    overlay_type_main_down.txt_ask := [7, 4, 577]
    overlay_type_main_down.txt_report := [7, 4, 588]
    overlay_type_main_down.box_second := [265, 575, 420, 45]
    overlay_type_main_down.txt_id := [7, 270, 588]
    overlay_type_main_down.txt_content := [7, 320, 588]
    overlay_type_main_down.box_tr_info := [685, 575, 120, 45]
    overlay_type_main_down.txt_report_count := [7, 690, 588]

    
    overlay_type_main_right := Array()
    overlay_type_main_right.box_report := [700, 185, 100, 95]
    overlay_type_main_right.txt_ask := [7, 705, 235]
    overlay_type_main_right.txt_report := [7, 705, 190]
    overlay_type_main_right.box_second := [700, 280, 100, 45]
    overlay_type_main_right.txt_id := [7, 705, 280]
    overlay_type_main_right.txt_content := [7, 705, 292]
    overlay_type_main_right.box_tr_info := [700, 325, 100, 20]
    overlay_type_main_right.txt_report_count := [7, 705, 325]


    __New(generator) {
        this.gen := generator
    }


    create() {

        type := -1
        if this.gen.visible <= 0
            Return


        if this.gen.position == 1 {
            type := this.overlay_type_main_down
            this.txt_type := "main_down"

            if this.gen.questions == true OR this.gen.report == true {
                this.overlay.box_report := BoxCreate(type.box_report[1], this.gen.questions == True ? type.box_report[2] : 585, type.box_report[3], this.gen.questions == True ? type.box_report[4] : 20, this.gen.back_color, true)
                
                if this.gen.type_access > 1
                    this.overlay.txt_report := TextCreate("Calibri", type.txt_report[1], true, false, type.txt_report[2], type.txt_report[3], this.gen.main_color, "Репорты:{" . this.gen.add_color . "}", true, this.gen.report)
                
                this.overlay.txt_ask := TextCreate("Calibri", type.txt_ask[1], true, false, type.txt_ask[2], type.txt_ask[3], this.gen.main_color, "Вопросы:{" . this.gen.add_color . "} ", true, this.gen.questions)
            }

            if this.gen.rep_state == true AND this.gen.type_access > 1 {
                this.overlay.box_state := BoxCreate(type.box_second[1], this.gen.questions == True ? type.box_second[2] : 585, this.gen.txt_report_count == True ? type.box_second[3] : 540, this.gen.questions == True ? type.box_second[4] : 20, this.gen.back_color, true)
                this.overlay.txt_id := TextCreate("Calibri", type.txt_id[1], true, false, type.txt_id[2], type.txt_id[3], this.gen.main_color, "ID репорта:{" . this.gen.add_color . "}", true, this.gen.rep_state)
                this.overlay.txt_content := TextCreate("Calibri", type.txt_content[1], true, false, type.txt_content[2], type.txt_content[3], this.gen.main_color, "Суть репорта:{" . this.gen.add_color . "}", true, this.gen.rep_state)
            }

            if this.gen.txt_report_count == true {

                this.overlay.box_time_report_info := BoxCreate(type.box_tr_info[1], this.gen.questions == True ? type.box_tr_info[2] : 585, type.box_tr_info[3], this.gen.questions == True ? type.box_tr_info[4] : 20, this.gen.back_color, true)
                this.overlay.txt_report_count := TextCreate("Calibri", type.txt_report_count[1], true, false, type.txt_report_count[2], type.txt_report_count[3], this.gen.main_color, "Количество репорта:{" . this.gen.add_color . "}", true, this.gen.txt_report_count)

            }


        }
        else {

            type := this.overlay_type_main_right
            this.txt_type := "main_right"

            if this.gen.questions == true OR this.gen.report == true {
                this.overlay.box_report := BoxCreate(type.box_report[1], type.box_report[2], type.box_report[3], type.box_report[4], this.gen.back_color, true)
                
                if this.gen.type_access > 1
                    this.overlay.txt_report := TextCreate("Calibri", type.txt_report[1], true, false, type.txt_report[2], type.txt_report[3], this.gen.main_color, "Неотвеченные репорты:{" . this.gen.add_color . "}`n", true, this.gen.report)
                
                this.overlay.txt_ask := TextCreate("Calibri", type.txt_ask[1], true, false, type.txt_ask[2], type.txt_ask[3], this.gen.main_color, "Неотвеченные вопросы:{" . this.gen.add_color . "}`n", true, this.gen.questions)
            }

            if this.gen.rep_state == true AND this.gen.type_access > 1 {
                this.overlay.box_state := BoxCreate(type.box_second[1], type.box_second[2], type.box_second[3], type.box_second[4], this.gen.back_color, true)
                this.overlay.txt_id := TextCreate("Calibri", type.txt_id[1], true, false, type.txt_id[2], type.txt_id[3], this.gen.main_color, "ID репорта:{" . this.gen.add_color . "}", true, this.gen.rep_state)
                this.overlay.txt_content := TextCreate("Calibri", type.txt_content[1], true, false, type.txt_content[2], type.txt_content[3], this.gen.main_color, "Суть репорта:{" . this.gen.add_color . "}", true, this.gen.rep_state)
            }

            if this.gen.txt_report_count == true {

                this.overlay.box_time_report_info := BoxCreate(type.box_tr_info[1], type.box_tr_info[2], type.box_tr_info[3], type.box_tr_info[4], this.gen.back_color, true)
                this.overlay.txt_report_count := TextCreate("Calibri", type.txt_report_count[1], true, false, type.txt_report_count[2], type.txt_report_count[3], this.gen.main_color, "Количество репорта:{" . this.gen.add_color . "}", true, this.gen.txt_report_count)

            }

        }

    }

    destroy() {
        DestroyAllVisual()
    }

    updateReport(report_array) {

        if this.gen.visible <= 0
            Return

        if this.gen.report == false
            return

        if (this.txt_type == "main_down") {
            
            text := "Репорты:{" . this.gen.add_color . "} "

            cont := 0
            MaxI := % report_array.MaxIndex()
            for index, element in report_array
            {
                if (index < MaxI)
                {
                    text := text . element[2] . ", "
                    cont += 1
                }
                if (index == MaxI)
                {
                    text := text . element[2]
                    cont += 1
                }
                
                if cont == 12
                    break
            }
            

            TextSetString(this.overlay.txt_report, text)

            return
        }

        text := "Неотвеченные репорты:{" . this.gen.add_color . "}`n"

        cont := 0
        line := 1
        el := 1
        maxEl := 7
        maxLines := 3
        for index, element in report_array {
            el += 1
            cont += 1
            If (line == maxLines)
                break
            If (cont >= 21)
                break
            If (el < maxEl)
                text := text . element[2] . ", " 
            If (el == maxEl) {
                el := 1
                line += 1
                text := text . element[2] . "`n"
            }
        }

        TextSetString(this.overlay.txt_report, text)

    }

    updateQuestions(questions_array) {

        if this.gen.visible <= 0
            Return

        if this.gen.questions == false
            return

        if (this.txt_type == "main_down") {
            
            text := "Вопросы:{" . this.gen.add_color . "} "

            cont := 0
            MaxI := % questions_array.MaxIndex()
            for index, element in questions_array
            {
                if (index < MaxI)
                {
                    text := text . element[2] . ", "
                    cont += 1
                }
                if (index == MaxI)
                {
                    text := text . element[2]
                    cont += 1
                }
                
                if cont == 12
                    break
            }
            

            TextSetString(this.overlay.txt_ask, text)

            return
        }

        text := "Неотвеченные вопросы:{" . this.gen.add_color . "}`n"

        cont := 0
        line := 1
        el := 1
        maxEl := 7
        maxLines := 3
        for index, element in report_array {
            el += 1
            cont += 1
            If (line == maxLines)
                break
            If (cont >= 21)
                break
            If (el < maxEl)
                text := text . element[2] . ", " 
            If (el == maxEl) {
                el := 1
                line += 1
                text := text . element[2] . "`n"
            }
        }

        TextSetString(this.overlay.txt_ask, text)

    }

    setRepContent(content) {

        
        if this.gen.visible <= 0
            Return

        if this.gen.rep_state == false
            return


        if (this.txt_type == "main_down") {
            parsed1 := SubStr(content, 1, 50)
            txt := "Суть репорта:{" . this.gen.add_color . "} " . parsed1
            TextSetString(this.overlay.txt_content, txt)
            return
        }

        parsed1 := SubStr(content, 1, 12)
        parsed2 := SubStr(content, 13, 36)
        parsed3 := SubStr(content, 36, 54)
        text := "Суть репорта:{" . this.gen.add_color . "} " . parsed1
        If (StrLen(parsed2) > 0)
            text := text . "-`n" . parsed2
        If (StrLen(parsed3) > 0)
            text := text . "-`n" . parsed3

        TextSetString(this.overlay.txt_content, text)

    }

    setRepID(content) {

        if this.gen.visible <= 0
            Return

        if this.gen.rep_state == false
            return

        txt := "ID репорта:{" . this.gen.add_color . "} " . content
        TextSetString(this.overlay.txt_id, txt) 
    
    }

    setRepCount(count) {

        if this.gen.visible <= 0
            Return

        if this.gen.txt_report_count == false
            return

        TextSetString(this.overlay.txt_report_count, "Количество репорта:{" . this.gen.add_color . "} " . count)

    }

}