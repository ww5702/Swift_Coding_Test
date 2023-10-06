비용을 거리로 바꿔서 다익스트라로 풀수있을것같았다.   
0번노드에서 출발해서 각 노드들까지 최소 비용을 계산하면 값이 나올것같았지만   
테스트케이스를 예로 들면   
0번에서 1,2,3까지 가는 최단비용은 1,2,2이다.   
하지만 정답은 4이다.    
1에서 3으로 가는 비용은 1이기 떄문이다.   

```
import Foundation
// 비용을 거리로 바꾼다면 똑같이 다익스트라로 할수있을것같다.
func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var graph = Array(repeating: [Int](), count: n)
    var costArr = Array(repeating: Array(repeating: 987654321, count: n), count: n)
    for cost in costs {
        graph[cost[0]].append(cost[1])
        graph[cost[1]].append(cost[0])
        costArr[cost[0]][cost[1]] = cost[2]
        costArr[cost[1]][cost[0]] = cost[2]
    }
    print(graph)
    print(costArr)
    var costCnt = Array(repeating: 987654321, count: n)
    costCnt[0] = 0
    
    func dijikstra(_ graph: [[Int]]) -> Int {
        var q: [Int] = []
        q.append(0)
        
        while !q.isEmpty {
            let now = q.removeFirst()
            for i in graph[now] {
                if costCnt[i] > costArr[now][i] + costCnt[now] {
                    costCnt[i] = costArr[now][i] + costCnt[now]
                    q.append(i)
                }
            }
        }
        print(costCnt)
        return costCnt.reduce(0,+)
    }
    return dijikstra(graph)
}
```
