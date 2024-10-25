단순 bfs문제이다.   

```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0], nm[1])
    var board: [[Int]] = []
    for i in 0..<n {
        let value = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append(value)
    }
    
    func isEnd() -> Bool {
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == 1 { return false }
            }
        }
        return true
    }
    
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var list: [(Int,Int)] = []
    
    func bfs(_ y: Int, _ x: Int) {
        var q: [(Int,Int)] = []
        var idx = 0
        q.append((y,x))
        visited[y][x] = true
        
        while q.count > idx {
            let now = q[idx]
            
            if now.0 == 0 || now.0 == n-1 || now.1 == 0 || now.1 == m-1 {
                list.append((y,x))
                break
            }
            
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    if !visited[newY][newX] && board[newY][newX] == 0{
                        q.append((newY,newX))
                        visited[newY][newX] = true
                    }
                }
            }
        }
    }
    
    var time = 0
    var result = -1
    
    while true {
        time += 1
        list = []
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == 1 {
                    visited = Array(repeating: Array(repeating: false, count: m), count: n)
                    bfs(i, j)
                }
            }
        }
        
        //print(list)
        result = list.count
        
        for i in 0..<result {
            board[list[i].0][list[i].1] = 0
        }
        
        if isEnd() {
            print(time)
            print(result)
            break
        }
        
    }
}

solution()
/*
 8 9
 13 12
 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 1 1 0 0 0
 0 1 1 1 0 0 0 1 1 0 0 0
 0 1 1 1 1 1 1 0 0 0 0 0
 0 1 1 1 1 1 0 1 1 0 0 0
 0 1 1 1 1 0 0 1 1 0 0 0
 0 0 1 1 0 0 0 1 1 0 0 0
 0 0 1 1 1 1 1 1 1 0 0 0
 0 0 1 1 1 1 1 1 1 0 0 0
 0 0 1 1 1 1 1 1 1 0 0 0
 0 0 1 1 1 1 1 1 1 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0
 */


```
