```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var graph = Array(repeating: [Int](), count: n)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        for j in 0..<n {
            if input[j] == 1 {
                graph[i].append(j)
            }
        }
    }
    //print(graph)
    var visited = Array(repeating: false, count: n)
    
    func bfs(_ node: Int) {
        var q: [Int] = []
        q.append(node)
        var idx = 0
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            for next in graph[now] {
                if !visited[next] {
                    visited[next] = true
                    q.append(next)
                }
            }
        }
    }
    //print()
    var result = Array(repeating: Array(repeating: 0, count: n), count: n)
    for i in 0..<n {
        visited = Array(repeating: false, count: n)
        bfs(i)
        //print(visited)
        for j in 0..<n {
            if visited[j] { result[i][j] = 1 }
        }
    }
    
    for i in 0..<n {
        print(result[i].map{String($0)}.joined(separator: " "))
    }
}
solution()

```
