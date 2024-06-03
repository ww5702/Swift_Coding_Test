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
