bfs를 이용해 풀이해보았다.   
2%에서 시간초과 발생   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var board = Array(repeating: Array(repeating: "", count: n), count: m)
    var visited = Array(repeating: Array(repeating: false, count: n), count: m)
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
        visited[start.0][start.1] = true
        var before = 0
        var idx = 0
        
        while (q.count > idx) {
            let now = q[idx]
            idx += 1
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
            
            if (now.0 == m-1 || now.1 == n-1 || now.0 == 0 || now.1 == 0) {
//                print(q)
//                print("벽 만남", now)
                result = now.2 + 1
                break
            }
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<m).contains(newY) && (0..<n).contains(newX) {
                    if board[newY][newX] != "#" && board[newY][newX] != "F" {
                        if !visited[newY][newX] {
                            q.append((newY,newX,now.2 + 1))
                            visited[newY][newX] = true
                        }
                        
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
불이 먼저 이동하는게 해당 과정을 풀이할 수 있을것 같았다.   
5 5   
#F..#   
#.J.#   
###.#   
###.#   
###.#   
일때 5가 정답인데 위의 코드는 2가 나온다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (m,n) = (input[0],input[1])
    var board = Array(repeating: Array(repeating: "", count: n), count: m)
    var visited = Array(repeating: Array(repeating: false, count: n), count: m)
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
        visited[start.0][start.1] = true
        var before = 0
        var idx = 0
        
        while (q.count > idx) {
            let now = q[idx]
            idx += 1
            //print(now)
            // 불 확산
            if now.2 == before {
                //print("불 확산")
                fireQ = moveFire(fireQ)
//                for i in 0..<m {
//                    print(board[i])
//                }
                before += 1
            }
            
            if (now.0 == m-1 || now.1 == n-1 || now.0 == 0 || now.1 == 0) {
//                print(q)
//                print("벽 만남", now)
                result = now.2 + 1
                break
            }
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<m).contains(newY) && (0..<n).contains(newX) {
                    if board[newY][newX] != "#" && board[newY][newX] != "F" {
                        if !visited[newY][newX] {
                            q.append((newY,newX,now.2 + 1))
                            visited[newY][newX] = true
                        }
                        
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
한참을 헤맸는데 결국 fire의 번짐 로직이 잘못된것이었다.   
tempQ를 이용해 이미 이동한 곳들은 큐에서 빼줬어야 시간초과가 발생하지 않는다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (m,n) = (input[0],input[1])
    var board = Array(repeating: Array(repeating: "", count: n), count: m)
    var fireQ: [(Int,Int)] = []
    for i in 0..<m {
        let input = Array(readLine()!).map{String($0)}
        for j in 0..<n {
            board[i][j] = input[j]
            if input[j] == "J" {
                start = (i,j)
                board[i][j] = "."
            }
            if input[j] == "F" {
                fireQ.append((i,j))
            }
        }
    }
    //print(board)
    //print(start)
    
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var result = -1
    
    func bfs() {
        var q: [(Int,Int,Int)] = []
        q.append((start.0, start.1,0))
        visited[start.0][start.1] = true
        var before = 0
        var idx = 0
        
        while (q.count > idx) {
            let now = q[idx]
            idx += 1
            //print(now)
            // 불 확산
            if now.2 == before {
                //print("불 확산")
                var tempFireList: [(Int,Int)] = []
                for fire in fireQ {
                    for j in 0..<4 {
                        let fy = fire.0 + dy[j]
                        let fx = fire.1 + dx[j]
                        if (0..<m).contains(fy) && (0..<n).contains(fx) {
                            if board[fy][fx] == "." {
                                board[fy][fx] = "F"
                                tempFireList.append((fy,fx))
                            }
                        }
                    }
                }
                fireQ = tempFireList
                before += 1
            }
            
            if (now.0 == m-1 || now.1 == n-1 || now.0 == 0 || now.1 == 0) {
                //                print(q)
                //                print("벽 만남", now)
                result = now.2 + 1
                break
            }
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<m).contains(newY) && (0..<n).contains(newX) {
                    if board[newY][newX] == "." && !visited[newY][newX] {
                        q.append((newY,newX,now.2 + 1))
                        visited[newY][newX] = true
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
