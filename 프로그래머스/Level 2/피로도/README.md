첫 제출   
던전개수가 8개 이하이기에 어떤 방법으로든 풀 수 있다.   
dfs를 이용해서 풀이하였다.   
하나씩 탐색하면서 내려가다 던전 탐색의 개수가 늘어날때마다 result를 바꿔준다.   
```
import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result = 0
    var visited = [Bool](repeating: false, count: dungeons.count)
    func dfs(_ count: Int, _ pirodo: Int) {
        //print(visited)
        if result < count {
            result = count
            //print(result)
        }
        for i in 0..<dungeons.count {
            if !visited[i] && dungeons[i][0] <= pirodo {
                visited[i] = true
                dfs(count + 1, pirodo - dungeons[i][1])
                visited[i] = false
            }
        }
    }
    dfs(0,k)
    return result
}
```
