Class AOC2024.Day4 Extends AOC2024.Base
{
    /// Description
    Method Part1() As %Numeric
    {
        set count = 0
        set maxx = 1
        set maxy = 1
        set y = 1
        While ('..File.AtEnd){
            Set line = $TRANSLATE(..File.ReadLine(),$CHAR(13),"")
            set len = $LENGTH(line)
            if (len>maxx) { set maxx = len }
            for x=1:1:len {
                set grid(x,y) = $EXTRACT(line,x)
            }
            if (y > maxy) { set maxy = y }
            set y = y + 1
        }
        //w maxx,*9,maxy,!
        for x=1:1:maxx {
            for y=1:1:maxy {
                if (grid(x,y) = "X") {
                    set lr = grid(x,y)_$GET(grid(x+1,y))_$GET(grid(x+2,y))_$GET(grid(x+3,y))
                    set rl = grid(x,y)_$GET(grid(x-1,y))_$GET(grid(x-2,y))_$GET(grid(x-3,y))
                    set td = grid(x,y)_$GET(grid(x,y+1))_$GET(grid(x,y+2))_$GET(grid(x,y+3))
                    set dt = grid(x,y)_$GET(grid(x,y-1))_$GET(grid(x,y-2))_$GET(grid(x,y-3))

                    set lru = grid(x,y)_$GET(grid(x+1,y+1))_$GET(grid(x+2,y+2))_$GET(grid(x+3,y+3))
                    set lrd = grid(x,y)_$GET(grid(x+1,y-1))_$GET(grid(x+2,y-2))_$GET(grid(x+3,y-3))
                    set rlu = grid(x,y)_$GET(grid(x-1,y+1))_$GET(grid(x-2,y+2))_$GET(grid(x-3,y+3))
                    set rld = grid(x,y)_$GET(grid(x-1,y-1))_$GET(grid(x-2,y-2))_$GET(grid(x-3,y-3))

                    if (lr = "XMAS") { set count = count + 1 }
                    if (rl = "XMAS") { set count = count + 1 }
                    if (td = "XMAS") { set count = count + 1 }
                    if (dt = "XMAS") { set count = count + 1 }
                    if (lru = "XMAS") { set count = count + 1 }
                    if (lrd = "XMAS") { set count = count + 1 }
                    if (rlu = "XMAS") { set count = count + 1 }
                    if (rld = "XMAS") { set count = count + 1 }
                }
            }
        }
        Return count
    }

    Method Part2() As %Numeric
    {
        set count = 0
        set maxx = 1
        set maxy = 1
        set y = 1
        While ('..File.AtEnd){
            Set line = $TRANSLATE(..File.ReadLine(),$CHAR(13),"")
            set len = $LENGTH(line)
            if (len>maxx) { set maxx = len }
            for x=1:1:len {
                set grid(x,y) = $EXTRACT(line,x)
            }
            if (y > maxy) { set maxy = y }
            set y = y + 1
        }
        //w maxx,*9,maxy,!
        for x=1:1:maxx {
            for y=1:1:maxy {
                if (grid(x,y) = "A") {

                    set lrd = $GET(grid(x-1,y-1))_grid(x,y)_$GET(grid(x+1,y+1))
                    set lru = $GET(grid(x-1,y+1))_grid(x,y)_$GET(grid(x+1,y-1))
                    set rlu = $GET(grid(x+1,y+1))_grid(x,y)_$GET(grid(x-1,y-1))
                    set rld = $GET(grid(x+1,y-1))_grid(x,y)_$GET(grid(x-1,y+1))

                    set xx = 0
                    if (lru = "MAS") { set xx = xx + 1 }
                    if (lrd = "MAS") { set xx = xx + 1 }
                    if (rlu = "MAS") { set xx = xx + 1 }
                    if (rld = "MAS") { set xx = xx + 1 }

                    if (xx = 2) { set count = count + 1 }
                }
            }
        }
        Return count
    }
}