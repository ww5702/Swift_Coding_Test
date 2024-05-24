bfs를 이용해 풀이해보았다.   
2%에서 메모리 초과 발생   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var board = Array(repeating: Array(repeating: "", count: n), count: m)
    var start = (0,0)
    var fire = (0,0)
    for i in 0..<m {
        let input = Array(readLine()!).map{String($0)}
        for j in 0..<n {
            board[i][j] = input[j]
            if input[j] == "J" {
                start = (i,j)
                board[i][j] = "."
            }
            if input[j] == "F" {
                fire = (i,j)
            }
        }
    }
    //print(board)
    //print(start)
    
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var result = -1
    
    func moveFire(_ q: [(Int,Int)]) -> [(Int,Int)]{
        var q = q
        
        for i in 0..<q.count {
            let now = q[i]
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                if (0..<m).contains(newY) && (0..<n).contains(newX) {
                    if board[newY][newX] == "." {
                        board[newY][newX] = "F"
                        q.append((newY,newX))
                    }
                }
            }
        }
        
        return q
    }
    
    func bfs() {
        var q: [(Int,Int,Int)] = []
        var fireQ: [(Int,Int)] = []
        q.append((start.0, start.1,0))
        fireQ.append((fire.0, fire.1))
        var before = 0
        var idx = 0
        
        while (q.count > idx) {
            let now = q[idx]
            //print(now)
            // 불 확산
            if now.2 != before {
                //print("불 확산")
                fireQ = moveFire(fireQ)
//                for i in 0..<m {
//                    print(board[i])
//                }
                before += 1
            }
            
            if (now.0 == m-1 || now.1 == n-1) {
                //print(q)
                //print("벽 만남", now)
                result = now.2 + 1
                break
            }
            
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<m).contains(newY) && (0..<n).contains(newX) {
                    if board[newY][newX] != "#" && board[newY][newX] != "F"{
                        q.append((newY,newX,now.2 + 1))
                    }
                }
            }
            
        }
        
    }
    bfs()
    
    print(result == -1 ? "IMPOSSIBLE" : result)
}
solution()

```
