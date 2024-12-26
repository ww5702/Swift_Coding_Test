애니팡같은 게임이다.   
지우는건 bfs로 진행하였고   
지워진 결과값이 존재한다면 칸을 밑으로 내린다.   

```
import Foundation
func solution(){
    var board: [[String]] = []
    for _ in 0..<12 {
        let input = readLine()!.map{String($0)}
        board.append(input)
    }
    //print(board)
    var visited = Array(repeating: Array(repeating: false, count: 6), count: 12)
    var result = 0
    var tempQ: [(Int,Int)] = []
    
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    func bfs(_ y: Int, _ x: Int) -> Int {
        var q: [(Int,Int)] = []
        let color = board[y][x]
        var idx = 0
        visited[y][x] = true
        q.append((y,x))
        
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<12).contains(newY) && (0..<6).contains(newX) {
                    if !visited[newY][newX] && board[newY][newX] == color {
                        visited[newY][newX] = true
                        q.append((newY,newX))
                    }
                }
            }
        }
        tempQ = q
        return q.count
    }
    
    func moveBoard() {
        for i in 0..<6 {
            for j in (1..<12).reversed() {
                if board[j][i] != "." { continue }
                var k = j-1
                while k >= 0 {
                    if board[k][i] == "." { k -= 1; continue }
                    board[j][i] = board[k][i]
                    board[k][i] = "."
                    break
                }
            }
        }
    }
    
    while true {
        visited = Array(repeating: Array(repeating: false, count: 6), count: 12)
        var isMove = false
        for i in 0..<12 {
            for j in 0..<6 {
                tempQ = []
                if board[i][j] != "." && !visited[i][j] {
                    //print(i,j, board[i][j])
                    if bfs(i, j) >= 4 {
                        //print(tempQ)
                        isMove = true
                        for q in tempQ {
                            board[q.0][q.1] = "."
                        }
                    }
                    
                }
                
            }
        }
        
        // 연쇄작용없으면 탈출
        if !isMove { break }
        result += 1
        
//        for i in 0..<12 {
//            print(board[i])
//        }
//        print()
        
        // 내리기
        moveBoard()
        
        
//        for i in 0..<12 {
//            print(board[i])
//        }
        
        
    }
    
    print(result)
}
solution()
/*

 
 */

```
