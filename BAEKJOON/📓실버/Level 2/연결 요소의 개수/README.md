흔한 bfs문제이다.   
사이클을 찾는 문제이다.   

```
import Foundation
func solution(){
    var input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var graph = [[Int]](repeating: [Int](), count: n + 1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[0]].append(input[1])
        graph[input[1]].append((input[0]))
    }
    var visited = Array(repeating: false, count: n+1)
    var cnt = 0
    for i in 1...n {
        if !visited[i] {
            bfs(i)
            cnt += 1
        }
    }
    
    print(cnt)
    
    func bfs(_ node: Int) {
        visited[node] = true
        var q: [Int] = []
        q.append(node)
        var idx = 0
        while (q.count > idx) {
            let now = q[idx]
            idx += 1
            for node in graph[now] {
                if (!visited[node]) {
                    visited[node] = true
                    q.append(node)
                }
            }
        }
    }
    
}
solution()


```
