bfs문제이다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var board = Array(repeating: Array(repeating: 0, count: m), count: n)
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        for j in 0..<m {
            board[i][j] = input[j]
        }
    }
    
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    
    func melting(_ board: [[Int]]) -> [[Int]]{
        var board = board
        // 빙하 녹이기
        var newBoard = Array(repeating: Array(repeating: 0, count: m), count: n)
        for i in 0..<n {
            for j in 0..<m {
                let now = board[i][j]
                var cnt = 0
                if now == 0 { continue }
                for k in 0..<4 {
                    let newY = i + dy[k]
                    let newX = j + dx[k]
                    if (0..<n).contains(newY) && (0..<m).contains(newX) {
                        if board[newY][newX] == 0 {
                            cnt += 1
                        }
                    }
                }
                newBoard[i][j] = cnt
            }
        }
        
//        for i in 0..<n {
//            print(newBoard[i])
//        }
        
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == 0 { continue }
                if board[i][j] >= newBoard[i][j] {
                    board[i][j] -= newBoard[i][j]
                } else {
                    board[i][j] = 0
                }
            }
        }
        
        return board
    }
    
    func bfs(_ y: Int, _ x: Int) {
        var q: [(Int,Int)] = []
        var idx = 0
        q.append((y,x))
        visited[y][x] = true
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    if !visited[newY][newX] && board[newY][newX] != 0 {
                        q.append((newY,newX))
                        visited[newY][newX] = true
                    }
                }
            }
        }
    }
    var time = 0
    while true {
        //print()
        var gameDone = true
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] != 0 {
                    gameDone = false
                    break
                }
            }
            if !gameDone { break }
        }
        
        if gameDone {
            print("0")
            break
        }
        
        time += 1
        board = melting(board)
//        for i in 0..<n {
//            print(board[i])
//        }
        visited = Array(repeating: Array(repeating: false, count: m), count: n)
        var cnt = 0
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] != 0 && !visited[i][j] {
                    cnt += 1
                    bfs(i,j)
                }
            }
        }
        
        // 2 조각 이상
        if cnt >= 2 {
            print(time)
            break
        }
        //print("빙산의 수", cnt)
    }
}
solution()

```
