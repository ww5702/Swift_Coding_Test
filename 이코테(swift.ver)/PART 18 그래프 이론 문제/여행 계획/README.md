bfs로 순간순간 푸는것보다   
union-find가 더 빠를 수 있다는 것을 깨달았다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var board = [[Int]](repeating: [], count: n+1)
    for i in 1...n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        board[i] = input
    }
    print(board)
    var routes = readLine()!.split(separator: " ").map{Int($0)!}
    func bfs(_ node: Int) -> [Bool]{
        var q: [Int] = []
        var visited = Array(repeating: false, count: n+1)
        visited[node] = true
        q.append(node)
        var idx = 0
        
        while q.count > idx {
            let cur = q[idx]
            idx += 1
            
            for i in 0..<n {
                let next = board[cur][i]
                if !visited[i+1] && next == 1{
                    visited[i+1] = true
                    q.append(i+1)
                }
            }
        }
        
        return visited
    }
    var isOk = true
    for i in 0..<routes.count-1 {
        let start = routes[i]
        let visit = bfs(start)
        let next = routes[i+1]
        print(visit)
        if !visit[next] {
            isOk = false
            break
        }
    }
    print(isOk ? "YES" : "NO")
    
}
solution()


/*
5 4
0 1 0 1 1
1 0 1 1 0
0 1 0 0 0
1 1 0 0 0
1 0 0 0 0
2 3 4 3
 */
```

```
import Foundation
func solution(){
    func find(_ x: Int) -> Int {
        if parent[x] == x {
            return x
        } else {
            parent[x] = find(parent[x])
            return parent[x]
        }
    }
    func union(_ a: Int, _ b: Int) {
        let a = find(a)
        let b = find(b)
        if (a != b) {
            parent[b] = a
        }
    }
    
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var parent = [Int](0...n)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        for j in 0..<n {
            if input[j] == 1 {
                union(i+1, j+1)
            }
        }
    }
    print(parent)
    var routes = readLine()!.split(separator: " ").map{Int($0)!}
    var isOk = true
    for i in 0..<routes.count-1 {
        if find(routes[i]) != find(routes[i+1]) {
            isOk = false
            break
        }
    }
    print(!isOk ? "NO" : "YES")
}
solution()


/*
 5 4
 0 1 0 1 1
 1 0 1 1 0
 0 1 0 0 0
 1 1 0 0 0
 1 0 0 0 0
 2 3 4 3
 */
```
