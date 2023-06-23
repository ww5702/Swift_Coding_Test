bfs문제로 풀이했다.   
```
import Foundation

func solution(_ maps:[String]) -> Int {
    let dx = [0,0,-1,1]
    let dy = [-1,1,0,0]
    var start = (0,0)
    var lever = (0,0)
    var graph: [[Character]] = []
    for (i,low) in maps.enumerated() {
        //print(i,low)
        if let j = Array(low).firstIndex(of: "S") {
            start = (j,i)
        }
        if let j = Array(low).firstIndex(of: "L") {
            lever = (j,i)
        }
        graph.append(Array(low))
    }
    print(start, lever)
    // print(graph)
    
    func bfs(start: (Int,Int), end: String) -> Int? {
        var distance: [[Int]] = Array(repeating: [Int](repeating: -1, count: maps[0].count), count : maps.count)
        var queue: [(Int,Int)] = []
        distance[start.1][start.0] = 0
        queue.append(start)
        
        while !queue.isEmpty {
            let (qx,qy) = queue.removeFirst()
            // 회전
            for i in 0..<4 {
                let nx = qx + dx[i]
                let ny = qy + dy[i]
                // 만약 nx가 0~maps[0].count 사이이고
                // ny가 0~maps.count 사이이면서
                // 방문한 맵이 X가 아니면서
                // 아직 밟지 않은 자리라면
                if 0..<maps[0].count ~= nx && 0..<maps.count ~= ny && graph[ny][nx] != "X" && distance[ny][nx] == -1 {
                    if graph[ny][nx] == Character(end) {
                        // 만약 레버나, 출구에 도착한다면 전 값에서 + 1
                        return distance[qy][qx] + 1
                    }
                    // 1칸 이동
                    distance[ny][nx] = distance[qy][qx] + 1
                    queue.append((nx,ny))
                }
            }
        }
        // end까지 갈수가 없었다.
        return nil
    }
    
    guard let time1 = bfs(start: start, end: "L") else { return -1 }
    guard let time2 = bfs(start: lever, end: "E") else { return -1}
    return time1 + time2
}

```
