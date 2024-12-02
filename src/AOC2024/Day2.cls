Class AOC2024.Day2 Extends AOC2024.Base
{
    Method Part1() as %Numeric
    {
        set cnt = 0
        While ('..File.AtEnd){
            Set line = $TRANSLATE(..File.ReadLine(),$CHAR(13),"")
            //write line,!
            set len = $LENGTH(line," ")
            set i = 2
            set safe = 1
            set dir = 1
            if ($PIECE(line," ") < $PIECE(line," ",2)) { set dir = -1 }
            while ((i <= len) && safe) {
                set a = $PIECE(line," ",i-1)
                set b = $PIECE(line," ",i)
                set diff = a - b

                if ((diff * dir) < 0 ) { set safe = 0 }
                else {
                    if ($ZABS(diff) = 0 || ($ZABS(diff) > 3)) { set safe = 0 }
                }
                //write dir,*9,diff,!

                set i = i + 1
            }
            //write *9,*9,safe,!
            if (safe) { set cnt = cnt + 1 }
        }
        Return cnt
    }

    Method Part2() as %Numeric
    {
        set cnt = 0
        While ('..File.AtEnd){
            Set line = $TRANSLATE($TRANSLATE(..File.ReadLine(),$CHAR(13),"")," ","*")
            //write line,!
            set len = $LENGTH(line,"*")
            set i = 2
            set safe = 1
            set dir = 1
            set p = 1
            if ($PIECE(line,"*") < $PIECE(line,"*",2)) { set dir = -1 }
            while ((i <= len) && safe) {
                set a = $PIECE(line,"*",i-1)
                set b = $PIECE(line,"*",i)
                set diff = a - b

                if ((diff * dir) < 0 ) { set safe = 0 }
                else {
                    if ($ZABS(diff) = 0 || ($ZABS(diff) > 3)) { set safe = 0 }
                }
                //write dir,*9,diff,!

                set i = i + 1
            }
            //write *9,*9,safe,!
            set xlen = len - 1
            set p = 1
            while ((safe = 0) && (p <= len))
            {
                set safe = 1
                set nline = line
                set $PIECE(nline,"*",p) = ""
                if (p = 1) { set nline = $EXTRACT(nline,2,*) }
                set nline = $REPLACE(nline,"**","*")
                set i = 2
                set safe = 1
                set dir = 1
                if ($PIECE(nline,"*") < $PIECE(nline,"*",2)) { set dir = -1 }
                while ((i <= xlen) && safe) {
                    set a = $PIECE(nline,"*",i-1)
                    set b = $PIECE(nline,"*",i)
                    set diff = a - b

                    if ((diff * dir) < 0 ) { set safe = 0 }
                    else {
                        if ($ZABS(diff) = 0 || ($ZABS(diff) > 3)) { set safe = 0 }
                    }
                    //write dir,*9,diff,!

                    set i = i + 1
                }
                set p = p + 1
            }
            if (safe) { set cnt = cnt + 1 }
        }
        Return cnt
    }
}