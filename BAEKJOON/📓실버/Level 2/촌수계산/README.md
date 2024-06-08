```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (start, end) = (input[0],input[1])
    let m = Int(readLine()!)!
    var board = Array(repeating: [Int](), count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        board[input[0]].append(input[1])
        board[input[1]].append(input[0])
    }
    var dis = Array(repeating: Int.max, count: n+1)
    
    
    func bfs(_ node: Int) {
        var q: [Int] = []
        q.append(node)
        var idx = 0
        dis[node] = 0
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            for next in board[now] {
                if dis[next] > dis[now] + 1 {
                    q.append(next)
                    dis[next] = dis[now] + 1
                }
            }
        }
        
    }
    
    bfs(start)
    print(dis[end] == Int.max ? -1 : dis[end])
    
}
solution()

```
