그냥 가로세로대각선을 검사하면 끝인줄 알았으나 생각할것이 많았다.   
육목을 일단 확인해주었어야했고, 대각선도 오른쪽 밑대각선, 왼쪽밑 대각선 두개를 확인해봤어야했다.   
구현문제이다.  
계속 8프로에서 실패   

```
import Foundation
func solution() {
    var board = Array(repeating: Array(repeating: 0, count: 19), count: 19)
    for i in 0..<19 {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board[i] = input
    }
    var result = 0
    var (resultY, resultX) = (-1,-1)
    
    for i in 0..<19 {
        for j in 0..<19 {
            if resultY != -1 && resultX != -1 { break }
            if board[i][j] != 0 {
                if j+5 <= 19 && checkGaro(i, j, board[i][j]) {
                    result = board[i][j]
                    (resultY, resultX) = (i+1,j+1)
                    break
                }
                if i+5 <= 19 && checkSero(i, j, board[i][j]) {
                    result = board[i][j]
                    (resultY, resultX) = (i+1,j+1)
                    break
                }
                if i+5 <= 19 && j+5 <= 19 && checkDae(i, j, board[i][j]) {
                    result = board[i][j]
                    (resultY, resultX) = (i+1,j+1)
                    break
                }
                if i+5 <= 19 && j-4 >= 0 && checkDae2(i, j, board[i][j]) {
                    result = board[i][j]
                    (resultY, resultX) = (i+1,j+1)
                    break
                }
            }
        }
    }
    
    if result != 0 {
        print(result)
        print("\(resultY) \(resultX)")
    } else {
        print(result)
    }
    
    func checkGaro(_ y: Int, _ x: Int, _ num: Int) -> Bool {
        if x-1 >= 0 {
            if board[y][x-1] == num { return false }
        }
        
        
        for i in 1...4 {
            if board[y][x+i] != num {
                return false
            }
        }
        
        if x+5 <= 18 {
            if board[y][x+5] == num { return false }
        }
        
        
        return true
    }
    func checkSero(_ y: Int, _ x: Int, _ num: Int) -> Bool{
        if y-1 >= 0 {
            if board[y-1][x] == num { return false }
        }
        
        
        for i in 1...4 {
            if board[y+i][x] != num {
                return false
            }
        }
        
        if y+5 <= 18 {
            if board[y+5][x] == num { return false }
        }
        
        
        return true
    }
    func checkDae(_ y: Int, _ x: Int, _ num: Int) -> Bool{
        if x-1 >= 0 && y-1 >= 0 {
            if board[y-1][x-1] == num { return false }
        }
        
        
        for i in 1...4 {
            if board[y+i][x+i] != num {
                return false
            }
        }
        
        if y+5 <= 18 && x+5 <= 18 {
            if board[y+5][x+5] == num { return false }
        }
        
        return true
    }
    func checkDae2 (_ y: Int, _ x: Int, _ num: Int) -> Bool{
        if x+1 >= 0 && y-1 >= 0 {
            if board[y-1][x+1] == num { return false }
        }
        
        
        for i in 1...4 {
            if board[y+i][x-i] != num {
                return false
            }
        }
        
        if y+5 <= 18 && x-5 >= 0 {
            if board[y+5][x-5] == num { return false }
        }
        
        return true
    }
    
    
}

solution()
/*
 */

```
