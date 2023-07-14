예전에 풀었던 문제를 다시 풀게 되었다.   
전에 풀어서 그런지 막힘 없이 구현할 수 있었다.   
list를 따로 하나 구현하여 열리지 않을때까지 반복해주고, 카운팅하여 배열에 넣어준다.   
```
import Foundation

func solution(_ cards:[Int]) -> Int {
    var list = Array(repeating: 1, count: cards.count)
    var sum = 0
    var result: [Int] = []
    for c in 0..<cards.count {
        // 만약 이미 열었었다면 reset
        if list[c] == 0 {continue}
        var index = c
        while true {
            list[index] = 0
            sum += 1 
            //cards[index]
            //print(cards[index])
            index = cards[index] - 1
            if list[index] == 0 { break }
        }
        result.append(sum)
        sum = 0
        //print("결과",result)
        
    }
    if result.count < 2 { 
        return 0
    } else {
        result.sort(by: >)
        return result[0] * result[1]
    }
}
```


예전에 풀이했던 방식이다.   
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
import Foundation
func solution(_ cards:[Int]) -> Int {
    var list:[Int] = []
    var cardList = cards
    var startIndex:Int = 0
    var sum:Int = 0
    while true {
        // 열어야하는 박스 번호 정해주기
        for i in 0...cards.count-1 {
            if cardList[i] > 0 {
                startIndex = i
                break
            }
        }
        
        // 못열때까지 계속 반복
        var count:Int = 0
        while true {
            count += 1
            var index = startIndex
            startIndex = cardList[index]-1
            // 열게된 박스는 0으로 변경
            cardList[index] = 0
            // 열어야 할 박스가 0이면 while 반복문 탈출
            if cardList[startIndex] == 0 {
                break
            }
        }
        
        sum += count
        // a,b,c... 그룹에 저장하기 위한 list 배열
        list.append(count)
        // 전부 다 열었다면
        if sum == cards.count {
            if list.count < 2 {
                return 0
            } else {
                list.sort(by: >)
                return list[0] * list[1]
            }
        }
    }
}
let cards: [Int] = [8,6,3,7,2,5,1,4]
print(solution(cards))

```
