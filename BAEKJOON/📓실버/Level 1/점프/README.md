bfs로 풀이하면 메모리초과가 발생한다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board: [[Int]] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append(input)
    }
    
    var result = 0
    let dy = [1,0]
    let dx = [0,1]
    
    func bfs() {
        var q: [(Int,Int)] = []
        var idx = 0
        q.append((0,0))
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            if now == (n-1,n-1) {
                result += 1
                continue
            }
            
            if board[now.0][now.1] == 0 { continue }
            for i in 0..<2 {
                let num = board[now.0][now.1]
                let newY = now.0 + (dy[i] * num)
                let newX = now.1 + (dx[i] * num)
                
                if (0..<n).contains(newY) && (0..<n).contains(newX) {
                    q.append((newY,newX))
                }
            }
        }
    }
    bfs()
    print(result)
}
solution()
/*
 
 */

```
dp로 누적합 방식으로 풀이해야했다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board: [[Int]] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append(input)
    }
    var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
    dp[0][0] = 1
    
    for i in 0..<n {
        for j in 0..<n {
            if dp[i][j] != 0 && board[i][j] != 0 {
                let num = board[i][j]
                if i + num < n {
                    dp[i+num][j] += dp[i][j]
                }
                if j + num < n {
                    dp[i][j+num] += dp[i][j]
                }
            }
        }
    }
    print(dp[n-1][n-1])
}
solution()
/*
 
 */

```
