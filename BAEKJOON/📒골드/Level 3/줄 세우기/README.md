순서 얘기가 없다면 어떤 답도 정답이 된다고 헀으므로   
반복문을 돌면서 0이 되면 그 순간 추가해준다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n,m) = (input[0],input[1])
    var graph = [Int: [Int]]()
    var visited = Array(repeating: 0, count: n+1)
    visited[0] = -1
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        if graph[input[0]] == nil {
            graph[input[0]] = [input[1]]
        } else {
            graph[input[0]]!.append(input[1])
        }
        visited[input[1]] += 1
    }
    //print(graph)
    //print(visited)
    var q: [Int] = []
    visited.enumerated().forEach {
        if $0.element == 0 {
            q.append($0.offset)
        }
    }
    //print(q)
    var result: [Int] = []
    var idx = 0
    
    while q.count > idx {
        let now = q[idx]
        idx += 1
        result.append(now)
        
        if let next = graph[now] {
            for i in next {
                visited[i] -= 1
                
                if visited[i] == 0 {
                    q.append(i)
                    
                }
            }
        }

    }
    print(result.map{String($0)}.joined(separator: " "))
}
solution()
```
