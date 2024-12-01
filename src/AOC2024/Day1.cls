Class AOC2024.Day1 Extends AOC2024.Base
{
    /// 
    Method Part1() As %Numeric
    {
        Set count = 0
        Set dist = 0
        While ('..File.AtEnd){
            Set line = $TRANSLATE(..File.ReadLine(),$CHAR(13),"")
            Set p1 = $PIECE(line," ")
            Set p2 = $PIECE(line," ",4)
            Set left(p1) = $GET(left(p1)) + 1
            Set right(p2) = $GET(right(p2)) + 1
            Set count = count + 1
        }
        Set l = $ORDER(left(""))
        Set r = $ORDER(right(""))
        For i=1:1:count {
            Set dist = dist + $ZABS(l-r)
            Set left(l) = left(l) - 1
            Set right(r) = right(r) - 1
            If (left(l)=0) { Set l = $ORDER(left(l)) }
            If (right(r)=0) { Set r = $ORDER(right(r)) }
        }
        Return dist
    }

    Method Part2() As %Numeric
    {
        Set count = 0
        Set sim = 0
        While ('..File.AtEnd){
            Set line = $TRANSLATE(..File.ReadLine(),$CHAR(13),"")
            Set p1 = $PIECE(line," ")
            Set p2 = $PIECE(line," ",4)
            Set left(p1) = $GET(left(p1)) + 1
            Set right(p2) = $GET(right(p2)) + 1
            Set count = count + 1
        }
        Set l = $ORDER(left(""))
        While (l '= "") {
            If $DATA(right(l)){
                Set sim = sim + (l * right(l))
            }
            Set l = $ORDER(left(l))
        }
        Return sim
    }
}