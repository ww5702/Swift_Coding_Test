```
import Foundation

func solution(_ cards:[Int]) -> Int {
    // 열기 위한 박스 넘버
    var boxnum = Array(repeating:1, count: cards.count)
    var countarr = Array(repeating:0, count: cards.count)
    var countnum = cards[0]
    boxnum[0] = 0
    var a = 0
    countarr[a] += 1
    
    var isEnd = false
    while isEnd == false {
        while boxnum[countnum-1] != 0 {
            countarr[a] += 1
            boxnum[countnum-1] = 0
            countnum = cards[countnum-1]
        }
        a += 1
        if boxnum.contains(1) { isEnd = false }
        else {isEnd = true}
    }
    countarr.sort(by:>)
    var result = countarr[0]*countarr[1]
    return result
}
```
