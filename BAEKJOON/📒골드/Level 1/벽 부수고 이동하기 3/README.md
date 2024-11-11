벽을 부수고 이동하는데 아침에만 가능하며,   
이동은 아침 밤 다 가능하다.   
벽을 아침까지 기다렸다가 부수고 이동할지 아님 우회할지가 중요한 문제   

```
import Foundation
func solution(){
    let nmk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m,k) = (nmk[0],nmk[1],nmk[2])
    var board: [[Int]] = []
    for _ in 0..<n {
        let input = readLine()!.map{Int(String($0))!}
        board.append(input)
    }
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var dis = Array(repeating: Array(repeating: Int.max, count: m), count: n)
    visited[0][0] = true
    dis[0][0] = 1
    
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var result = Int.max
    
    func bfs() {
        var q: [(Int,Int,Int,Bool,Int)] = []
        q.append((0,0,k,true,1))
        var idx = 0
        
        while q.count > idx {
            let now = q[idx]
            let cnt = now.2
            let isMorning = now.3
            let cost = now.4
            
            print(now)
            
            idx += 1
            
            if now.0 == n-1 && now.1 == m-1 { result = min(result, cost) }
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    // 벽이라면
                    if board[newY][newX] == 1 {
                        // 아침이라면 벽을 부술수있다.
                        if isMorning {
                            if cnt > 0 && dis[newY][newX] > cost+1 {
                                visited[newY][newX] = true
                                dis[newY][newX] = cost+1
                                q.append((newY,newX,cnt-1,!isMorning,cost+1))
                            }
                        } else {
                        // 밤이라면 하루를 기다렸다가 부셔보자
                            q.append((now.0,now.1,cnt,!isMorning,cost+1))
                        }
                    } else {
                        if dis[newY][newX] > cost + 1 {
                            visited[newY][newX] = true
                            dis[newY][newX] = cost+1
                            q.append((newY,newX,cnt,!isMorning,cost+1))
                        }
                    }
                    
                }
            }
        }
        
        
    }
    
    bfs()
    print(result)
    
    
}

solution()
/*
 */
  

```
