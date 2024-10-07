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
따라서 bfs+dp로 풀이를 해야한다.   

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
    
    var dis = Array(repeating: Array(repeating: Array(repeating: Int.max, count: k+1), count: m), count: n)
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    dis[0][0][0] = 1
    var result = Int.max
    
//    for i in 0..<n {
//        print(board[i])
//    }
    
    
    func bfs() {
        var q: [((Int,Int),Int)] = []
        q.append(((0,0),0))
        var idx = 0
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            if now.0 == (n-1,m-1) {
                result = min(result, dis[now.0.0][now.0.1][now.1])
                continue
            }
            
            for i in 0..<4 {
                let newY = now.0.0 + dy[i]
                let newX = now.0.1 + dx[i]
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    // 벽일경우
                    if board[newY][newX] == 1 {
                        if now.1+1 <= k && dis[newY][newX][now.1+1] > dis[now.0.0][now.0.1][now.1]+1 {
                            dis[newY][newX][now.1+1] = dis[now.0.0][now.0.1][now.1]+1
                            q.append(((newY,newX),now.1+1))
                        }
                    } else {
                        if dis[newY][newX][now.1] > dis[now.0.0][now.0.1][now.1]+1 {
                            dis[newY][newX][now.1] = dis[now.0.0][now.0.1][now.1]+1
                            q.append(((newY,newX),now.1))
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
    
    print(result == Int.max ? -1 : result)
    
}

solution()
/*
 */


```
하지만 17프로쯤에 시간초과가 또 발생한다.   
따라서 같은 의미지만 좀 더 쉽게 bfs로 풀이한다.   

```
import Foundation

let nmk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.map{ Int(String($0))! }
    graph.append(input)
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]
func bfs() -> Int {
    var visited = [[Int]](repeating: [Int](repeating: k+1, count: m), count: n)
    
    visited[0][0] = 0
    print(visited)
    
    var queue = [(0,0,1)]   // (x,y,dist)
    var idx = 0
    
    while idx < queue.count {
        let (x,y,dist) = queue[idx]
        idx += 1
        
        if (x,y) == (n-1, m-1) {
            return dist
        }
        
        for i in 0 ..< 4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if (0..<n).contains(nx) && (0..<m).contains(ny) {
                let cnt = visited[x][y] + graph[nx][ny]
                
                if cnt >= visited[nx][ny] || cnt > k {
                    continue
                }
                
                visited[nx][ny] = cnt
                queue.append((nx, ny, dist + 1))
            }
            
            
        }
    }
    
    return -1
}

print(bfs())

```
