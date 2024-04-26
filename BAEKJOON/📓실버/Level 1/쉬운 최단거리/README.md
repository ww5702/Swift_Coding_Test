```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var map = Array(repeating: Array(repeating: 0, count: m), count: n)
    var dis = Array(repeating: Array(repeating: Int.max, count: m), count: n)
    var start = (0,0)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        for j in 0..<m {
            if input[j] == 2 {
                start = (i,j)
            }
            map[i][j] = input[j]
        }
    }
    dis[start.0][start.1] = 0
//    for i in 0..<n {
//        print(map[i])
//    }
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    bfs(start.0,start.1)
    
    
    
    for i in 0..<n {
        for j in 0..<m {
            if dis[i][j] == Int.max {
                dis[i][j] = 0
            }
            if map[i][j] == 1 && dis[i][j] == 0 {
                dis[i][j] = -1
            }
        }
    }
    
    for i in 0..<n {
        print(dis[i].map{String($0)}.joined(separator: " "))
    }
    
    func bfs(_ y: Int, _ x: Int) {
        var q: [(Int,Int)] = []
        q.append((y,x))
        var idx = 0
        
        while(q.count > idx) {
            let now = q[idx]
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    if map[newY][newX] == 1 {
                        if dis[newY][newX] > dis[now.0][now.1] + 1 {
                            q.append((newY,newX))
                            dis[newY][newX] = dis[now.0][now.1] + 1
                        }
                    }
                }
            }
        }
    }
    
}
solution()

```
