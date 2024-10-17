그냥 구현으로 풀이해봤는데 결과는 틀렸다.   
(치즈 안에 있는 내부 공기는 취급을 안해준다는 조건을 빼먹었다.)   

```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0], nm[1])
    var board = Array(repeating: Array(repeating: 0, count: m), count: n)
    for i in 0..<n {
        let value = readLine()!.split(separator: " ").map{Int(String($0))!}
        for j in 0..<n {
            board[i][j] = value[j]
        }
    }
    
    func isEnd() -> Bool {
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == 1 { return false }
            }
        }
        
        return true
    }
    
    var time = 0
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    while true {
        if isEnd() { break }
        time += 1
        var q: [(Int,Int)] = []
        for i in 0..<n {
            for j in 0..<m {
                
                if board[i][j] == 1 {
                    
                    var cnt = 0
                    for k in 0..<4 {
                        let newY = i+dy[k]
                        let newX = j+dx[k]
                        if (0..<n).contains(newY) && (0..<m).contains(newX) {
                            if board[newY][newX] == 0 {
                                cnt += 1
                            }
                        }
                    }
                    
                    if cnt >= 2 { q.append((i,j)) }
                }
            }
        }
        //print(q)
        
        for i in 0..<q.count {
            let now = q[i]
            board[now.0][now.1] = 0
        }
        
        
//        for i in 0..<n {
//            print(board[i])
//        }
    }
    print(time)
    
}

solution()
/*
 8 9
 0 0 0 0 0 0 0 0 0
 0 0 0 1 1 0 0 0 0
 0 0 0 1 1 0 1 1 0
 0 0 1 1 1 1 1 1 0
 0 0 1 1 1 1 1 0 0
 0 0 1 1 0 1 1 0 0
 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0
 
 */


```
내부 공기인지를 확인하기 위한 bfs를 추가구현했다   
하지만 13프로에서 런타임에러 발생   
```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0], nm[1])
    var board = Array(repeating: Array(repeating: 0, count: m), count: n)
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    for i in 0..<n {
        let value = readLine()!.split(separator: " ").map{Int(String($0))!}
        for j in 0..<n {
            board[i][j] = value[j]
        }
    }
    
    func isEnd() -> Bool {
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == 1 { return false }
            }
        }
        
        return true
    }
    
    func findAir(_ y: Int, _ x: Int) -> Bool {
        var q: [(Int,Int)] = []
        var idx = 0
        q.append((y,x))
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        visited[y][x] = true
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0+dy[i]
                let newX = now.1+dx[i]
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    if newY == 0 || newY == n-1 || newX == 0 || newX == m-1 { return true }
                    
                    if !visited[newY][newX] && board[newY][newX] == 0{
                        visited[newY][newX] = true
                        q.append((newY,newX))
                    }
                    
                }
            }
        }
        
        return false
    }
    
    var time = 0
    
    while true {
        if isEnd() { break }
        time += 1
        var q: [(Int,Int)] = []
        for i in 0..<n {
            for j in 0..<m {
                
                if board[i][j] == 1 {
                    
                    var cnt = 0
                    for k in 0..<4 {
                        let newY = i+dy[k]
                        let newX = j+dx[k]
                        if (0..<n).contains(newY) && (0..<m).contains(newX) {
                            if board[newY][newX] == 0 && findAir(newY, newX){
                                cnt += 1
                            }
                        }
                    }
                    
                    if cnt >= 2 { q.append((i,j)) }
                }
            }
        }
        //print(q)
        
        for i in 0..<q.count {
            let now = q[i]
            board[now.0][now.1] = 0
        }
        
        
//        for i in 0..<n {
//            print(board[i])
//        }
    }
    print(time)
    
}

solution()
/*
 8 9
 0 0 0 0 0 0 0 0 0
 0 0 0 1 1 0 0 0 0
 0 0 0 1 1 0 1 1 0
 0 0 1 1 1 1 1 1 0
 0 0 1 1 1 1 1 0 0
 0 0 1 1 0 1 1 0 0
 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0
 
 
 8 9
 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0
 0 1 1 0 0 0 1 1 0
 0 1 0 1 1 1 0 1 0
 0 1 0 0 1 0 0 1 0
 0 1 0 1 1 1 0 1 0
 0 1 1 0 0 0 1 1 0
 0 0 0 0 0 0 0 0 0
 
 
 7 7
 0 0 0 0 0 0 0
 0 0 0 1 0 0 0
 0 0 1 0 1 0 0
 0 1 0 1 0 1 0
 0 0 1 0 1 0 0
 0 0 0 1 0 0 0
 0 0 0 0 0 0 0
 
 */


```
