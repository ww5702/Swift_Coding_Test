dfs로 풀이헀으나 실패   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let nmw = readLine()!.split(separator: " ").map{Int(String($0))!}
        let (n,m,w) = (nmw[0],nmw[1],nmw[2])
        var board = Array(repeating: [(Int,Int)](),count: n+1)
        for _ in 0..<m {
            let input = readLine()!.split(separator: " ").map{Int(String($0))!}
            board[input[0]].append((input[1],input[2]))
        }
        for _ in 0..<w {
            let input = readLine()!.split(separator: " ").map{Int(String($0))!}
            board[input[0]].append((input[1],-input[2]))
        }
        
//        for i in 0..<n+1 {
//            print(board[i])
//        }
        
        var isPossible = false
        var visited = Array(repeating: false, count: n+1)
        func dfs(_ start: Int, _ now: Int, _ time: Int, _ cnt: Int) {
            //print(start,now,time,cnt)
            if cnt != 0 && start == now {
                if time < 0 {
                    //print(time)
                    isPossible = true
                    return
                }
            }
            
            for next in board[now] {
                if !visited[next.0] {
                    visited[next.0] = true
                    dfs(start, next.0, time+next.1, cnt+1)
                    visited[next.0] = false
                }
            }
            
            return
        }
        
        
        for i in 1...n {
            //print(i)
            isPossible = false
            visited = Array(repeating: false, count: n+1)
            dfs(i, i,0,0)
            //print(isPossible)
            if isPossible {
                break
            }
        }
        
        if isPossible {
            print("YES")
        } else {
            print("NO")
        }
        
    }
}

solution()

```
