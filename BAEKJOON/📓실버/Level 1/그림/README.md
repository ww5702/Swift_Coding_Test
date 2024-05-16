흔한 bfs문제이다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var board = Array(repeating: Array(repeating: 0, count: m), count: n)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        board[i] = input
    }
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    
    func bfs(_ y: Int, _ x: Int) -> Int{
        var q: [(Int,Int)] = []
        q.append((y,x))
        var idx = 0
        var result = 1
        
        while (q.count > idx) {
            let now = q[idx]
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    if (board[newY][newX] == 1) {
                        board[newY][newX] = 0
                        q.append((newY, newX))
                        result += 1
                    }
                }
                
            }
            
        }
        
        
        return result
    }
    
    var cnt = 0
    var area = 0
    
    for i in 0..<n {
        for j in 0..<m {
            if (board[i][j] == 1) {
                cnt += 1
                board[i][j] = 0
                let value = bfs(i,j)
                area = max(area, value)
            }
        }
    }
    
    print(cnt)
    print(area)
}
solution()

```
