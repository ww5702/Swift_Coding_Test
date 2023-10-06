가장 먼 노드를 구하라 를 봤을때 가장 먼저 떠올릴수 있는 방법은 bfs, 다익스트라 이다.   
노드들중 최단거리를 구하는 것이니 두 방법으로 풀 수 있다.   
각 노드들의 통로를 그래프로 정리 후, 1번노드에서 출발했을때의 값 + 1이 최단경로이라면 변경해주는 방식이다.   

```
import Foundation
func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph = Array(repeating: [Int](), count: n+1)
    for value in edge {
        graph[value[0]].append(value[1])
        graph[value[1]].append(value[0])
    }
    var moveCnt = Array(repeating: 987654321, count: n+1)
    
    func dijikstra(_ graph: [[Int]]) -> Int {
        var q: [Int] = []
        q.append(1)
        moveCnt[0] = 0
        moveCnt[1] = 0
        
        while !q.isEmpty {
            let now = q.removeFirst()
            for i in graph[now] {
                // 최소값으로 움직일 수 있다면 변경
                if moveCnt[i] > moveCnt[now] + 1 {
                    moveCnt[i] = moveCnt[now] + 1
                    q.append(i)
                }
            }
        }
        
        return moveCnt.filter{$0 == moveCnt.max()!}.count
    }
    
    
    return dijikstra(graph)
}
```
bfs   

```
import Foundation
// 최단거리 하면 bfs
func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph = Array(repeating: [Int](), count: n+1)
    for value in edge {
        graph[value[0]].append(value[1])
        graph[value[1]].append(value[0])
    }
    var moveCnt = Array(repeating: 987654321, count: n+1)
    var visited = Array(repeating: false, count: n+1)
    var q: [(Int,Int)] = []
    moveCnt[0] = 0
    moveCnt[1] = 0
    q.append((1,0))
    
    
    func bfs() {
        visited[1] = true
        while !q.isEmpty {
            let (node,index) = q.removeFirst()
            for i in graph[node] {
                if !visited[i] && moveCnt[i] > index + 1 {
                    q.append((i,index+1))
                    moveCnt[i] = index+1
                    visited[i] = true
                }
                visited[i] = true
            }
        }
    }
    bfs()

    let max = moveCnt.max()!
    return moveCnt.filter{$0 == max}.count
}
```
