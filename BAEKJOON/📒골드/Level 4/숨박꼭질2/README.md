k에서 n으로 돌아오는 값을 백트래킹하여 풀이해보았다.   
시간초과    

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,k) = (input[0],input[1])
    var visited = Array(repeating: false, count: 200000)
    var cnt: [Int:Int] = [:]
    var result = k-n
    //print(cnt)
    visited[k] = true
    
    func dfs(_ now: Int, _ time: Int) {
        //print(now, time)
        if time > result || now <= 0 { return }
        
        if (now == n) {
            if result >= time {
                if cnt[time] == nil {
                    cnt.updateValue(1, forKey: time)
                } else {
                    let value = cnt[time]!
                    cnt.updateValue(value+1, forKey: time)
                }
                result = time
                //print("도착",result)
            }
            return
        }
        
        if now%2 == 0 {
            if !visited[now/2] {
                visited[now/2] = true
                dfs(now/2, time+1)
                visited[now/2] = false
            }
        }
        if !visited[now-1] {
            visited[now-1] = true
            dfs(now-1, time+1)
            visited[now-1] = false
        }
        if !visited[now+1] {
            visited[now+1] = true
            dfs(now+1, time+1)
            visited[now+1] = false
        }
        
        
    }
    
    dfs(k, 0)
    //print(cnt)
    print(result)
    print(cnt[result]!)
}
solution()

```
BFS로 n * 2, n + 1, n - 1 3가지 경우를 대입해가면서 풀이하면 쉽게 풀이가 가능했다.   
3프로에서 계속 틀렸는데 범위 설정에서 100000을 포함안했더니 틀렸었다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,k) = (input[0],input[1])
    var q: [(Int,Int)] = []
    var idx = 0
    
    var dis = Array(repeating: Int.max, count: 100001)
    q.append((n,0))
    dis[n] = 0
    var cnt = 0
    
    while q.count > idx {
        let now = q[idx]
        //print(now)
        idx += 1
        
        if now.1 > dis[k] { break }
        
        if now.0 == k {
            dis[k] = now.1
            cnt += 1
        }
        
        let list = [now.0 * 2, now.0 - 1, now.0 + 1]
        for i in 0..<3 {
            if (0...100000).contains(list[i]) && dis[list[i]] >= now.1+1 {
                dis[list[i]] = now.1+1
                q.append((list[i], now.1+1))
            }
        }
        
        
    }
    print(dis[k])
    print(cnt)
    
}
solution()

```
