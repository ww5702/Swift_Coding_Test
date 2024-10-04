```
import Foundation
func solution() {
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    let board = readLine()!.split(separator: " ").map{Int(String($0))!}
    var sum = board[0..<m].reduce(0, +)
    var result = sum
    var cnt = 1
    for i in m..<n {
        sum -= board[i-m]
        sum += board[i]
        if sum > result {
            result = sum
            cnt = 1
        } else if sum == result {
            cnt += 1
        }
    }
    if result == 0 {
        print("SAD")
    } else {
        print(result)
        print(cnt)
    }
}

solution()
/*
 */


```
