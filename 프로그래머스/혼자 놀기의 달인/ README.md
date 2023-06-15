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
변경 후 코드   
```
var list:[Int] = []
    var cardList = cards
    var startIndex:Int = 0
    var sum:Int = 0
    while true {
        for i in 0...cards.count-1 {
            if cardList[i] > 0 {
                startIndex = i
                break
            }
        }
        var count:Int = 0
        while true {
            count += 1
            var index = startIndex
            startIndex = cardList[index]-1
            cardList[index] = 0
            if cardList[startIndex] == 0 {
                break
            }
        }
        sum += count
        list.append(count)
        if sum == cards.count {
            if list.count < 2 {
                return 0
            } else {
                list.sort(by: >)
                return list[0] * list[1]
            }
        }
    }
```
