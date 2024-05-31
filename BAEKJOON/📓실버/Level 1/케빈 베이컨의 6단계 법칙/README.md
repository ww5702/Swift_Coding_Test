```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var graph = Array(repeating: [Int](), count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }
    //print(graph)
    
    var dis = Array(repeating: Int.max, count: n+1)
    
    func bfs(_ node: Int) {
        var q: [Int] = []
        dis[node] = 0
        var idx = 0
        q.append(node)
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            for next in graph[now] {
                if dis[next] > dis[now] + 1 {
                    q.append(next)
                    dis[next] = dis[now] + 1
                }
            }
        }
        
    }
    
    var result = 0
    var cnt = Int.max
    for i in 1...n {
        //print("다음 번호",i)
        dis = Array(repeating: Int.max, count: n+1)
        bfs(i)
        var sum = dis[1...].reduce(0, +)
        if sum < cnt {
            result = i
            cnt = sum
        }
    }
    print(result)
}
solution()

```
