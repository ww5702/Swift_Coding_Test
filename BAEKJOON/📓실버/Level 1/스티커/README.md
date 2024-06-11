```
import Foundation

func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        var board: [[Int]] = []
        for _ in 0..<2 {
            let input = readLine()!.split(separator: " ").map{Int($0)!}
            board.append(input)
        }
        var dp = Array(repeating: Array(repeating: 0, count: n), count: 2)
        dp[0][0] = board[0][0]
        dp[1][0] = board[1][0]
        //print(board)
        //print(dp)
        for i in 1..<n {
            if i == 1 {
                dp[0][i] = dp[1][0] + board[0][i]
                dp[1][i] = dp[0][0] + board[1][i]
            } else {
                dp[0][i] = max(dp[1][i-2], dp[1][i-1]) + board[0][i]
                dp[1][i] = max(dp[0][i-2], dp[0][i-1]) + board[1][i]
            }
//            for i in 0..<2 {
//                print(dp[i])
//            }
        }
        print(max(dp[0][n-1], dp[1][n-1]))
    }
}
solution()

```
