조합을 통해 벽을 세울 수 있는 경우의 수를 구하고   
해당 벽을 통해 선생님이 4칸까지 봤을떄 학생이 있거나 벽이 있는지 판별   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board = Array(repeating: Array(repeating: "X", count: n), count: n)
    var students: [(Int,Int)] = []
    var teachers: [(Int,Int)] = []
    var result = "NO"
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{String($0)}
        for j in 0..<n {
            board[i][j] = input[j]
            if input[j] == "S" { students.append((i,j))}
            else if input[j] == "T" { teachers.append((i,j))}
        }
    }
    
    func combi(_ cnt: Int) {
        if cnt == 3 {
            let possible = bfs()
            if possible { result = "YES" }
            return
        }
        
        for i in 0..<n {
            for j in 0..<n {
                if board[i][j] == "X" {
                    board[i][j] = "O"
                    combi(cnt+1)
                    board[i][j] = "X"
                }
            }
        }
    }
    combi(0)
    
    func bfs() -> Bool {
        for teacher in teachers {
            let tY = teacher.0
            let tX = teacher.1
            
            var cnt = 1
            while cnt <= 4 && (0..<n).contains(tY+cnt) {
                if board[tY+cnt][tX] == "S" {
                    return false
                } else if board[tY+cnt][tX] == "O" {
                    break
                }
                
                cnt += 1
            }
            cnt = 1
            while cnt <= 4 && (0..<n).contains(tY-cnt) {
                if board[tY-cnt][tX] == "S" {
                    return false
                } else if board[tY-cnt][tX] == "O" {
                    break
                }
                
                cnt += 1
            }
            cnt = 1
            while cnt <= 4 && (0..<n).contains(tX+cnt) {
                if board[tY][tX+cnt] == "S" {
                    return false
                } else if board[tY][tX+cnt] == "O" {
                    break
                }
                
                cnt += 1
            }
            cnt = 1
            while cnt <= 4 && (0..<n).contains(tX-cnt) {
                if board[tY][tX-cnt] == "S" {
                    return false
                } else if board[tY][tX-cnt] == "O" {
                    break
                }
                
                cnt += 1
            }
        }
        return true
    }
    print(result)
}
solution()

/*
 4
 S S S T
 X X X X
 X X X X
 T T T X
 
 5
 X S X X T
 T X S X X
 X X X X X
 X T X X X
 X X T X X
 
 5
 X S X X T
 T X S X X
 X X X X X
 X T X X X
 X X T X X
 */


```
