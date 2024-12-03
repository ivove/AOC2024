Class AOC2024.Day3 Extends AOC2024.Base
{
    Method Part1() as %Numeric
    {
        set result = 0
        While ('..File.AtEnd){
            Set line = $TRANSLATE(..File.ReadLine(),$CHAR(13),"")
            //set line="xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
            while (line [ "mul(") {
                //write $EXTRACT(line,1,50),!
                set part = $PIECE(line,"mul(",2)
                set part = $PIECE(part,")")
                //write part,!
                if part ?1.3N1","1.3N {
                    set a = $PIECE(part,",")
                    set b = $PIECE(part,",",2)
                    set result = result + (a * b)
                    set part = "mul("_part_")"
                } else { set part = "mul(" }
                set start = $FIND(line,part)
                set line = $EXTRACT(line,start,*)
            }
        }
        Return result
    }

    Method Part2() as %Numeric
    {
        set result = 0
        set add = 1
        set cnt = 1
        While ('..File.AtEnd){
            Set line = $TRANSLATE(..File.ReadLine(),$CHAR(13),"")
            write line,!
            set len = $LENGTH(line)
            for i=1:1:len {
                //write $EXTRACT(line,i,*),!
                set c = $EXTRACT(line,i)
                //write *9,c,*9,$EXTRACT(line,i,i+3),!
                if c = "m" {
                    if ($EXTRACT(line,i,i+3) = "mul(") {
                        set part = $PIECE($PIECE($EXTRACT(line,i,*),"(",2),")")
                            //write *9,part,!
                        if (part ?1.3N1","1.3N){
                            set part = "mul("_part_")"
                            //write *9,part,!
                            set rep = $get(rep)+1
                            set rep(rep)=part
                        }                        
                    }
                }
                elseif c = "d" {
                    if ($EXTRACT(line,i,i+3) = "do()") { 
                        set add = 1 
                        set rep = $get(rep)+1
                        set rep(rep)="do"
                    }
                    if ($EXTRACT(line,i,i+6) = "don't()") { 
                        set add = 0 
                        set rep = $get(rep)+1
                        set rep(rep)="dont"
                    }
                }
            }
        }
        set result = 0
        set add = 1
        for i=1:1:rep {
            if rep(i)="do" {set add = 1 }
            elseif rep(i) = "dont" { set add = 0 }
            else {
                if add {
                    set a = $TRANSLATE($PIECE(rep(i),","),"mul()","")
                    set b = $TRANSLATE($PIECE(rep(i),",",2),"mul()","")
                    set result = result + (a*b)
                }
            }
            //w rep(i),*9,result,!
        }
        Return result
    }
}