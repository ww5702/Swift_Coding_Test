```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var board: [[Int]] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append(input)
    }
    var visited = Array(repeating: false, count: n)
    var answer = Int.max
    
    func dfs(_ depth: Int, _ sum: Int, _ start: Int, _ cur: Int) {
        //print(depth, sum, start, cur)
        if cur == start && depth == n {
            answer = min(answer, sum)
            return
        }
        
        for i in 0..<n {
            if !visited[i] && board[cur][i] != 0 {
                visited[i] = true
                dfs(depth+1, sum+board[cur][i], start, i)
                visited[i] = false
            }
        }
    }
    
    dfs(0, 0, 0, 0)
    print(answer)
}


solution()
/*
 */

```
