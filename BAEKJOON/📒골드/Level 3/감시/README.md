구현, 완전탐색, dfs문제이다.   
cctv번호에 따라 확인하는 방향이 다르다.   
그리고 각 cctv가 순간적으로 바라보는 방향이 다를 수 있다.   
따라서 완전탐색을 통해 어느 방향을 바라보는지 하나하나 구해야한다.   
cctv는 최대 8개라 완전탐색이 가능하다.   
벽을 통과할 수 없다는 예외경우나, 좌우, 상하로 나눠져 확인하는 움직임을 따로 구현한다.   

```
import Foundation
func solution() {
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var board = Array(repeating: Array(repeating: "0", count: m), count: n)
    var list = [(Int,Int)]()
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{String($0)}
        for j in 0..<m {
            if ["1","2","3","4","5"].contains(input[j]) {
                list.append((i,j))
            }
            board[i][j] = input[j]
        }
    }
    var result = n*m
    
    
    //print(list)
    
    func dfs(_ board: [[String]], _ depth: Int) {
        if depth == list.count {
//            for i in 0..<n {
//                print(board[i])
//            }
            let sum = checkEnd(board)
            //print("완료", sum)
            result = min(sum, result)
            
            return
        }
        
        let now = list[depth]
        let (nowY, nowX) = (now.0, now.1)
        let num = board[nowY][nowX]
        // cctv 번호
        if num == "1" {
            for i in 0..<4 {
                dfs(cctv1Range(i, nowY, nowX, board), depth+1)
            }
        } else if num == "2" {
            for i in 0..<2 {
                dfs(cctv2Range(i, nowY, nowX, board), depth+1)
            }
            
        } else if num == "3" {
            for i in 0..<4 {
                dfs(cctv3Range(i, nowY, nowX, board), depth+1)
            }
            
        } else if num == "4" {
            for i in 0..<4 {
                dfs(cctv4Range(i, nowY, nowX, board), depth+1)
            }
        } else if num == "5" {
            dfs(cctv5Range(nowY, nowX, board), depth+1)
        }
        
        
    }
    
    func moveRight(_ y: Int, _ x: Int, _ board: [[String]]) -> [[String]] {
        var board = board
        for i in x+1..<m {
            if board[y][i] == "6" { break }
            if board[y][i] == "0" { board[y][i] = "#" }
        }
        return board
    }
    func moveLeft(_ y: Int, _ x: Int, _ board: [[String]]) -> [[String]] {
        var board = board
        for i in (0..<x).reversed() {
            if board[y][i] == "6" { break }
            if board[y][i] == "0" { board[y][i] = "#" }
        }
        return board
    }
    func moveUp(_ y: Int, _ x: Int, _ board: [[String]]) -> [[String]] {
        var board = board
        for i in (0..<y).reversed() {
            if board[i][x] == "6" { break }
            if board[i][x] == "0" { board[i][x] = "#" }
        }
        return board
    }
    func moveDown(_ y: Int, _ x: Int, _ board: [[String]]) -> [[String]] {
        var board = board
        for i in y+1..<n {
            if board[i][x] == "6" { break }
            if board[i][x] == "0" { board[i][x] = "#" }
        }
        return board
    }
    
    
    
    func cctv1Range(_ direction: Int, _ y: Int, _ x: Int, _ board: [[String]]) -> [[String]] {
        var board = board
        
        if direction == 0 {
            return moveRight(y, x, board)
        }
        
        if direction == 1 {
            return moveLeft(y, x, board)
        }
        
        if direction == 2 {
            return moveDown(y, x, board)
        }
        
        if direction == 3 {
            return moveUp(y, x, board)
        }
        
        return board
    }
    
    func cctv2Range(_ direction: Int, _ y: Int, _ x: Int, _ board: [[String]]) -> [[String]] {
        var board = board
        // 가로
        if direction == 0 {
            board = moveRight(y, x, board)
            board = moveLeft(y, x, board)
        }
        
        // 세로
        if direction == 1 {
            board = moveUp(y, x, board)
            board = moveDown(y, x, board)
        }
        
        return board
    }
    
    func cctv3Range(_ direction: Int, _ y: Int, _ x: Int, _ board: [[String]]) -> [[String]] {
        var board = board
        
        if direction == 0 {
            board = moveUp(y, x, board)
            board = moveRight(y, x, board)
        }
        if direction == 1 {
            board = moveRight(y, x, board)
            board = moveDown(y, x, board)
        }
        if direction == 2 {
            board = moveDown(y, x, board)
            board = moveLeft(y, x, board)
        }
        if direction == 3 {
            board = moveLeft(y, x, board)
            board = moveUp(y, x, board)
        }
        
        return board
    }
    
    func cctv4Range(_ direction: Int, _ y: Int, _ x: Int, _ board: [[String]]) -> [[String]] {
        var board = board
        
        if direction == 0 {
            board = cctv2Range(0, y, x, board)
            board = moveUp(y, x, board)
        }
        if direction == 1 {
            board = cctv2Range(1, y, x, board)
            board = moveRight(y, x, board)
        }
        if direction == 2 {
            board = cctv2Range(0, y, x, board)
            board = moveDown(y, x, board)
        }
        if direction == 3 {
            board = cctv2Range(1, y, x, board)
            board = moveLeft(y, x, board)
        }
        
        return board
    }
    
    func cctv5Range(_ y: Int, _ x: Int, _ board: [[String]]) -> [[String]] {
        var board = board
        board = cctv2Range(0, y, x, board)
        board = cctv2Range(1, y, x, board)
        return board
    }
    
    
    func checkEnd(_ board: [[String]]) -> Int {
        var cnt = 0
        for i in 0..<n {
            cnt += board[i].filter{$0 == "0"}.count
        }
        return cnt
    }
    
    
    dfs(board, 0)
    print(result)
}


solution()
/*
 */

```
