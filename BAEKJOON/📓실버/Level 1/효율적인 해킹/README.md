문제풀이는 쉬우나 swift로는 시간초과를 받기 너무 쉽다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var graph: [[Int]] = Array(repeating: [], count: n+1)
    //print(graph)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[1]].append(input[0])
    }
    //print(graph)
    var result = Array(repeating: 0, count: n+1)
    var maxCnt = 0
    for i in 1...n {
        result[i] = bfs(i).count
        maxCnt = max(maxCnt, result[i])
    }
    
    var answer: [Int] = []
    for i in 1...n {
        if result[i] == maxCnt {
            answer.append(i)
        }
    }
    
    print(answer.map{String($0)}.joined(separator: " "))
    
    func bfs(_ node: Int) -> [Int] {
        var q: [Int] = []
        q.append(node)
        var visited = Array(repeating: false, count: n+1)
        visited[node] = true
        var idx = 0
        
        while (q.count > idx) {
            let now = q[idx]
            idx += 1
            
            for next in graph[now] {
                q.append(next)
                visited[node] = true
            }
        }
        return q
    }
}
solution()

```
