양쪽에서 본인보다 더 큰값이 있기만 하면 빗물이 담긴다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    let board = readLine()!.split(separator: " ").map{Int($0)!}
    
    var leftMax = Array(repeating: 0, count: board.count)
    var rightMax = Array(repeating: 0, count: board.count)
    
    leftMax[0] = board[0]
    rightMax[m-1] = board.last!
    
    for i in 1..<board.count {
        leftMax[i] = max(leftMax[i-1], board[i])
    }
    for i in stride(from: m-2, through: 0, by: -1) {
        rightMax[i] = max(rightMax[i+1], board[i])
    }
    //print(leftMax)
    //print(rightMax)
    
    var result = 0
    for i in 0..<m {
        result += (min(leftMax[i], rightMax[i]) - board[i])
    }
    print(result)
}
solution()
```
