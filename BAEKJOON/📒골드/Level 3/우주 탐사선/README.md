중복방문이 가능하다는게 특징인데 36프로에서 시간초과발생   

```
import Foundation
func solution(){
    let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,k) = (nk[0],nk[1])
    var board: [[Int]] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append(input)
    }
    var visited = Array(repeating: false, count: n)
    visited[k] = true
    var result = Int.max
    
    func isEnd() -> Bool{
        for i in 0..<n {
            if !visited[i] { return false }
        }
        return true
    }
    
    func dfs(_ idx: Int, _ sum: Int, _ cnt: Int) {
        if cnt >= n*n || sum >= result {
            return
        }
        
        if isEnd() {
            //print(sum)
            result = min(result, sum)
            return
        }
        
        for i in 0..<n {
            // 중복방문가능
            if !visited[i] {
                visited[i] = true
                dfs(i, sum+board[idx][i], cnt+1)
                visited[i] = false
                
            } else {
                dfs(i, sum+board[idx][i], cnt+1)
            }
        }
        
    }
    
    for i in 0..<n {
        if !visited[i] {
            visited[i] = true
            dfs(i, board[k][i], 1)
            visited[i] = false
        }
    }
    print(result)
    
}

solution()
/*
 */
  

```
n이 최대 10개이므로 플로이드워셜이 사용가능   
따라서 각 노드에서 각 지점으로 가장 빠르게 갈 수 있는 경로를 구해놓는다.   
그 후 dfs를 이용해 각 노드들을 전부 방문   

```
import Foundation
func solution(){
    let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,k) = (nk[0],nk[1])
    var board: [[Int]] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append(input)
    }
    
    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                board[i][j] = min(board[i][j], board[i][k] + board[k][j])
            }
        }
    }
    
//    for i in 0..<n {
//        print(board[i])
//    }
    
    var visited = Array(repeating: false, count: n)
    var result = Int.max
    
    func dfs(_ depth: Int, _ idx: Int, _ sum: Int) {
        if sum >= result { return }
        
        if depth == n-1 {
            result = min(result, sum)
            return
        }
        
        for i in 0..<n {
            if !visited[i] {
                visited[i] = true
                dfs(depth+1, i, sum+board[idx][i])
                visited[i] = false
            }
        }
    }
    
    visited[k] = true
    for i in 0..<n {
        if !visited[i] {
            visited[i] = true
            dfs(1, i, board[k][i])
            visited[i] = false
        }
        
    }
    
    print(result)
    
}

solution()
/*
 */
  

```
