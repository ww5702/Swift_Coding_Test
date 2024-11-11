벽을 부수고 이동하는데 아침에만 가능하며,   
이동은 아침 밤 다 가능하다.   
벽을 아침까지 기다렸다가 부수고 이동할지 아님 우회할지가 중요한 문제   
메모리 초과가 발생하여 메모리를 최대한 줄여주는데 고생한 문제   

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
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: m), count: n),count: k+1)
    visited[k][0][0] = true
    
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var result = Int.max
    
    func bfs() {
        var q: [(Int,Int,Int,Int)] = []
        q.append((0,0,k,1))
        var idx = 0
        
        while q.count > idx {
            let now = q[idx]
            let cnt = now.2
            let cost = now.3
            
            //print(now)
            
            idx += 1
            
            if now.0 == n-1 && now.1 == m-1 { 
                result = cost
                break
            }
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    if visited[cnt][newY][newX] { continue }
                    // 벽이라면
                    if board[newY][newX] == 1 && cnt > 0 {
                        // 아침이라면 벽을 부술수있다.
                        if cost % 2 == 1 {
                            visited[k][newY][newX] = true
                            q.append((newY,newX,cnt-1,cost+1))
                        } else {
                        // 밤이라면 하루를 기다렸다가 부셔보자
                            q.append((now.0,now.1,cnt,cost+1))
                        }
                    } 
                    if board[newY][newX] == 0 {
                        visited[k][newY][newX] = true
                        q.append((newY,newX,cnt,cost+1))
                    }
                }
            }
        }
        
        
    }
    
    bfs()
    print(result == Int.max ? -1 : result)
    
}

solution()
/*
 */

```
도저히 메모리초과를 줄일수없어서 정답을 봤지만   
cost를 q.2로 줄이는 등의 방법밖에 다른게 없었고   
해당 방법으로는 해결이 안됐다.   

```
import Foundation

let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
let ds: [(i: Int, j: Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)]

var map = [[Int]]()
var visit = Array(repeating: Array(repeating: Array(repeating: false, count: m), count: n), count: k + 1)

for _ in 0..<n {
    let line = Array(readLine()!).map { Int(String($0))! }
    map.append(line)
}

var queue: [(i: Int, j: Int, coin: Int, cost: Int)] = [(0, 0, k, 1)]
var idx = 0
visit[k][0][0] = true

while queue.count > idx {
    let popped = queue[idx]
    idx += 1
        
    if popped.i == n-1 && popped.j == m-1 {
        print(popped.cost)
        exit(0)
    }
        
    for d in ds {
        let i = popped.i
        let j = popped.j
        let ni = i + d.i
        let nj = j + d.j
        
        if 0..<n ~= ni && 0..<m ~= nj {
            if visit[popped.coin][ni][nj] { continue }
            
            if map[ni][nj] == 1 && popped.coin > 0 {
                if popped.cost % 2 == 1 {
                    visit[popped.coin][ni][nj] = true
                    queue.append((ni, nj, popped.coin - 1, popped.cost + 1))
                } else {
                    queue.append((i, j, popped.coin, popped.cost + 1))
                }
            }
            
            if map[ni][nj] == 0 {
                visit[popped.coin][ni][nj] = true
                queue.append((ni, nj, popped.coin, popped.cost + 1))
            }
        }
    }
}

print(-1)
```
