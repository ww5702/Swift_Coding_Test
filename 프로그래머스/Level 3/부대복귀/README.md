graph로 연결되어있는 도로를 설정해주고   
dfs를 이용해 최단거리를 계속해서 갱신해주는 프로그램으로 처음을 생각해보았다.   
```
import Foundation

func solution(_ n:Int, _ roads:[[Int]], _ sources:[Int], _ destination:Int) -> [Int] {
    // 각 도로가 어떻게 연결되어있는지
    var graph = [[Int]](repeating: [Int](), count : n+1)
    for road in roads {
        graph[road[0]].append(road[1])
        graph[road[1]].append(road[0])
    }
    //print(graph)
    var distance = Array(repeating: 987654321, count : n+1)
    var visited = Array(repeating: false, count : n+1)
    var cnt = 1
    // destination에서 역으로 sources까지 최단 거리가 어떻게 되는지
    func dfs(_ now: Int, _ value: Int) {
        visited[now] = true
        //print(now, value)
        if distance[now] > value { 
            distance[now] = value
            //print("변화", now, distance[now])
        }
        for road in graph[now] {
            if !visited[road] {
                dfs(road, value+1)
            }
        }
    }
    distance[destination] = 0
    for road in graph[destination] {
        cnt = 1
        visited = Array(repeating: false, count: n+1)
        dfs(road,cnt)
        //print(distance)
    }
    var result: [Int] = []
    for source in sources {
        distance[source] != 987654321 ? result.append(distance[source]) : result.append(-1)
    }
    //print(result)
    return result
}
```
