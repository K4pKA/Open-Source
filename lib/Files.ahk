#NoEnv

class FileSystem 
{

    PassGen(PassLen)
    {
        alph = ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890
        len := StrLen(alph) 
        x0 := A_TickCount
        a := 12345
        c := 54321
        m := 2**32
        Pass =
        loop %PassLen%
        {
            x0 := Mod(a*x0+c,m)
            Pass .= SubStr(alph, mod(x0, len), 1)
        }
        return Pass
    }

    checkFileSystem() {

        IfNotExist, %A_MyDocuments%\Themis\ans
        {
            FileCreateDir, %A_MyDocuments%\Themis\ans
        }
        IfNotExist, %A_MyDocuments%\Themis\ans\REPORT.txt
        {   
            FileEncoding, UTF-8
            FileAppend,Здравствуйте. Начинаю работу по запросу`n, %A_MyDocuments%\Themis\ans\REPORT.txt
        }
        IfNotExist, %A_MyDocuments%\Themis\ans\NICEGAME.txt
        {
            FileEncoding, UTF-8
            FileAppend, Приятной игры на сервере!`n, %A_MyDocuments%\Themis\ans\NICEGAME.txt
        }
        IfNotExist, %A_MyDocuments%\Themis\ans\NOVIOLAT.txt
        {
            FileEncoding, UTF-8
            FileAppend, Нарушений в данный момент нет`n, %A_MyDocuments%\Themis\ans\NOVIOLAT.txt
        }
        IfNotExist,%A_MyDocuments%\Themis\ans\PUNISH.txt
        {
            FileEncoding, UTF-8
            FileAppend, Игрок был наказан`n, %A_MyDocuments%\Themis\ans\PUNISH.txt
        }
        IfNotExist,%A_MyDocuments%\Themis\ans\FIRST.txt
        {
            FileEncoding, UTF-8
            FileAppend, Так держать!`n, %A_MyDocuments%\Themis\ans\FIRST.txt
        }
    
        IfNotExist, %A_MyDocuments%\Themis
        {
            FileCreateDir, %A_MyDocuments%\Themis
        }
        IfNotExist, %A_MyDocuments%\Themis\chatlogs
        { 
            FileCreateDir, %A_MyDocuments%\Themis\chatlogs
        }
        TODAY := A_DD . "." . A_MM . "." . A_YYYY

        IfNotExist, %A_MyDocuments%\Themis\Complains
        { 
            FileCreateDir, %A_MyDocuments%\Themis\Complains
        }

        IfNotExist, %A_MyDocuments%\Themis\Hotstrings
        { 
            FileCreateDir, %A_MyDocuments%\Themis\Hotstrings
        }

        IfNotExist, %A_MyDocuments%\Themis\Hotstrings\Hotstrings.txt
        { 
            FileEncoding
            FileAppend,, %A_MyDocuments%\Themis\Hotstrings\Hotstrings.txt
        }

        IfNotExist, %A_MyDocuments%\Themis\chatlogs\%TODAY%
        {
            FileCreateDir, %A_MyDocuments%\Themis\chatlogs\%TODAY%
        }
    }

}
