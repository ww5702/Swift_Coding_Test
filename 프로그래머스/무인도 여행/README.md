```
import Foundation

func solution(_ maps:[String]) -> [Int] {
    let graph = maps.reduce(into: [[Character]]()) {result, map in
                                                  result.append(Array(map))
                                                  }
    let row = graph.count
    let col = graph[0].count
    // 상하좌우에 따른 x,y좌표 변경
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var visited = Array(repeating:Array(repeating: Bool(), count: col), count: row)
    //var visited = [[Bool]](repeating:[Bool](repeating:false, count: col), count: row)

    // 완전 탐색
    func dfs(_ x : Int, _ y: Int) -> Int {
        if graph[x][y] == "X" { return 0 }
        var sum = Int(graph[x][y].asciiValue!) - 48
        visited[x][y] = true
        for i in dx.indices {
            let nx = x+dx[i]
            let ny = y+dy[i]
            if nx >= row || nx < 0 || ny >= col || ny < 0 { continue }
            if visited[nx][ny] {continue}
            sum += dfs(nx,ny)
        }
        return sum
    }
    
    var answer: [Int] = []
    // 이제 인접한 값들 더해주기
    for i in 0..<row {
        for j in 0..<col {
            // 방문했거나 X(바다)라면 반복문 탈출
            if visited[i][j] || graph[i][j] == "X" {continue}
            let sum = dfs(i,j)
            if sum > 0 {
                answer.append(sum)
            }
        }
    }

    return answer.isEmpty ? [-1] : answer.sorted()
}
```
전형적인 완전탐색 알고리즘   
