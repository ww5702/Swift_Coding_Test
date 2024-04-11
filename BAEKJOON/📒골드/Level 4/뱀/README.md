bfs문제이다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let k = Int(readLine()!)!
    var board = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for _ in 0..<k {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        board[input[0]-1][input[1]-1] = 2
    }
    let l = Int(readLine()!)!
    var move_dir = [Int: Int]()
    for _ in 0..<l {
        let data = readLine()!.split(separator: " ")
        move_dir[Int(data[0])!] = data[1] == "D" ? 1 : 3
    }
    // 동 남 서 북
    var d = 0
    let dy = [0,1,0,-1]
    let dx = [1,0,-1,0]
    var (y,x) = (0,0)
    
    var snake: [(Int,Int)] = []
    snake.append((y,x))
    board[y][x] = 1
    
    var answer = 0
    
    while true {
        answer += 1
        y = y + dy[d]
        x = x + dx[d]
        if !(0..<n).contains(y) || !(0..<n).contains(x) || board[y][x] == 1 { break }
        
        if board[y][x] == 0 {
            snake.append((y,x))
            board[y][x] = 1
            snake.reverse()
            let dt = snake.removeLast()
            board[dt.0][dt.1] = 0
            snake.reverse()
            
        } else if board[y][x] == 2 {
        // 사과 만났을때
            snake.append((y,x))
            board[y][x] = 1
        }
        
        for (key,value) in move_dir {
            if answer == key {
                d = (d+value) % 4
            }
        }
    }
    
    print(answer)
}
solution()



```
