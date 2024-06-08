```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m,k,x) = (input[0],input[1],input[2],input[3])
    var board = Array(repeating: [Int](), count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        board[input[0]].append(input[1])
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
                    dis[next] = dis[now] + 1
                    q.append(next)
                }
            }
        }
        
    }
    
    bfs(x)
    //print(dis)
    var result: [Int] = []
    for i in 1...n {
        if dis[i] == k {
            result.append(i)
        }
    }
    print(result.count == 0 ? -1 : result.map{String($0)}.joined(separator: "\n"))
}
solution()

```
