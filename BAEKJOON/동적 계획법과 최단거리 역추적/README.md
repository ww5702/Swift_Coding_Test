# 지금까지는 최솟값, 최댓값, 최단거리만 찾았습니다. 이번에는 실제 최적해와 최단경로를 찾아 봅시다.	

## 12852 
bfs로 풀이하면서 dp와 record 두개의 배열을 이용해 과정과 횟수를 기록하려 했으나   
메모리초과   
```
import Foundation
func solution(){
    var n = Int(readLine()!)!
    var dp: [Int] = Array(repeating: Int.max, count: n+1)
    var record: [[Int]] = Array(repeating: [], count: n+1)
    var needToVisited: [Int] = []
    var idx = 0
    func bfs(_ num: Int) {
        needToVisited.append(num)
        dp[num] = 0
        record[num].append(num)
        
        while needToVisited.count > idx {
            let cur = needToVisited[idx]
            idx += 1
            
            if cur % 3 == 0 {
                if dp[cur/3] > dp[cur] + 1 {
                    dp[cur/3] = dp[cur] + 1
                    needToVisited.append(cur/3)
                    record[cur/3] = record[cur]
                    record[cur/3].append(cur/3)
                }
            }
            if cur % 2 == 0 {
                if dp[cur/2] > dp[cur] + 1 {
                    dp[cur/2] = dp[cur] + 1
                    needToVisited.append(cur/2)
                    record[cur/2] = record[cur]
                    record[cur/2].append(cur/2)
                }
            }
            if cur > 1 {
                if dp[cur-1] > dp[cur] + 1 {
                    dp[cur-1] = dp[cur] + 1
                    needToVisited.append(cur-1)
                    record[cur-1] = record[cur]
                    record[cur-1].append(cur-1)
                }
            }
            
        }
        
        
    }
    bfs(n)
    //print(dp)
    print(dp[1])
    print(record[1].map{String($0)}.joined(separator: " "))
}
solution()


```
dp를 횟수를 나타내는 cnt와 그 전에 어디였는지인 before를 나눠 만들 수 있었다.   
배열을 하나로 줄여 메모리 또한 줄일 수 있다.   

```
import Foundation
func solution(){
    var n = Int(readLine()!)!
    var dp = Array(repeating: (cnt: Int.max, before: 0), count: n+1)
    dp[0] = (0,0)
    //print(dp)
    for i in 1...n {
        dp[i] = (dp[i-1].cnt + 1, i - 1)
        
        if i % 2 == 0 && i >= 2 {
            if dp[i].cnt > dp[i/2].cnt + 1 {
                dp[i] = (dp[i/2].cnt + 1, i / 2)
            }
        }
        
        if i % 3 == 0 && i >= 3 {
            if dp[i].cnt > dp[i/3].cnt + 1 {
                dp[i] = (dp[i/3].cnt + 1, i / 3)
            }
        }
    }
    //print(dp)
    var answer = [Int]()
    print(dp[n].cnt - 1)
    while n >= 1 {
        answer.append(n)
        n = dp[n].before
    }
    print(answer.map{String($0)}.joined(separator: " "))
}
solution()


```
