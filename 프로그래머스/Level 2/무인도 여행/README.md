첫 제출   
DFS로 구현하여 풀이하였다.   
하지만 Int(maps[x][y])! 부분에서 core dumped가 난다.   
생각해보니 맵에서 X부분이 있는데 강제로 Int로 형 변환 시켜주려다 보니 오류가 나는것 같다.   
```
import Foundation

func solution(_ maps:[String]) -> [Int] {
    var maps = maps.map{$0.map{String($0)}}
    var visited = Array(repeating: Array(repeating: false, count: maps[0].count), count : maps.count)
    // 상하좌우
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    func search(_ x : Int, _ y: Int) -> Int {
        if maps[x][y] == "X" { return 0 }
        var sum = Int(maps[x][y])!
        
        visited[x][y] = true
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            // 만약 맵을 벗어났다면 pass
            if nx >= maps[0].count || nx < 0 || ny >= maps.count || ny < 0 { continue }
            // 만약 이동한 좌표가 방문했더라면 pass
            if visited[nx][ny] { continue }
            visited[nx][ny] = true
            sum += search(nx, ny)
        }
        return sum
    }
    var result: [Int] = []
    for i in 0..<maps[0].count {
        for j in 0..<maps.count {
            if visited[i][j] || maps[i][j] == "X" { continue }
            let sum = search(i, j)
            if sum > 0 {
                result.append(sum)
            }
        }
    }
    return result.isEmpty ? [-1] : result.sorted()
}
```
인줄 알았는데
core dumped는 앞서 말했던 것처럼 인덱스 범위의 오차때문에 생기는 경우가 대다수이다.   
여기서 인덱스 범위의 오류는 마지막 반복문에서 있었다.   
maps.count = 4   
maps[0].count = 5   
이기에 오류가 생기는것이었다.   
```
import Foundation

func solution(_ maps:[String]) -> [Int] {
    var maps = maps.map{$0.map{String($0)}}
    //print(maps.count)
    //print(maps[0].count)
    var visited = Array(repeating: Array(repeating: false, count: maps[0].count), count : maps.count)
    // 상하좌우
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    func search(_ x : Int, _ y: Int) -> Int {
        if maps[x][y] == "X" { return 0 }
        var sum = Int(maps[x][y])!
        visited[x][y] = true
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            // 만약 맵을 벗어났다면 pass
            if nx >= maps.count || nx < 0 || ny >= maps[0].count || ny < 0 { continue }
            // 만약 이동한 좌표가 방문했더라면 pass
            if visited[nx][ny] { continue }
            visited[nx][ny] = true
            sum += search(nx, ny)
        }
        return sum
    }
    var result: [Int] = []
    for i in 0..<maps.count {
        for j in 0..<maps[0].count {
            if visited[i][j] || maps[i][j] == "X" { continue}
            let sum = search(i, j)
            if sum > 0 {
                result.append(sum)
            }
        }
    }
    return result.isEmpty ? [-1] : result.sorted()
}
```
