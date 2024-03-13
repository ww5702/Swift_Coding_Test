```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        var board = Array(repeating: Array(repeating: 0, count: n), count: n)
        var result = Array(repeating: Array(repeating: Int.max, count: n), count: n)
        for i in 0..<n {
            let input = readLine()!.split(separator: " ").map{Int($0)!}
            board[i] = input
        }
        //print(board)
        let dy = [1,-1,0,0]
        let dx = [0,0,1,-1]
        
        func bfs(_ y: Int, _ x: Int) {
            result[0][0] = board[0][0]
            var q: [(Int,Int)] = []
            q.append((y,x))
            var idx = 0
            
            while q.count > idx {
                let cur = q[idx]
                idx += 1
                for i in 0..<4 {
                    let newY = cur.0 + dy[i]
                    let newX = cur.1 + dx[i]
                    
                    if (0..<n).contains(newY) && (0..<n).contains(newX) {
                        if result[newY][newX] > result[cur.0][cur.1] + board[newY][newX] {
                            q.append((newY,newX))
                            result[newY][newX] = result[cur.0][cur.1] + board[newY][newX]
                        }
                    }
                }
                
            }
        }
        bfs(0, 0)
//        for i in 0..<n {
//            print(result[i])
//        }
        print(result[n-1][n-1])
        
    }
}
solution()
```
