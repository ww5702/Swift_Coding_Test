bfs를 통해 연합국가가 될 수 있는 Union을 구해준다.   
구해준 union이 2개 이상이라면 하루가 걸리면서 인구 이동이 가능하게 되므로   
해당 인구수를 board에 새로 적용시켜준다.   
인구 이동이 있었더라면 check = true를 통해 무한 루프를 돌 수 있도록 한다.   
이동이 없더라면 break   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,l,r) = (input[0],input[1],input[2])
    var board: [[Int]] = Array(repeating: [], count: n)
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        board[i] = input
    }
    //print(board)
    
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var day = 0
    
    func bfs(_ y: Int, _ x: Int) -> Int {
        var q: [(Int,Int)] = []
        var idx = 0
        var union: [(Int,Int)] = []
        var people = 0
        people += board[y][x]
        q.append((y,x))
        union.append((y,x))
        visited[y][x] = true
        
        while q.count > idx {
            let cur = q[idx]
            idx += 1
    
            for i in 0..<4 {
                let newY = cur.0 + dy[i]
                let newX = cur.1 + dx[i]
                
                if (0..<n).contains(newY) && (0..<n).contains(newX) {
                    if !visited[newY][newX] {
                        if (l...r).contains(abs(board[cur.0][cur.1] - board[newY][newX])) {
                            visited[newY][newX] = true
                            q.append((newY,newX))
                            union.append((newY,newX))
                            people += board[newY][newX]
                        }
                    }
                }
            }
        }
        
        // 연합 국가에 포함되는 국가가 있다면
        let unionPeople = Int(floor(Double(people) / Double(union.count)))
        for u in union {
            board[u.0][u.1] = unionPeople
        }
        
        return union.count
    }
    
    while true {
//        print("인구이동 \(day)일차")
//        print(board)
//        print()
        visited = Array(repeating: Array(repeating: false, count: n), count: n)
        var check = false
        for i in 0..<n {
            for j in 0..<n {
                if !visited[i][j] {
                    if bfs(i,j) >= 2 { check = true }
                }
               
            }
        }
        
        if !check { break }
        day += 1
        
        
    }
    
    print(day)
}
solution()

/*
 2 20 50
 50 30
 20 40
 
 2 40 50
 50 30
 20 40
 
 2 20 50
 50 30
 30 40
 
 3 5 10
 10 15 20
 20 30 25
 40 22 10
 */


```
