dfs로 풀이하면서 길이를 1씩 증가시켜준다.   
T인 장소는 방문이 불가하다.   
거리가 K인 지점에 목표 장소에 도착했다면 +1 해준다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (N,M,K) = (input[0],input[1],input[2])
    var board = [[String]](repeating: [], count: N)
    var result = 0
    for i in 0..<N {
        let input = readLine()!
        board[i] = input.map{String($0)}
    }
    var start = (N-1, 0)
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1,1]
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    visited[N-1][0] = true
    //print(visited)
    func dfs(_ y: Int, _ x: Int, _ cnt: Int) {
        if cnt == K {
//            for i in 0..<N {
//                print(visited[i])
//            }
            if y == 0 && x == M-1 {
                result += 1
            }
            return
        }
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            if (0..<N).contains(ny) && (0..<M).contains(nx) {
                if !visited[ny][nx] && board[ny][nx] != "T" {
                    visited[ny][nx] = true
                    dfs(ny, nx, cnt + 1)
                    visited[ny][nx] = false
                }
            }
            
        }
        
    }
    
    dfs(N-1,0,1)
    print(result)
}
solution()



```
