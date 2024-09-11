```
import Foundation
func solution() {
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var board = Array(repeating: Array(repeating: "", count: m), count: n)
    var (curY,curX) = (-1,-1)
    for i in 0..<n {
        let input = readLine()!.map{String($0)}
        for j in 0..<m {
            if input[j] == "I" {
                (curY,curX) = (i,j)
            }
            board[i][j] = input[j]
        }
    }
//    print(curY,curX)
//    print(board)
    var result = 0
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    visited[curY][curX] = true
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    func bfs() {
        var q: [(Int,Int)] = []
        q.append((curY,curX))
        var idx = 0
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    if !visited[newY][newX] && board[newY][newX] != "X" {
                        visited[newY][newX] = true
                        result += board[newY][newX] == "P" ? 1 : 0
                        q.append((newY,newX))
                    }
                }
            }
            
        }
    }
    
    bfs()
    print(result == 0 ? "TT" : result)
    
    
}

solution()
/*
 */

```
