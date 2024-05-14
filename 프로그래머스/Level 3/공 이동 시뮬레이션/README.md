bfs로 이동하며 남은 이동횟수보다 더 적게 남았으면 false로 하였다.   
하지만 시간초과   

```
import Foundation

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ queries:[[Int]]) -> Int64 {
    let dy = [0,0,-1,1]
    let dx = [-1,1,0,0]
    var canMove = 0
    var tempMove = 0
    var result = 0
    
    for i in 0..<queries.count {
        canMove += queries[i][1]
    }
    //print(canMove)
    
    func bfs(_ nowY: Int, _ nowX: Int, _ queries: [[Int]]) -> Bool {
        var (ny, nx) = (nowY,nowX)
        for i in 0..<queries.count {
            let move = queries[i][0]
            for _ in 0..<queries[i][1] {
                let newY = ny + dy[move]
                let newX = nx + dx[move]
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    ny += dy[move]
                    nx += dx[move]
                }
                tempMove -= 1
                if (abs(x - ny) + abs(y - nx)) > tempMove {
                    return false
                }
            }
        }
        
        return ny == x && nx == y ? true : false
    }
    
    
    for i in 0..<n {
        for j in 0..<m {
            tempMove = canMove
            //print("시작",i,j)
            result += bfs(i,j,queries) ? 1 : 0
        }
    }
    
    return Int64(result)
}

```
