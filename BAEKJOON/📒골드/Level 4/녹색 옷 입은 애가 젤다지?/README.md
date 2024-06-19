흔한 bfs문제이다.   

```
import Foundation
func solution(){
    var cnt = 1
    while true {
        let n = Int(readLine()!)!
        if n == 0 { break }
        var board: [[Int]] = []
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map{Int(String($0))!}
            board.append(input)
        }
        //print(board)
        let dy = [1,-1,0,0]
        let dx = [0,0,1,-1]
        var dis = Array(repeating: Array(repeating: Int.max, count: n), count: n)
        dis[0][0] = board[0][0]
        
        func bfs(_ y: Int, _ x: Int) {
            var q: [(Int,Int)] = []
            var idx = 0
            q.append((y,x))
            
            while q.count > idx {
                let now = q[idx]
                idx += 1
                
                for i in 0..<4 {
                    let newY = now.0 + dy[i]
                    let newX = now.1 + dx[i]
                    
                    if (0..<n).contains(newY) && (0..<n).contains(newX) {
                        if dis[newY][newX] > dis[now.0][now.1] + board[newY][newX] {
                            q.append((newY,newX))
                            dis[newY][newX] = dis[now.0][now.1] + board[newY][newX]
                        }
                    }
                }
            }
        }
        
        bfs(0,0)
//        for i in 0..<n {
//            print(dis[i])
//        }
        print("Problem \(cnt):",dis[n-1][n-1])
        cnt += 1
    }
    
    
}

solution()
/*
 */

```
