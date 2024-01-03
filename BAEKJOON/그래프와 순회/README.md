# 그래프를 배우고, 그래프를 순회하는 알고리즘을 배워 봅시다.	
## 24479 알고리즘 수업 - 깊이 우선 탐색1
당연히 그래프가 전부 이어져있을것이라 생각했지만 아닐 수도 있었고   
방문한 순서를 출력하기 위해 방문하자마자 start를 출력했지만   
방문한 node를 순서대로 출력하라는것이 아닌   
1부터 n까지의 노드가 몇번째 순서로 출력되었는지 출력하라는 문제이다.   
문제를 잘 읽자...   

```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m,r) = (input[0],input[1],input[2])
    var graph = [[Int]](repeating: [], count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (u,v) = (input[0],input[1])
        graph[u].append(v)
        graph[v].append(u)
    }
    //print(graph)
    var visited = Array(repeating: false, count: n+1)
    func dfs(_ start: Int) {
        print(start)
        visited[start] = true
        
        for node in graph[start].sorted(by: <) {
            if !visited[node] { dfs(node) }
        }
        
    }
    dfs(r)
    for i in 1...n {
        if visited[i] { print(i) }
        else { print(0) }
    }
}

solution()

```
visited를 Boolean이 아닌 0으로 초기화 후 순서를 기록할 cnt를    
visited[i]가 0이라면 해당 순서를 기록해준다.   

```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m,r) = (input[0],input[1],input[2])
    var graph = [[Int]](repeating: [], count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (u,v) = (input[0],input[1])
        graph[u].append(v)
        graph[v].append(u)
    }
    //print(graph)
    var visited = Array(repeating: 0, count: n+1)
    var cnt = 0
    func dfs(_ start: Int) {
        cnt += 1
        visited[start] = cnt
        graph[start] = graph[start].sorted(by: <)
        for node in graph[start] {
            if visited[node] == 0 {
                dfs(node)
            }
        }
    }
    dfs(r)
    for i in 1...n {
        print(visited[i])
    }
}

solution()

```
## 24480 알고리즘 수업 - 깊이 우선 탐색2
탐색 순서가 오름차순에서 내림차순으로 바뀌었을 뿐이다.   
해당 문제가 뜻하는 바는 깊이 우선 탐색은 내림차순이던 오름차순이던 풀이가 가능하다는 뜻이다.      
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m,r) = (input[0],input[1],input[2])
    var graph = [[Int]](repeating: [], count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (u,v) = (input[0],input[1])
        graph[u].append(v)
        graph[v].append(u)
    }
    //print(graph)
    var visited = Array(repeating: 0, count: n+1)
    var cnt = 0
    func dfs(_ start: Int) {
        cnt += 1
        visited[start] = cnt
        graph[start] = graph[start].sorted(by: >)
        for node in graph[start] {
            if visited[node] == 0 {
                dfs(node)
            }
        }
    }
    dfs(r)
    for i in 1...n {
        print(visited[i])
    }
}

solution()

```
