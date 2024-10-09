그냥 bfs로 풀이하면 우선순위에 걸린다.   

```
import Foundation
func solution(){
    let nmr = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m,r) = (nmr[0],nmr[1],nmr[2])
    var item = readLine()!.split(separator: " ").map{Int(String($0))!}
    var edge = Array(repeating: [(Int,Int)](), count: n+1)
    for _ in 0..<r {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        edge[input[0]].append((input[1],input[2]))
        edge[input[1]].append((input[0],input[2]))
    }
    var visited = Array(repeating: false, count: n+1)
    
    func bfs(_ num: Int) {
        // 번호, 거리
        var q: [(Int,Int)] = []
        var idx = 0
        q.append((num,0))
        
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            for next in edge[now.0] {
                if !visited[next.0] && now.1 + next.1 <= m {
                    visited[next.0] = true
                    q.append((next.0, now.1+next.1))
                }
            }
        }
    }
    
    var result = -1
    
    for i in 1...n {
        visited = Array(repeating: false, count: n+1)
        visited[i] = true
        bfs(i)
        //print(visited)
        var sum = 0
        for i in 1...n {
            if visited[i] {
                sum += item[i-1]
            }
        }
        
        result = max(result, sum)
    }
    print(result)
}

solution()
/*
 5 5 4
 5 7 8 2 3
 1 4 5
 5 2 4
 3 2 3
 1 2 2
 */

```
n이 100개가 안되기때문에 플로이드워셜로 풀이가 가능하다.   
```
import Foundation
func solution(){
    let nmr = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m,r) = (nmr[0],nmr[1],nmr[2])
    var item = readLine()!.split(separator: " ").map{Int(String($0))!}
    var dist = Array(repeating: Array(repeating: Int.max, count: 101), count: 101)
    for i in 1...n {
        dist[i][i] = 0
    }
    
    for _ in 0..<r {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        dist[input[0]][input[1]] = min(dist[input[0]][input[1]], input[2])
        dist[input[1]][input[0]] = min(dist[input[1]][input[0]], input[2])
    }
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if dist[i][k] != Int.max && dist[k][j] != Int.max {
                    if dist[i][k] + dist[k][j] < dist[i][j] {
                        dist[i][j] = dist[i][k] + dist[k][j]
                    }
                }
                
            }
        }
    }
    
    var result = 0
    for i in 1...n {
        var cnt = 0
        for j in 1...n {
            if dist[i][j] <= m { cnt += item[j-1] }
        }
        result = max(cnt, result)
    }
    print(result)
}

solution()
/*
 5 5 4
 5 7 8 2 3
 1 4 5
 5 2 4
 3 2 3
 1 2 2
 */

```
