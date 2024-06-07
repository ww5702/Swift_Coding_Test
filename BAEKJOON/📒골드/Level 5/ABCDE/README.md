dfs로 풀이하였다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var graph = Array(repeating: [Int](), count: n)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }
    //print(graph)
    var visited = Array(repeating: false, count: n)
    var isOk = false
    
    func dfs(_ arr: [Int], _ node: Int, _ cnt: Int) {
        //print(arr, cnt)
        if isOk { return }
        if cnt > 5 { return }
        
        if cnt == 5 {
            //print(arr)
            isOk = true
            return
        }
        
        for next in graph[node] {
            if !visited[next] {
                visited[next] = true
                dfs(arr + [next], next, cnt+1)
                visited[next] = false
            }
        }
        return
    }
    
    for i in 0..<n {
        if isOk { break }
        visited[i] = true
        dfs([i], i, 1)
        visited[i] = false
    }
    
    print(isOk ? 1 : 0)
}
solution()

```
