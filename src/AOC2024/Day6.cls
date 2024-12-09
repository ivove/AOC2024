Class AOC2024.Day6 Extends AOC2024.Base
{
    Method Part1() {
        set result = 1
        set y = 1
        set maxy = 0
        set maxx = 0
        set curx = 0
        set cury = 0
        set facing = "u"
        While ('..File.AtEnd){
            Set line = $TRANSLATE(..File.ReadLine(),$CHAR(13),"")
            set len = $LENGTH(line)
            if (len>maxx) { set maxx = len }
            for x=1:1:len {
                set grid(x,y) = $EXTRACT(line,x)
                if ($EXTRACT(line,x) = "^") {
                    set grid(x,y) = "."
                    set curx = x
                    set cury = y
                }
            }
            if (y > maxy) { set maxy = y }
            set y = y + 1
        }

        set visited(curx,cury) = 1
        //do ..DrawMap(.grid,.visited,curx,cury)
        set cnt = 1

        set continue = 1
        while continue {
            set nx = curx
            set ny = cury-1
            if facing = "d" {
                set nx = curx
                set ny = cury + 1
            }
            elseif facing = "r" {
                set nx = curx + 1
                set ny = cury
            }
            elseif facing = "l" {
                set nx = curx - 1
                set ny = cury
            }
            //w curx,*9,cury,*9,facing,*9,"*",$GET(grid(nx,ny)),"*",!
            if ($GET(grid(nx,ny)) = "") { set continue = 0 }
            else {
                if (grid(nx,ny) = "#") {
                    if (facing = "u") { set facing = "r" }
                    elseif (facing = "r") { set facing = "d" }
                    elseif (facing = "d") { set facing = "l" }
                    elseif (facing = "l") { set facing = "u" }
                }
                else {
                    set curx = nx
                    set cury = ny
                    if ('$GET(visited(curx,cury))) { set result = result + 1 }
                    set visited(curx,cury) = "1"
                }
            }
            set cnt = cnt + 1
            
            /*if cnt # 100 { 
                write !,!
                d ..DrawMap(.grid,.visited,curx,cury) 
            }*/
        }
        Return result
    }

    Method Part2() {
        set result = 0
        set y = 1
        set maxy = 0
        set maxx = 0
        set curx = 0
        set cury = 0
        set facing = "u"
        While ('..TestFile.AtEnd){
            Set line = $TRANSLATE(..TestFile.ReadLine(),$CHAR(13),"")
            set len = $LENGTH(line)
            if (len>maxx) { set maxx = len }
            for x=1:1:len {
                set grid(x,y) = $EXTRACT(line,x)
                if ($EXTRACT(line,x) = "^") {
                    set grid(x,y) = "."
                    set curx = x
                    set cury = y
                }
            }
            if (y > maxy) { set maxy = y }
            set y = y + 1
        }

        set continue = 1
        while continue {
            set nx = curx
            set ny = cury-1
            if facing = "d" {
                set nx = curx
                set ny = cury + 1
            }
            elseif facing = "r" {
                set nx = curx + 1
                set ny = cury
            }
            elseif facing = "l" {
                set nx = curx - 1
                set ny = cury
            }
            //w curx,*9,cury,*9,facing,*9,"*",$GET(grid(nx,ny)),"*",!
            if ($GET(grid(nx,ny)) = "") { set continue = 0 }
            else {
                if (grid(nx,ny) = "#") {
                    if (facing = "u") { set facing = "r" }
                    elseif (facing = "r") { set facing = "d" }
                    elseif (facing = "d") { set facing = "l" }
                    elseif (facing = "l") { set facing = "u" }
                }
                else {
                    set curx = nx
                    set cury = ny
                    if ('$GET(visited(curx,cury))) { set result = result + 1 }
                    set visited(curx,cury,facing) = "1"
                }
            }
        }
        Return result
    }

    method DrawMap(grid,visited,curx,cury){
        set x= $ORDER(grid(""))
        while x '= "" {
            set y = $ORDER(grid(x,""),1,val)
            while y '= "" {
                set map(y,x)=val
                set y = $ORDER(grid(x,y),1,val)
            }
            set x = $ORDER(grid(x))
        }

        set y= $ORDER(map(""))
        while y '= "" {
            set x = $ORDER(map(y,""),1,val)
            while x '= "" {
                set tile = val
                if (x = curx) && (y = cury) { set tile = "O" }
                elseif $GET(visited(x,y)) { set tile = "X" }
                w tile
                set x = $ORDER(map(y,x),1,val)
            }
            w !
            set y = $ORDER(map(y))
        }
    }
}