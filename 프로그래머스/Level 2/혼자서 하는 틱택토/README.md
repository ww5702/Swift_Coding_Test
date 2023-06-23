첫 제출
```
import Foundation

func solution(_ board:[String]) -> Int {
    var data = board.map{$0.map{String($0)}}
    var counto = 0
    var countx = 0
    for i in 0..<data.count {
        var count = 0
        for j in data[i] {
            if j == "O" { 
                counto += 1 
                count += 1
            } else if j == "X" { countx += 1 }
            // 연속된 3개가 나왔다면 return 0
            if count == 3 { return 0 }
        }
        
    }
    if counto != 0 || countx != 0 {
        // 만약 x가 더 많았다면
        if countx > counto { return 0 }
    }
    // 그런 경우가 아니라면 전부 가능
    return 1
}
```
