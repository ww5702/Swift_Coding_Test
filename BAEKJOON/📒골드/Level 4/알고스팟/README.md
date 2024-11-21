단순한 bfs문제이다.   

```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[1],nm[0])
    var board = Array(repeating: [Int](), count: n)
    for i in 0..<n {
        let input = readLine()!.map{Int(String($0))!}
        board[i] = input
    }
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var dis = Array(repeating: Array(repeating: Int.max, count: m), count: n)
    dis[0][0] = 0
    
    func bfs() {
        var q: [(Int,Int)] = []
        q.append((0,0))
        var idx = 0
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0+dy[i]
                let newX = now.1+dx[i]
                
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    if board[newY][newX] == 0 {
                        if dis[newY][newX] > dis[now.0][now.1] {
                            q.append((newY,newX))
                            dis[newY][newX] = dis[now.0][now.1]
                        }
                    } else {
                        if dis[newY][newX] > dis[now.0][now.1]+1 {
                            q.append((newY,newX))
                            dis[newY][newX] = dis[now.0][now.1] + 1
                        }
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
