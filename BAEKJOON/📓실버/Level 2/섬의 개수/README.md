```
import Foundation
func solution(){
    while true {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (m,n) = (input[0],input[1])
        if (m == 0 && n == 0) { break }
        var board = Array(repeating: Array(repeating: 0, count: m), count: n)
        for i in 0..<n {
            let input = readLine()!.split(separator: " ").map{Int($0)!}
            board[i] = input
        }
        //print(board)
        
        let dy = [1,-1,0,0,-1,-1,1,1]
        let dx = [0,0,1,-1,-1,1,1,-1]
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        
        func bfs(_ y: Int, _ x: Int) {
            var q: [(Int,Int)] = []
            q.append((y,x))
            var idx = 0
            
            while q.count > idx {
                let now = q[idx]
                idx += 1
                
                for i in 0..<8 {
                    let newY = now.0 + dy[i]
                    let newX = now.1 + dx[i]
                    
                    if (0..<n).contains(newY) && (0..<m).contains(newX) {
                        if !visited[newY][newX] && board[newY][newX] == 1 {
                            visited[newY][newX] = true
                            q.append((newY,newX))
                        }
                        
                    }
                }
            }
            
        }
        
        var cnt = 0
        for i in 0..<n {
            for j in 0..<m {
                if !visited[i][j] && board[i][j] == 1 {
                    visited[i][j] = true
                    cnt += 1
                    bfs(i, j)
                }
            }
        }
        print(cnt)
    }
}
solution()

```
