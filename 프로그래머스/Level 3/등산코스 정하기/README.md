다익스트라를 사용하여 각자의 출입구에서 각각의 정상까지 가는 경로를 최단으로 구한다   
구한 최단경로가 최저라면 해당 값을 return해주려 했지만   
시간초과 + 최저로 걸리는 경로를 저장해야 한다.   

```
import Foundation
/*
양방향 통행이 가능
다른 곳으로 이동할 때 일정 시간이 소요
등산코스는 방문한 지점 번호들을 나열하여 포함
휴식 없이 이동해야 하는 시간 중 가장 긴 시간을 intensity
출입구중 하나에서 출발하여 산봉우리 중 하나만 방문한 뒤 다시 돌아오는 코스
즉 출입구는 처음과 끝에 같은 출입구로, 산봉우리는 한번만
등산코스에 포함된 산봉우리의 번호와
intensity가 최소값을 return
paths = x,y까지 z 시간이 걸린다
gates = 출입구
summits = 정상
*/
// 가중치가 있는 그래프 ? 플로이드 워셜? 하지만 n^3이고 최대 50,000이기에 시간초과일것
// 다익스트라로 출입구부터 정상까지 정상부터 출입구까지 gates x summits번
// 예를들어 1번 예시인 경우 1번 입구에서 5번 정상까지 5번 -> 1번
// 3번 입구에서 5번 정상까지 5 -> 1번



func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
    var map: [Int : [[Int]]] = [:]
    
    for path in paths {
        map[path[0],default:[]].append([path[1],path[2]])
    }
    print(map)
    print()
    func dijstra(_ start: Int, _ goal: Int) -> Int{
        var route_cost = Array(repeating: Int.max, count: n+1)
        var allRoutes = (0...n).map{[$0]}
        // 시작지점 설정
        var Queue: [Int] = [start]
        // 자기자신은 거리 0
        route_cost[start] = 0
        while !Queue.isEmpty {
            let first = Queue.removeFirst()
            let filterNodes = paths.filter{$0[0] == first || $0[1] == first}
            for node in filterNodes {
                // 연결되는 노드
                let connectionNode = node[0] == first ? node[1] : node[0]
                if route_cost[first] == Int.max { continue }
                if route_cost[first] + node[2] < route_cost[connectionNode] {
                    route_cost[connectionNode] = route_cost[first]+node[2]
                    print("바뀔때마다",route_cost)
                    Queue.append(connectionNode)
                    
                    var newRoute = allRoutes[first]
                    //현재 노드를 추가해줌.
                    newRoute.append(connectionNode)
                    //현재 노드를 새로운 경로로 바꿔줌.
                    allRoutes[connectionNode] = newRoute
                }
            }
        }
        print(route_cost)
        print(allRoutes)
        return route_cost[goal]
    }
    
    var result: [Int] = [Int.max, Int.max]
    for gate in gates {
        for summit in summits {
            print(dijstra(gate,summit))
            print(dijstra(summit,gate))
        }
    }
    
    return []
}
```
다익스트라를 살짝 변형시켜서 풀이해야한다.   
해당 문제는 최단경로를 구하는것이 아닌, 노드까지의 경로가 최저로 이동하여 산봉우리까지 가야하는 문제이다.   
즉 경로는 조금 더 길어져도 최대한 한번에 덜 움직이는 경로를 찾아내야 한다.   
따라서 똑같이 우선순위큐를 이용해 풀이하면서 다익스트라 알고리즘을 활용하긴한다.   

```
import Foundation

struct PQ<T> {
    var nodes = [T]()
    var isEmpty: Bool {
        nodes.isEmpty
    }
    var sort: (T, T) -> Bool
    
    mutating func insert(_ ele: T) {
        nodes.append(ele)
        
        swapUp(nodes.count - 1)
    }
    
    mutating private func swap(_ index1: Int, _ index2: Int) {
        guard index1 < nodes.count, index2 < nodes.count else { return }
        
        let temp = nodes[index1]
        nodes[index1] = nodes[index2]
        nodes[index2] = temp
    }
    
    mutating private func swapUp(_ index: Int) {
        guard index < nodes.count else { return }
        var index = index
        
        while index != 0 {
            let parent = index / 2
            
            if sort(nodes[index], nodes[parent]) {
                swap(parent, index)
                index = parent
            } else {
                return
            }
        }
    }
    
    mutating func pop() -> T? {
        swap(0, nodes.count - 1)
        
        defer {
            nodes.removeLast()
            swapDown(0)
        }
        
        return nodes.last
    }
    
    mutating func swapDown(_ index: Int) {
        var index = index
        
        while true {
            let right = (index + 1) * 2
            let left = right - 1
            var target = index
            if left < nodes.count && sort(nodes[left], nodes[target]) {
                target = left
            }
            
            if right < nodes.count && sort(nodes[right], nodes[target]) {
                target = right
            }
            
            if target == index {
                return
            } else {
                swap(target, index)
                index = target
            }
        }
    }
}
func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
    var nodes = Array(repeating: [(Int,Int)](), count: n+1)
    let summitsSet = Set(summits)
    // 길 저장
    for path in paths {
        let (node1,node2,cost) = (path[0],path[1],path[2])
        nodes[node1].append((node2,cost))
        nodes[node2].append((node1,cost))
    }
    func Dijkstra() -> [Int] {
        var pq = PQ<(Int,Int)>(sort: {$0.0 < $1.0})
        let INF = Int.max
        var distance = Array(repeating: INF, count : n+1)
        // 모든 출발지를 하나에 넣고 돌린다
        for gate in gates {
            pq.insert((0,gate))
            distance[gate] = 0
        }
        while !pq.isEmpty {
            // 현재 위치
            guard let cur = pq.pop() else { break }
            let nowCost = cur.0
            let nowNode = cur.1
            // cost가 많을때는 어차피 필요없다
            if distance[nowNode] < nowCost { continue }
            for nextData in nodes[nowNode] {
                let nextNode = nextData.0
                let nextCost = nextData.1
                let totalCost = max(nowCost, nextCost)
                // 만약 nextNode까지 가는 거리가 지금 가는 방향이
                // 더 적은 시간으로 간다면 바꿔주기
                if distance[nextNode] > totalCost {
                    distance[nextNode] = totalCost
                    if summitsSet.contains(nextNode) { continue }
                    pq.insert((totalCost, nextNode))
                }
            }
        }
        return distance
    }
    let distance = Dijkstra()
    var answer = [Int.max,Int.max]
    // 목적지인 summit까지 간다
    for summit in summits {
        // summit까지 가는데 휴식없이 최저시간으로 가는 비용이 나온다.
        let value = distance[summit]
        // 만약 해당값이 더 적은값이라면 바꿔준다
        if answer[1] > value {
            answer = [summit,value]
        } else if answer[1] == value {
        // 만약 같은 적은값이라면 산봉우리의 번호가 작은걸 고른다
            answer = [min(answer[0],summit), value]
        }
    }
    return answer
}
```
