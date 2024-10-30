단순한 bfs문제이다.   

```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (m,n) = (nm[0],nm[1])
    
    var board: [[String]] = []
    for _ in 0..<n {
        board.append(readLine()!.map{String($0)})
    }
    //print(board)
    
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var homeTeam = 0
    var awayTeam = 0
    
    func bfs(_ y: Int, _ x: Int) -> Int {
        var q: [(Int,Int)] = []
        var idx = 0
        q.append((y,x))
        let team = board[y][x]
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    if !visited[newY][newX] && board[newY][newX] == team {
                        q.append((newY,newX))
                        visited[newY][newX] = true
                    }
                }
            }
        }
        
        return idx
    }
    
    
    for i in 0..<n {
        for j in 0..<m {
            if !visited[i][j] {
                visited[i][j] = true
                let num = bfs(i, j)
                if board[i][j] == "W" {
                    homeTeam += (num*num)
                } else {
                    awayTeam += (num*num)
                }
            }
        }
    }
    
    
    print("\(homeTeam) \(awayTeam)")
}

solution()
/*
 */

```
