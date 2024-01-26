# 대표적인 그래프 종류 중 하나인 트리를 다뤄 봅시다.	
## 11725 트리의 부모 찾기
bfs로 접근하여 풀이하였다.   
이미 루트노드에서 출발하므로 만약 방문한 순간 0이라면   
해당 노드가 부모 노드인것이다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var graph = [[Int]](repeating: [Int](repeating: 0, count: 0), count: n+1)
    for _ in 0..<n-1 {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }
    var visited = Array(repeating: 0, count: n+1)
    //print(graph)
    
    func bfs(_ start: Int) {
        var q: [Int] = []
        q.append(start)
        var idx = 0
        
        visited[start] = -1
        while q.count > idx {
            let cur = q[idx]
            idx += 1
            for node in graph[cur] {
                if visited[node] == 0 {
                    visited[node] = cur
                    q.append(node)
                }
            }
        }
    }
    bfs(1)
    for i in 2...n {
        print(visited[i])
    }
}
solution()

```
