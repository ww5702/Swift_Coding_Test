dfs로 풀이했으나 시간초과   

```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var board = Array(repeating: Array(repeating: 0, count: n), count: n)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board[i] = input
    }
    var visited = Array(repeating: false, count: n)
    var result = 16_000_000
    
    func dfs(_ depth: Int, _ cost: Int) {
        if result < cost { return }
        if (depth == n) {
            result = min(cost, result)
            return
        }
        
        for i in 0..<n {
            if !visited[i] && board[depth][i] > 0 {
                visited[i] = true
                dfs(depth+1, cost+board[depth][i])
                visited[i] = false
            }
        }
    }
    
    dfs(0, 0)
    print(result)
}


solution()
/*
 */

```
