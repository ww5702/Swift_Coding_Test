```
import Foundation
func solution() {
    let nmh = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m,h) = (nmh[0],nmh[1],nmh[2])
    
    var board = Array(repeating: Array(repeating: true, count: m+1), count: n+2)

    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board[input[0]][input[1]] = false
        board[input[0]][input[1]+1] = false
    }
    
    for i in 0...n+1 {
        print(board[i])
    }
    
    // 가능한 선의 갯수 파악
    var list: [(Int,Int)] = []
    for i in 1..<n {
        for j in 1...m {
            
        }
    }
    
    // 가로선이 3개보다 더 크면 -1 즉 0,1,2,3 까지만 확인
    var isEnd = false
    
    
    
    while !isEnd {
        
        
        
        
        break
    }
    
    
}

solution()
/*
 5 5 6
 1 1
 3 2
 2 3
 5 1
 5 4
 */


```
