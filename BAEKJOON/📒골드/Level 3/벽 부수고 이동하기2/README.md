단순 bfs로 풀이하면 틀린다.   

```
import Foundation
func solution() {
    let nmk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m,k) = (nmk[0], nmk[1], nmk[2])
    var board = Array(repeating: Array(repeating: 0, count: m), count: n)
    for i in 0..<n {
        let input = readLine()!.map{Int(String($0))!}
        board[i] = input
    }
    
    var dis = Array(repeating: Array(repeating: 1_000_000, count: m), count: n)
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    dis[0][0] = 1
    
//    for i in 0..<n {
//        print(board[i])
//    }
    
    
    func bfs() {
        var q: [(Int,Int,Int)] = []
        q.append((0,0,k))
        var idx = 0
        
        while q.count > idx {
            let now = q[idx]
            let crush = now.2
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    // 벽이지만 벽을 부술 수 있다면
                    if board[newY][newX] == 1 && crush >= 1 {
                        if dis[newY][newX] > dis[now.0][now.1] + 1 {
                            dis[newY][newX] = dis[now.0][now.1] + 1
                            q.append((newY,newX,crush-1))
                        }
                        
                    }
                    
                    if board[newY][newX] == 0 {
                        if dis[newY][newX] > dis[now.0][now.1] + 1 {
                            dis[newY][newX] = dis[now.0][now.1] + 1
                            q.append((newY,newX,crush))
                        }
                    }
                    
                }
                
            }
            
            
        }
        
        
    }
    
    
    bfs()
    
//    for i in 0..<n {
//        print(dis[i])
//    }
    
    print(dis[n-1][m-1] == 1_000_000 ? -1 : dis[n-1][m-1])
    
}

solution()
/*
 */


```
