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
