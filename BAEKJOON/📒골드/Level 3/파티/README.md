출발지 -> 목적지 -> 출발지   
이렇게 bfs로 최단거리를 구한다.   
그 전에 graph를 비용 순으로 정렬하여 시간을 줄여준다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m,x) = (input[0], input[1], input[2])
    var graph = Array(repeating: [(Int,Int)](), count: n+1)
    var dis = Array(repeating: Int.max, count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[0]].append((input[1],input[2]))
    }
    for i in 0..<n {
        graph[i].sort(by: {$0.1 < $1.1})
    }
    //print(graph)
    
    func bfs(_ node: Int) {
        var q: [Int] = []
        q.append(node)
        dis[node] = 0
        var idx = 0
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            for next in graph[now] {
                if dis[next.0] > dis[now] + next.1 {
                    q.append(next.0)
                    dis[next.0] = dis[now] + next.1
                }
            }
        }
    }
    
    bfs(x)
    //print(dis)
    var arr = dis
    
    var result = -1
    for i in 1...n {
        if i == x { continue }
        dis = Array(repeating: Int.max, count: n+1)
        bfs(i)
        //print(dis)
        var sum = arr[i] + dis[x]
        result = max(result, sum)
    }
    print(result)
}
solution()

```
