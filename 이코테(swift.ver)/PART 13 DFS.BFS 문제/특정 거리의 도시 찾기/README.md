전형적인 dfs bfs 문제이다.   
dfs로도 bfs로도 풀이가 가능하다.   
dfs   
```
import Foundation

func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m,k,x) = (input[0],input[1],input[2],input[3])
    var graph = [[Int]](repeating: [], count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[0]].append(input[1])
    }
    //print(graph)
    var board = Array(repeating: Int.max, count: n+1)
    board[x] = 0
    var visited = Array(repeating: false, count: n+1)
    visited[x] = true
    var result: [Int] = []
    func dfs(_ start: Int) {
        for next in graph[start] {
            //print(next)
            if !visited[next] && board[start]+1 < board[next] {
                visited[start] = true
                board[next] = board[start] + 1
                dfs(next)
            }
        }
    }
    
    dfs(x)
    for i in 1...n {
        if board[i] == k {
            result.append(i)
        }
    }
    result.sort(by:<)
    if result.count == 0 {
        print(-1)
    } else {
        for r in result {
            print(r)
        }
    }
}
solution()

/*
4 4 2 1
1 2
1 3
2 3
2 4
 */
```
bfs   
dfs 함수를 bfs로 바꾸기만 하면 된다.      
   
```
    var idx = 0
    
    func bfs(_ start: Int) {
        visited[x] = true
        board[x] = 0
        var q: [Int] = []
        q.append(start)
        
        while q.count > idx {
            let cur = q[idx]
            idx += 1
            for next in graph[cur] {
                if !visited[next] && board[cur]+1 < board[next] {
                    board[next] = board[cur] + 1
                    visited[next] = true
                    q.append(next)
                }
            }
        }
    }
```
