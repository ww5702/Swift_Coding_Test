bfs문제이다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var map: [[String]] = Array(repeating: [], count: n)
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    for i in 0..<n {
        let input = Array(readLine()!).map{String($0)}
        map[i] = input
    }
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var normal = 0
    for i in 0..<n {
        for j in 0..<n {
            if (!visited[i][j]) {
                bfs(i,j,map[i][j], "normal")
                normal += 1
            }
        }
    }
    
    //print(normal)
    var notnormal = 0
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
    for i in 0..<n {
        for j in 0..<n {
            if (!visited[i][j]) {
                bfs(i,j,map[i][j], "notnormal")
                notnormal += 1
            }
        }
    }
    //print(notnormal)
    
    func bfs(_ y: Int, _ x: Int, _ color: String, _ version: String) {
        var colorArr: [String] = []
        if version == "normal" {
            colorArr.append(color)
        } else {
            if (color == "G" || color == "R") {
                colorArr.append("R")
                colorArr.append("G")
            } else {
                colorArr.append("B")
            }
        }
        var q: [(Int,Int)] = []
        q.append((y,x))
        visited[y][x] = true
        var idx = 0
        while (q.count > idx) {
            let now = q[idx]
            idx += 1
            for i in 0..<4 {
                let ny = now.0 + dy[i]
                let nx = now.1 + dx[i]
                
                if (0..<n).contains(ny) && (0..<n).contains(nx) {
                    if !visited[ny][nx] && colorArr.contains(map[ny][nx]) {
                        visited[ny][nx] = true
                        q.append((ny,nx))
                    }
                }
                
            }
        }
    }
    print(normal, notnormal)
}
solution()


```
