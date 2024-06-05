양이 얼마 안돼서 bfs로도 풀이가 가능할것같았다.   
40퍼에서 실패했는데
s == g이라면 정답은 0이다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    var (f,s,g,u,d) = (input[0],input[1],input[2],input[3],input[4])
    var dis = Array(repeating: Int.max, count: f+1)
    dis[s] = 0
    var result = 0
    func bfs() {
        var q: [(Int,Int)] = []
        var idx = 0
        q.append((s,0))
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            if now.0 == g {
                result = now.1
                break
            }
            
            if now.0 + u <= f && dis[now.0+u] > now.1+1 {
                q.append((now.0+u, now.1+1))
                dis[now.0+u] = now.1+1
            }
            if now.0 - d >= 1 && dis[now.0-d] > now.1+1{
                q.append((now.0-d, now.1+1))
                dis[now.0-d] = now.1+1
            }
            
        }
    }
    bfs()
    print(dis)
    if dis[g] == Int.max {
        print("use the stairs")
    } else {
        print(dis[g])
    }
    
}
solution()

```
