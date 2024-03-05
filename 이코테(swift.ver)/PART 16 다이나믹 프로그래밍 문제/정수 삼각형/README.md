```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board = Array(repeating: Array(repeating: 0, count: n), count: n)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map({Int($0)!})
        for j in 0..<input.count {
            board[i][j] = input[j]
        }
    }
    //print(board)
    var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
    dp[0][0] = board[0][0]
    //print(dp)
    for i in 1..<n {
        for j in 0..<n {
            if j == 0 {
                dp[i][j] = board[i][j] + dp[i-1][j]
            } else if j == n-1 {
                dp[i][j] = board[i][j] + dp[i-1][j-1]
            } else {
                dp[i][j] = board[i][j] + max(dp[i-1][j], dp[i-1][j-1])
                //print(dp[i])
            }
        }
    }
    print(dp[n-1].max()!)
}
solution()
                     

/*
5
7
3 8
8 1 0
2 7 4 4
4 5 2 6 5
 */


```
