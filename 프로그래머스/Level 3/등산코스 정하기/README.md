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
