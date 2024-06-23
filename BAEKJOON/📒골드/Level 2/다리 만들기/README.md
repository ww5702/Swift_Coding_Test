bfs를 2개를 쓴다.   
먼저 연결된 섬들의 고유 번호를 지정해주기 위해 bfs를 사용한다.   
그리고 각 섬에서 다른 섬까지 가는 최단거리를 구하기 위해 bfs2를 사용한다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board: [[Int]] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append(input)
    }
    var cnt = 1
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    func bfs(_ y: Int, _ x: Int) {
        var q: [(Int,Int)] = []
        q.append((y,x))
        visited[y][x] = true
        board[y][x] = cnt
        var idx = 0
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<n).contains(newY) && (0..<n).contains(newX) {
                    if !visited[newY][newX] && board[newY][newX] != 0 {
                        q.append((newY,newX))
                        board[newY][newX] = cnt
                        visited[newY][newX] = true
                    }
                }
            }
        }
    }
    
    func bfs2(_ y: Int, _ x: Int, _ num: Int) -> Int{
        visited = Array(repeating: Array(repeating: false, count: n), count: n)
        var q: [(Int,Int,Int)] = []
        q.append((y,x,0))
        var idx = 0
        visited[y][x] = true
        
        while q.count > idx {
            let now = q[idx]
            //print(now)
            idx += 1
            if now.2 >= result {
                return -1
            }
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                //print(newY,newX)
                
                if (0..<n).contains(newY) && (0..<n).contains(newX) {
                    if board[newY][newX] != 0 && board[newY][newX] != num {
                        //print("만남", now, newY,newX)
                        return now.2
                    }
                    if !visited[newY][newX] && board[newY][newX] != num {
                        q.append((newY,newX,now.2+1))
                        visited[newY][newX] = true
                    }
                }
                
            }
        }
        return -1
    }
    
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] && board[i][j] != 0 {
                bfs(i,j)
                cnt += 1
            }
        }
    }

    var result = Int.max
    //print(bfs2(0, 2, board[0][2]))
    for i in 0..<n {
        for j in 0..<n {
            if board[i][j] != 0 {
                let cost = bfs2(i, j, board[i][j])
                if cost != -1 {
                    result = min(result, cost)
                }
            }
            
        }
    }
    print(result)
}

solution()
/*
 */

```
