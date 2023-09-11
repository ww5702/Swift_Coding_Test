```
import Foundation
/*
각 노드들로부터 1까지의 최단거리를 구하는 문제이다
다익스트라로 풀이하면 될것이다.
*/
func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 0
    var costs: [Int] = Array(repeating: Int.max, count: N+1)
    var graph: [[Int]] = Array(repeating: Array(repeating: Int.max, count: N+1), count: N+1)
    for r in road {
        // 서로의 길이 최소값인지 확인
        graph[r[0]][r[1]] = min(r[2], graph[r[0]][r[1]])
        graph[r[1]][r[0]] = min(r[2], graph[r[1]][r[0]])
    }
    var queue: [(idx: Int, cost: Int)] = [(1,0)]
    var index = 0
    // 1마을에서 출발
    costs[1] = 0 
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for next in 1...N {
            // 두 마을 사이에 길이 없다면
            if graph[node.idx][next] == Int.max { continue }
            
            // 거리를 계산
            let nCost = node.cost + graph[node.idx][next]
            // 만약 더 작은 거리라면 갱신
            if graph[node.idx][next] != Int.max && nCost < costs[next] {
                costs[next] = nCost
                queue.append((next, nCost))
            }
        }
    }
    //print(costs)
    return costs.filter{$0 <= k}.count
}
```
