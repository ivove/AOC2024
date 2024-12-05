Class AOC2024.Day5 Extends AOC2024.Base
{
    Method Part1() as %Numeric
    {
        set result = 0
        set readingRules =1
        While ('..File.AtEnd){
            Set line = $TRANSLATE(..File.ReadLine(),$CHAR(13),"")
            if line = "" { set readingRules = 0 }
            else {
                if readingRules {
                    set rules = $GET(rules) + 1
                    set rules(rules) = $LISTFROMSTRING(line,"|")
                }
                else {
                    set books = $GET(books) + 1
                    set books(books) = line
                }
            }
        }
        for i=1:1:books {
            set book = books(i)
            set ok = 1
            for r=1:1:rules {
                set rule = rules(r)
                if ((book[($LIST(rule,1))) && (book[($LIST(rule,2)))) {
                    //w *9,book
                    //zw rule
                    if $FIND(book,$LIST(rule,2)) < $FIND(book,$LIST(rule,1)) {
                        set ok = 0
                    }
                    //w *9,ok,!
                }
            }
            if ok {
                //w book,!
                set xx = $LISTFROMSTRING(book,",")
                set toAdd= $LIST(xx,$LISTLENGTH(xx)+1/2)
                //w toAdd,!
                set result = result + toAdd
            }
        }
        Return result
    }

    Method Part2() as %Numeric
    {
        set result = 0
        set readingRules =1
        While ('..TestFile.AtEnd){
            Set line = $TRANSLATE(..TestFile.ReadLine(),$CHAR(13),"")
            if line = "" { set readingRules = 0 }
            else {
                if readingRules {
                    set rules = $GET(rules) + 1
                    set rules(rules) = $LISTFROMSTRING(line,"|")
                }
                else {
                    set books = $GET(books) + 1
                    set books(books) = line
                }
            }
        }
        for i=1:1:books {
            set book = books(i)
            set ok = 1
            for r=1:1:rules {
                set rule = rules(r)
                if '..TestRule(book,rule) { set ok = 0 }
            }
            if 'ok {
                kill temp
                set xx = $LISTFROMSTRING(book,",")
                for x=1:1:$LISTLENGTH(xx)-1 {
                    if x = 1 { set temp = $LIST(xx,x) }
                    set temp($LIST(xx,x)) = $LIST(xx,x+1)
                }
                zw temp
                for r=1:1:rules {
                    set rule = rules(r)
                    if '..TestRule(book,rule) { 
                        zw rule
                        set x = $LIST(rule,1)
                        set y = $LIST(rule,2)
                        set old = $GET(temp(x))
                        set temp(x) = y
                        if (old '= "") { set temp(y) = old }
                        else { 
                            
                        }
                        
                        if (temp = y) { set temp = x }
                        zw temp
                    }
                }
                zw temp
                set ordered = $LISTBUILD()
                set x = temp
                while x '= "" {
                    set $LIST(ordered,$LISTLENGTH(ordered)+1) = x
                    set x = $get(temp(x),"")
                }
                zw ordered
                set toAdd= $LIST(ordered,$LISTLENGTH(ordered)+1/2)
                //w toAdd,!
                set result = result + toAdd
            }
        }
        Return result
    }

    Method TestRule(book,rule){
        set ok = 1
        if ..RuleApplies(book,rule) {
            if $FIND(book,$LIST(rule,2)) < $FIND(book,$LIST(rule,1)) {
                set ok = 0
            }
        }
        Return ok
    }

    Method RuleApplies(book,rule) {
        set applies = 0
        if ((book[($LIST(rule,1))) && (book[($LIST(rule,2)))) { set applies = 1 }
        Return applies
    }

    /// Description
    ClassMethod ApplyRule(list,rule)
    {
        set x = $LIST(rule,1)
        set y = $LIST(rule,2)
        set old = $GET(list(x))
        set list(x) = y
        if (old '= "") { set list(y) = old }
        else { 
        
        }
                        
        if (list = y) { set list = x }
    }
}