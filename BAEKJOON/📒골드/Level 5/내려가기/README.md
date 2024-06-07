```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board = Array(repeating: Array(repeating: 0, count: 3), count: n)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        board[i] = input
    }
    //print(board)
    var maxdp = Array(repeating: Array(repeating: -1, count: 3), count: n)
    var mindp = Array(repeating: Array(repeating: Int.max, count: 3), count: n)
    for i in 0..<3 {
        maxdp[0][i] = board[0][i]
        mindp[0][i] = board[0][i]
    }
    //print(maxdp, mindp)
    for i in 1..<n {
        maxdp[i][0] = max(maxdp[i-1][0], maxdp[i-1][1]) + board[i][0]
        mindp[i][0] = min(mindp[i-1][0], mindp[i-1][1]) + board[i][0]
        
        maxdp[i][1] = max(maxdp[i-1][0], max(maxdp[i-1][1], maxdp[i-1][2])) + board[i][1]
        mindp[i][1] = min(mindp[i-1][0], min(mindp[i-1][1], mindp[i-1][2])) + board[i][1]
        
        maxdp[i][2] = max(maxdp[i-1][1], maxdp[i-1][2]) + board[i][2]
        mindp[i][2] = min(mindp[i-1][1], mindp[i-1][2]) + board[i][2]
    }
    //print(maxdp, mindp)
    print(maxdp[n-1].max()!, mindp[n-1].min()!)
}
solution()

```
