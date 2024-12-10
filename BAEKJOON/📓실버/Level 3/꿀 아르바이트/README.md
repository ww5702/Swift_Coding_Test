```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var board = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    var sum = board[0..<m].reduce(0, +)
    var result = sum
    
    for i in m..<n {
        sum -= board[i-m]
        sum += board[i]
        result = max(result, sum)
    }
    print(result)
}
solution()
/*
 
 */

```
