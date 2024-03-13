```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var graph = [[Int]](repeating: [], count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }
    print(graph)
    var result = Array(repeating: Int.max, count: n+1)
    result[0] = 0
    
    func bfs(_ start : Int) {
        var q: [Int] = []
        var idx = 0
        q.append(start)
        result[1] = 0
        
        while q.count > idx {
            let cur = q[idx]
            idx += 1
            for next in graph[cur] {
                if (result[next] > result[cur] + 1) {
                    result[next] = result[cur] + 1
                    q.append(next)
                }
            }
        }
        
    }
    bfs(1)
    print(result)
    let max = result.max()!
    let idx = result.firstIndex(of: max)!
    let cnt = result.filter({$0 == max}).count
    print(idx, max, cnt)
}
solution()


/*
 6 7
 3 6
 4 3
 3 2
 1 3
 1 2
 2 4
 5 2
 */


```
