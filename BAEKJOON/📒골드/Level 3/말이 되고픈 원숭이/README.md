1차 제출 3% 실패   
아마도 visited문제 해결해야할듯   

```
import Foundation
func solution() {
    var k = Int(readLine()!)!
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[1],nm[0])
    var dis = Array(repeating: Array(repeating: Int.max, count: m), count: n)
    var board = Array(repeating: Array(repeating: 0, count: m), count: n)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board[i] = input
    }
    
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    let sideDy = [-1,-2,-2,-1,1,2,2,1]
    let sideDx = [-2,-1,1,2,2,1,-1,-2]
    
    dis[0][0] = 0
    
    
    func bfs(_ y: Int, _ x: Int, _ cnt: Int) {
        var q: [(Int,Int,Int)] = []
        var idx = 0
        q.append((y,x,cnt))
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            let nowY = now.0
            let nowX = now.1
            let jump = now.2
            
            // 가장 빠르게 도착한다면 break
            if nowY == n-1 && nowX == m-1 { break }
            
            // 아직 말처럼 행동할 수 있다면
            if jump > 0 {
                for i in 0..<8 {
                    let newY = now.0 + sideDy[i]
                    let newX = now.1 + sideDx[i]
                    
                    if (0..<n).contains(newY) && (0..<m).contains(newX) {
                        if board[newY][newX] != 1 && dis[newY][newX] > dis[nowY][nowX]+1 {
                            dis[newY][newX] = dis[nowY][nowX] + 1
                            q.append((newY,newX,jump-1))
                        }
                    }
                }
            }
            
            // 상하좌우는 언제나 가능
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    if board[newY][newX] != 1 && dis[newY][newX] > dis[nowY][nowX] + 1 {
                        dis[newY][newX] = dis[nowY][nowX] + 1
                        q.append((newY,newX,jump))
                    }
                }
            }
            
        }
        
    }
    
    bfs(0,0,k)
//    for i in 0..<n {
//        print(dis[i])
//    }
    
    print(dis[n-1][m-1] == Int.max ? -1 : dis[n-1][m-1])
}


solution()
```
