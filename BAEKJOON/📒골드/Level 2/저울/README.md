당연히 dfs는 시간초과   

```
import Foundation

func solution(){
    let n = Int(readLine()!)!
    var board = readLine()!.split(separator: " ").map{Int(String($0))!}
    var isPossible = Array(repeating: false, count: 1_000_000_001)
    var visited = Array(repeating: false, count: n)
    
    func isEnd() -> Bool {
        for i in 0..<n {
            if !visited[i] { return false }
        }
        return true
    }
    
    func dfs(_ sum: Int) {
        isPossible[sum] = true
        //print(sum)
        
        if isEnd() { return }
        
        for i in 0..<n {
            if !visited[i] {
                visited[i] = true
                dfs(sum+board[i])
                visited[i] = false
            }
        }
    }
    
    for i in 0..<n {
        visited[i] = true
        dfs(board[i])
        visited[i] = false
    }
    
    for i in 1...1000000000 {
        if !isPossible[i] { print(i); break }
    }
}
solution()
/*
 
 */

```
