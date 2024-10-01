하 구현이 더 힘들다..   
공기청정기가 밀면서 겹쳐지는 부분을 다시 짜봐야할거같다.   

```
import Foundation
func solution() {
    let nmt = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m,t) = (nmt[0], nmt[1], nmt[2])
    var (up,down) = ((-1,-1),(-1,-1))
    
    var board = Array(repeating: Array(repeating: 0, count: m), count: n)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        for j in 0..<m {
            board[i][j] = input[j]
            if input[j] == -1 {
                down = (i,j)
            }
        }
    }
    up = (down.0-1, down.1)
    
    print(up, down)
    for i in 0..<n {
        print(board[i])
    }
    
    func dustMove() {
        var newBoard = Array(repeating: Array(repeating: 0, count: m), count: n)
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] != -1 && board[i][j] != 0 {
                    var value = board[i][j]
                    var plus = value/5
                    var cnt = 0
                    // 상
                    if i-1 >= 0 && board[i-1][j] != -1 {
                        newBoard[i-1][j] += plus
                        cnt += plus
                    }
                    // 하
                    if i+1 < n && board[i+1][j] != -1 {
                        newBoard[i+1][j] += plus
                        cnt += plus
                    }
                    // 좌
                    if j-1 >= 0 && board[i][j-1] != -1 {
                        newBoard[i][j-1] += plus
                        cnt += plus
                    }
                    // 우
                    if j+1 < m && board[i][j+1] != -1 {
                        newBoard[i][j+1] += plus
                        cnt += plus
                    }
                    
                    // 나눠준만큼 뺴기
                    newBoard[i][j] -= cnt
                }
                
            }
        }
        for i in 0..<n {
            for j in 0..<m {
                board[i][j] += newBoard[i][j]
            }
        }
        
    }
    
    func machineMove() {
        var upY = up.0, upX = up.1
        // 윗기계 오른쪽이동
        var temp = board[upY][m-1]
        for i in stride(from: m-1, through: 2, by: -1) {
            board[upY][i] = board[upY][i-1]
        }
        
        board[upY][1] = 0
        var temp2 = board[0][m-1]
        for i in 0..<upY-1 {
            board[i][m-1] = board[i+1][m-1]
        }
        board[upY-1][m-1] = temp
        var temp3 = board[0][0]
        for i in 0..<m-1 {
            board[0][i] = board[0][i+1]
        }
        
        board[0][m-2] = temp2
        
        
        for i in stride(from: upY-1, to: 1, by: -1) {
            board[i][0] = board[i-1][0]
        }
        board[1][0] = temp3
        
        print("위에꺼는 완벽함")
        for i in 0..<n {
            print(board[i])
        }
        print()
        
        
        var downY = down.0, downX = down.1
        temp = board[downY][m-1]
        for i in stride(from: m-1, through: 2, by: -1) {
            board[downY][i] = board[downY][i-1]
        }
        board[downY][1] = 0
        
        temp2 = board[n-1][m-1]
        for i in stride(from: n-1, through: downY+1, by: 1) {
            board[i][m-1] = board[i-1][m-1]
        }
        board[downY+1][m-1] = temp
        
        temp3 = board[n-1][0]
        for i in 0..<m-1 {
            board[n-1][i] = board[n-1][i+1]
        }
        board[n-1][m-2] = temp2
        print(temp2)
        print("6")
        for i in 0..<n {
            print(board[i])
        }
        print()
        
        for i in downY+1..<n-2 {
            board[i][0] = board[i+1][0]
        }
        board[n-2][0] = temp3
        
        print("이동끝")
        for i in 0..<n {
            print(board[i])
        }
    }
    
    for _ in 0..<3 {
        print()
        //dustMove()
        
        for i in 0..<n {
            print(board[i])
        }
        
        machineMove()
    }
}

solution()
/*
 7 8 3
 0 1 2 3 4 5 6 7
 0 1 2 3 4 5 6 7
 -1 0 1 2 3 4 5 6
 -1 0 1 2 3 4 5 6
 0 1 2 3 4 5 6 7
 0 1 2 3 4 5 6 7
 0 1 2 3 4 5 6 7
 */


```
