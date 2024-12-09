Class AOC2024.Day9 Extends AOC2024.Base
{
    Method Part1() as %Numeric
    {
        While ('..File.AtEnd){
            set result = 0
            Set line = $TRANSLATE(..File.ReadLine(),$CHAR(13),"")
            set len = $LENGTH(line)
            set pos = 0
            set on = 1
            set id = 0
            for i=1:1:len {
                set c = $EXTRACT(line,i)
                if on { 
                    set fill = id 
                    set id = id + 1
                    set on = 0
                } else {
                    set fill = "."
                    set on = 1
                }
                for y=1:1:c {
                    set disk(pos) = fill
                    set pos = pos + 1
                }
            }
        }
        set pos = pos - 1
        set epos  = 0
        while epos < pos {
            if $GET(disk(pos)) '= "." {
                while $GET(disk(epos)) '= "." {
                    set epos = epos + 1
                }
                set disk(epos) = $GET(disk(pos))
                kill disk(pos)
            }
            set pos = pos - 1
        }
        //zw disk

        set x = $ORDER(disk(""),1,val)
        set cnt = 0
        while x '= "" {
            if disk(x) '= "." {
                set result = result + (cnt * val)
                //write x,*9,val,*9,x*val,"=",result,!
                set cnt = cnt + 1
            }
            set x = $ORDER(disk(x),1,val)
        }

        return result
    }

    Method Part2() as %Numeric
    {
        While ('..TestFile.AtEnd){
            set result = 0
            Set line = $TRANSLATE(..TestFile.ReadLine(),$CHAR(13),"")
            set len = $LENGTH(line)
            set pos = 0
            set on = 1
            set id = 0
            for i=1:1:len {
                set c = $EXTRACT(line,i)
                if on { 
                    set fill = id 
                    set id = id + 1
                    set on = 0
                    set idxf(id) = $LISTBUILD(c,pos)
                } else {
                    set fill = "."
                    set on = 1
                    set idxe(c,pos) = ""
                }
                for y=1:1:c {
                    set disk(pos) = fill
                    set pos = pos + 1
                }
            }
        }

        set id = $ORDER(idxf(""),-1,val)
        while id '= "" {
            if $DATA(idxe($LIST(val,1))) {
                set pos = $ORDER(idxe($LIST(val,1)),"")
                set $LIST(idxf(id),2) = pos
                kill idxe($LIST(val,1),pos)
            }
            set id = $ORDER(idxf(id),-1,val)
        }

        
    }
}