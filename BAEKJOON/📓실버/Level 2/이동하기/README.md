```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var board: [[Int]] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append(input)
    }
    
    let dy = [1,0,1]
    let dx = [0,1,1]
    var dis = Array(repeating: Array(repeating: -1, count: m), count: n)
    dis[0][0] = board[0][0]
    
    func bfs() {
        var q: [(Int,Int)] = []
        var idx = 0
        q.append((0,0))
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            for i in 0..<3 {
                let newY = now.0+dy[i]
                let newX = now.1+dx[i]
                
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    if dis[newY][newX] < dis[now.0][now.1] + board[newY][newX] {
                        dis[newY][newX] = dis[now.0][now.1] + board[newY][newX]
                        q.append((newY,newX))
                    }
                }
            }
        }
    }
    
    bfs()
    
    print(dis[n-1][m-1])
}

solution()
/*
 */


```
