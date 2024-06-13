처음에는 bfs로만 풀이하려 헀으나 메모리초과 발생   
따라서 이분탐색을 이용해 넘어갈 중량을 정해서 해당 중량으로 목적지까지 도달이 가능한지 구하는 방식으로 풀이한다   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var graph = Array(repeating: [(Int,Int)](), count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[0]].append((input[1],input[2]))
        graph[input[1]].append((input[0],input[2]))
    }
    //print(graph)
    let startEnd = readLine()!.split(separator: " ").map{Int($0)!}
    let (start,end) = (startEnd[0], startEnd[1])
    
    func bfs(_ node: Int, _ cost: Int) -> Bool {
        var q: [Int] = []
        var visited = Array(repeating: false, count: n+1)
        q.append(node)
        var idx = 0
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            for next in graph[now] {
                if !visited[next.0] {
                    if next.1 >= cost {
                        q.append(next.0)
                        visited[next.0] = true
                        
                        if next.0 == end {
                            return true
                        }
                        
                    }
                    
                }
            }
        }
        return false
    }
    var (left, right) = (1,1_000_000_000)
    while left <= right {
        let middle = (left+right) / 2
        //print(left, right, middle)
        if bfs(start, middle) {
            left = middle + 1
        } else {
            right = middle - 1
        }
    }
    print(right)
}
solution()

```
