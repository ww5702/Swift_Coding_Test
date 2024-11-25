일반 bfs로 풀이하니 34프로에서 메모리 초과 발생   

```
import Foundation

func solution(){
    let n = Int(readLine()!)!
    var board: [[Int]] = []
    for _ in 0..<n {
        board.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var result = 0
    
    func bfs(_ y: Int, _ x: Int) {
        var q: [(Int,Int,Int,Int)] = []
        var idx = 0
        q.append((y,x,board[y][x],1))
        
        while q.count > idx {
            let now = q[idx]
            result = max(result, now.3)
            
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<n).contains(newY) && (0..<n).contains(newX) {
                    if board[newY][newX] > now.2 {
                        q.append((newY,newX,board[newY][newX], now.3+1))
                    }
                }
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<n {
            //print(i,j)
            bfs(i, j)
            //print(result)
        }
    }
    print(result)
}
solution()
/*
 
 */

```
