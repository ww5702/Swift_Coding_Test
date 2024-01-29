# 대표적인 그래프 종류 중 하나인 트리를 다뤄 봅시다.	
## 11725 트리의 부모 찾기
bfs로 접근하여 풀이하였다.   
이미 루트노드에서 출발하므로 만약 방문한 순간 0이라면   
해당 노드가 부모 노드인것이다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var graph = [[Int]](repeating: [Int](repeating: 0, count: 0), count: n+1)
    for _ in 0..<n-1 {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }
    var visited = Array(repeating: 0, count: n+1)
    //print(graph)
    
    func bfs(_ start: Int) {
        var q: [Int] = []
        q.append(start)
        var idx = 0
        
        visited[start] = -1
        while q.count > idx {
            let cur = q[idx]
            idx += 1
            for node in graph[cur] {
                if visited[node] == 0 {
                    visited[node] = cur
                    q.append(node)
                }
            }
        }
    }
    bfs(1)
    for i in 2...n {
        print(visited[i])
    }
}
solution()

```
## 1167 트리의 지름
가장 길이가 긴 지름을 구하기 위해서는 일단 가장 밑에 있는 노드를 찾아야한다.   
따라서 깊이우선탐색 dfs를 사용하여 가장 밑 노드를 찾아준다(lastnode)   
그리고 lastnode에서 맨 위로 다시 dfs를 사용한다.   

```
import Foundation
func solution(){
    let v = Int(readLine()!)!
    var graph = Array(repeating: [(Int,Int)](), count: v+1)
    for _ in 1...v {
        let arr = readLine()!.split(separator:" ").map{Int(String($0))!}
        var idx = 1
        while true {
            if arr[idx] == -1 { break }
            graph[arr[0]].append((arr[idx],arr[idx+1]))
            idx += 2
        }
    }
    //print(graph)
    var visited = Array(repeating: false, count: v+1)
    var lastNode = 0
    var length = 0
    
    func dfs(_ node: Int, _ depth: Int) {
        visited[node] = true
        if length < depth {
            length = depth
            lastNode = node
        }
        
        for i in graph[node] {
            if !visited[i.0] {
                dfs(i.0, depth + i.1)
            }
        }
    }
    dfs(1,0)
    //print(lastNode, length)
    length = 0
    visited = Array(repeating: false, count: v+1)
    dfs(lastNode, 0)
    print(length)
}
solution()
```
## 1967 트리의 지름
dfs,bfs 아무거나 상관없는 문제이다.   
일단 1에서 시작하여 가장 멀리 떨어진 노드를 구한다.   
해당 노드에서 다시 출발하여 각각의 떨어진 길이를 구한다.   
해당 길이중 가장 거리가 먼 노드까지의 거리가 트리의 지름이다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var graph = Array(repeating: [(Int,Int)](), count: n+1)
    for _ in 0..<n-1 {
        let arr = readLine()!.split(separator:" ").map{Int(String($0))!}
        graph[arr[0]].append((arr[1],arr[2]))
        graph[arr[1]].append((arr[0],arr[2]))
    }
    //print(graph)
    var visited = Array(repeating: 0, count: n+1)
    
    func bfs(_ start: Int) {
        var idx = 0
        var q: [(Int,Int)] = [(start,0)]
    
        while q.count > idx {
            let cur = q[idx]
            idx += 1
            
            for node in graph[cur.0] {
                if visited[node.0] == 0 {
                    visited[node.0] = cur.1 + node.1
                    q.append((node.0, visited[node.0]))
                }
            }
        }
    }
    
    
    bfs(1)
    //print(visited)
    let max = visited.max()!
    let temp = visited.firstIndex(of: max)!
    
    visited = Array(repeating: 0, count: n+1)
    bfs(temp)
    
    print(visited.max()!)
}
solution()

```
