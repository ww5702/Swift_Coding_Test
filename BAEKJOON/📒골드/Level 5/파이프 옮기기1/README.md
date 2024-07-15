흔한 bfs문제이다.   
그대신 몸통이 2칸이고   
대각선으로 돌릴 수 있을뿐이다.   
   
89%였나 메모리초과가 발생한다.   
이는 board[n-1][n-1]이 이미 벽이 들어가있는 경우이다.   
해당 코드만 고쳐주니 풀이가 되었다.   

```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var board: [[Int]] = []
    for _ in 0..<n {
        var input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append(input)
    }
    //print(board)
    var l = (0,0)
    var r = (0,1)
    var cnt = 0;
    
    
    func bfs() {
        var q: [(Int,Int,Int,Int,Int)] = []
        q.append((0,0,0,1,0))
        var idx = 0
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            l = (now.0,now.1)
            r = (now.2,now.3)
            let d = now.4
            
            if r.0 == n-1 && r.1 == n-1 {
                cnt += 1
            }
            
            // 가로 세로 대각선
            if d == 0 {
                if r.1+1 < n && board[r.0][r.1+1] != 1 {
                    q.append((r.0, r.1, r.0, r.1+1, d))
                }
                
                if (r.1+1 < n && board[r.0][r.1+1] != 1) && (r.0+1 < n && board[r.0+1][r.1] != 1) && (board[r.0+1][r.1+1] != 1) {
                    q.append((r.0,r.1,r.0+1,r.1+1,2))
                }
                
            } else if d == 1 {
                if r.0+1 < n && board[r.0+1][r.1] != 1 {
                    q.append((r.0, r.1, r.0+1, r.1, d))
                }
                
                if (r.1+1 < n && board[r.0][r.1+1] != 1) && (r.0+1 < n && board[r.0+1][r.1] != 1) && (board[r.0+1][r.1+1] != 1) {
                    q.append((r.0,r.1,r.0+1,r.1+1,2))
                }
    
            } else {
                if r.1+1 < n && board[r.0][r.1+1] != 1 {
                    q.append((r.0, r.1, r.0, r.1+1, 0))
                }
                
                if r.0+1 < n && board[r.0+1][r.1] != 1 {
                    q.append((r.0, r.1, r.0+1, r.1, 1))
                }
                
                if (r.1+1 < n && board[r.0][r.1+1] != 1) && (r.0+1 < n && board[r.0+1][r.1] != 1) && (board[r.0+1][r.1+1] != 1) {
                    q.append((r.0,r.1,r.0+1,r.1+1,2))
                }
                
            }
        }
    }
    if board[n-1][n-1] == 1 {
        print(0)
    } else {
        bfs()
        print(cnt)
    }
    
}

solution()
/*

 */
