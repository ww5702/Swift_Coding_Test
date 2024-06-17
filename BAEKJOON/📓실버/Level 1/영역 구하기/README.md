```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n,m,k) = (input[0],input[1],input[2])
    var board = Array(repeating: Array(repeating: 0, count: m), count: n)
    for _ in 0..<k {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (x1,y1,x2,y2) = (input[0],input[1],input[2],input[3])
        for i in y1..<y2 {
            for j in x1..<x2 {
                board[i][j] = 1
            }
        }
    }
    
//    for i in 0..<n {
//        print(board[i])
//    }
    
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var total = 0
    var result: [Int] = []
    
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    func bfs(_ y: Int, _ x: Int) -> Int{
        var result = 1
        var q: [(Int,Int)] = []
        var idx = 0
        q.append((y,x))
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    if !visited[newY][newX] && board[newY][newX] == 0 {
                        q.append((newY,newX))
                        result += 1
                        visited[newY][newX] = true
                    }
                }
                
            }
            
        }
        
        return result
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if !visited[i][j] && board[i][j] == 0 {
                visited[i][j] = true
                total += 1
                result.append(bfs(i,j))
                //print(result)
            }
        }
    }
    print(total)
    print(result.sorted(by:<).map{String($0)}.joined(separator: " "))
}
solution()
/*
 */

```
