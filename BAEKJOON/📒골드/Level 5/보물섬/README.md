bfs로 각 지점에서 가장 멀리 갈 수 있는 곳으로 풀이를 하긴했는데 좀 느린느낌이 있다.   
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (input[0],input[1])
    var answer = -1
    var board: [[String]] = []
    for _ in 0..<n {
        //= Array(repeating: Array(repeating: "", count: n), count: m)
        let input = readLine()!.map{String($0)}
        board.append(input)
    }
    //print(board)
    var dis = Array(repeating: Array(repeating: -1, count: m), count: n)
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    for i in 0..<n {
        for j in 0..<m {
            if board[i][j] == "L" {
                visited = Array(repeating: Array(repeating: false, count: m), count: n)
                let cnt = bfs(i, j)
                answer = max(cnt, answer)
                //print(i,j,cnt)
            }
        }
    }
    
    print(answer)
    
    func bfs(_ y: Int, _ x: Int) -> Int{
        var q: [(Int,Int,Int)] = []
        q.append((y,x,0))
        var idx = 0
        visited[y][x] = true
        
        while (q.count > idx) {
            let now = q[idx]
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    if (board[newY][newX] == "L" && !visited[newY][newX]) {
                        q.append((newY,newX,now.2+1))
                        visited[newY][newX] = true
                    }
                }
            }
        }
        return q.last!.2
    }
}

solution()
/*
 */

```
