bfs로 0부터 max높이까지 물을 높여가면서   
밟을수 있는 땅들의 개수를 세는 문제이다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var map = Array(repeating: Array(repeating: 0, count: n), count: n)
    var result = 0
    var start = 100, end = 0;
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        for j in 0..<n {
            map[i][j] = input[j]
            start = min(start, input[j])
            end = max(end, input[j])
        }
        
    }
    //print(map)
    //print(start, end)
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    
    for rain in 0...end {
        visited = Array(repeating: Array(repeating: false, count: n), count: n)
        var cnt = 0
        for i in 0..<n {
            for j in 0..<n {
                if map[i][j] > rain && !visited[i][j] {
                    visited[i][j] = true
                    cnt += 1
                    bfs(i,j,rain)
                }
            }
        }
        //print(rain, cnt)
        result = max(result, cnt)
//        for i in 0..<n {
//            print(visited[i])
//        }
        
    }
    
    print(result)
    
    
    func bfs(_ y: Int, _ x: Int, _ rain: Int) {
        var q: [(Int,Int)] = []
        q.append((y,x))
        var idx = 0
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            for i in 0..<4 {
                let ny = now.0 + dy[i]
                let nx = now.1 + dx[i]
                
                if (0..<n).contains(ny) && (0..<n).contains(nx) {
                    if map[ny][nx] > rain && !visited[ny][nx] {
                        visited[ny][nx] = true
                        q.append((ny,nx))
                    }
                }
                
            }
        }
        
    }
}
solution()

```
