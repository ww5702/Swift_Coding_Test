중복방문이 가능하다는게 특징인데 36프로에서 시간초과발생   

```
import Foundation
func solution(){
    let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,k) = (nk[0],nk[1])
    var board: [[Int]] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append(input)
    }
    var visited = Array(repeating: false, count: n)
    visited[k] = true
    var result = Int.max
    
    func isEnd() -> Bool{
        for i in 0..<n {
            if !visited[i] { return false }
        }
        return true
    }
    
    func dfs(_ idx: Int, _ sum: Int, _ cnt: Int) {
        if cnt >= n*n || sum >= result {
            return
        }
        
        if isEnd() {
            //print(sum)
            result = min(result, sum)
            return
        }
        
        for i in 0..<n {
            // 중복방문가능
            if !visited[i] {
                visited[i] = true
                dfs(i, sum+board[idx][i], cnt+1)
                visited[i] = false
                
            } else {
                dfs(i, sum+board[idx][i], cnt+1)
            }
        }
        
    }
    
    for i in 0..<n {
        if !visited[i] {
            visited[i] = true
            dfs(i, board[k][i], 1)
            visited[i] = false
        }
    }
    print(result)
    
}

solution()
/*
 */
  

```
