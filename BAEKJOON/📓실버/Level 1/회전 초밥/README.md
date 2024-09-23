set 사용 하지만 시간초과   

```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,d,k,c) = (input[0],input[1],input[2],input[3])
    var board: [Int] = []
    for _ in 0..<n {
        board.append(Int(readLine()!)!)
    }
    var result = -1
    
    for i in 0...n-k {
        var value = board[i..<i+k]
        value.append(c)
        let setValue = Set(value)
        result = max(result, setValue.count)
    }
    
    // 뒤에 꺼 + 앞에꺼
    for i in n-k+1..<n {
        var value = board[i..<n] + board[0..<k-(n-i)]
        value.append(c)
        let setValue = Set(value)
        result = max(result, setValue.count)
    }
    
    print(result)
}

solution()
/*
 */


```
