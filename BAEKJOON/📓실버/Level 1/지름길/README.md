```
import Foundation
func solution(){
    let nd = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,d) = (nd[0],nd[1])
    var board = Array(repeating: [(Int,Int)](), count: d+1)
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board[input[0]].append((input[1],input[2]))
    }
    var dp = Array(repeating: Int.max, count: d+1)
    dp[0] = 0
    
    for i in 0...d {
        if i > 0 {
            dp[i] = min(dp[i], dp[i-1]+1)
        }
        
        for next in board[i] {
            let destination = next.0
            let cost = next.1
            if destination <= d {
                dp[destination] = min(dp[destination], dp[i] + cost)
            }
        }
    }
    print(dp[d])
}

solution()
/*
 
 */

```
