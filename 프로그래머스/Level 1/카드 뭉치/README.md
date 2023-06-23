첫 제출
```
import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var cards1 = cards1
    var cards2 = cards2
    var result = "Yes"
    for i in goal {
        let check1 = cards1.firstIndex(of: i)
        let check2 = cards2.firstIndex(of: i)
        if check1 == nil && check2 == nil { 
            result = "No" 
            break
        } else if check1 != nil { cards1.removeFirst() }
        else if check2 != nil { cards2.removeFirst() }
    }
    return result
}
```
