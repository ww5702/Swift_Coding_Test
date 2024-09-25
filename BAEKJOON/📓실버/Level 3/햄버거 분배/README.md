dfs로 풀어야한다는 압박감이 있었던게 아닐까   
제일 쉽게 생각하면 제일 많은 버거를 가져가려면 최대한 본인 앞에서 고르는것이다.   

```
import Foundation
func solution() {
    let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,k) = (nk[0],nk[1])
    var arr = Array(readLine()!)
    print(arr)
    var visited = Array(repeating: false, count: n)
    var board: [Int] = []
    for i in 0..<n {
        if arr[i] == "P" {
            visited[i] = true
        } else {
            board.append(i)
        }
    }
    print(visited)
    
    
    func dfs(_ index: Int, _ cnt: Int) {
        if index == board.count {
            print(cnt)
            return
        }
        
        let idx = board[index]
        
        if idx - k < 0 {
            if idx + k >= n {
                for i in 0..<n {
                    if !visited[i] {
                        visited[i] = true
                        dfs(index+1, cnt+1)
                        visited[i] = false
                    }
                }
                
            } else {
                for i in 0...idx+k {
                    visited[i] = true
                    dfs(index+1, cnt+1)
                    visited[i] = false
                }
            }
            
        } else {
            if idx + k >= n {
                for i in idx-k..<n {
                    visited[i] = true
                    dfs(index+1, cnt+1)
                    visited[i] = false
                }
            } else {
                for i in idx-k...idx+k {
                    visited[i] = true
                    dfs(index+1, cnt+1)
                    visited[i] = false
                }
            }
        }
    }
    
    dfs(0, 0)
}

solution()
/*
 */


```
