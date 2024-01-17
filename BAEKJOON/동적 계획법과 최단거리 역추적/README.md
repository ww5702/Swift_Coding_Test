# 지금까지는 최솟값, 최댓값, 최단거리만 찾았습니다. 이번에는 실제 최적해와 최단경로를 찾아 봅시다.	

## 12852 1로 만들기 2
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
## 14002 가장 긴 증가하는 부분 수열4
인덱스가 1000 이하라 가장 쉬운 LIS로 풀이가 가능하다.   
해당 방법으로 LIS를 구하게 되면 이제 경로를 찾는 반복문을 실행할 차례이다.   dp배열을 역으로 순환하면서 dp.max!값과 같다면 append,   
dp.max값 -1, 다시 dp.max-1과 같다면 append를 실행하면   
경로를 찾을 수 있다.   
```
import Foundation
func solution(){
    var n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    var dp: [Int] = Array(repeating: 1, count: n)
    for i in 0..<n {
        for j in 0..<i {
            if arr[i] > arr[j] {
                dp[i] = max(dp[i], dp[j]+1)
            }
        }
    }
    var result = dp.max()!
    var list: [Int] = []
    print(result)
    
    for i in stride(from: n-1, through: 0, by: -1) {
        if dp[i] == result {
            list.append(arr[i])
            result -= 1
        }
    }
    print(list.reversed().map{String($0)}.joined(separator: " "))
}
solution()
```

## 14003 가장 긴 증가하는 부분 수열5
LIS를 이분탐색으로 풀이하여 O(nlogn)으로 풀이한다음   
14002와 같은 방식으로 경로를 찾아내었다.   
풀이 방식은 맞는것 같지만 같은 숫자가 여러개일수도 있고,   
firstIndex라는 방식 자체가 메모리를 많이 차지하여 시간초과가 발생   

```
import Foundation
func solution(){
    var n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    var result: [Int] = []
    result.append(arr[0])
    var list = Array(repeating: 1, count: n)
    for i in 1..<arr.count {
        if arr[i] > result.last! {
            list[i] = max(list[i], list[arr.firstIndex(of: result.last!)!]+1)
            result.append(arr[i])
            continue
        }
        
        var start = 0
        var end = result.count
        while start <= end {
            let mid = (start+end)/2
            if result[mid] < arr[i] {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        result[start] = arr[i]
        list[i] = start
    }
    //print(list)
    var cnt = result.count
    print(cnt)
    var answer: [Int] = []
    
    for i in stride(from: n-1, through: 0, by: -1) {
        if list[i] == cnt-1 {
            answer.append(arr[i])
            cnt -= 1
        }
    }
    print(answer.reversed().map{String($0)}.joined(separator: " "))
    
}
solution()
```
list에 현재 result.count를 차레차례 넣어주면   
같은 값이 입력된다는 사실을 찾아내었다.   

```
import Foundation
func solution(){
    var n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    var result: [Int] = []
    result.append(arr[0])
    var list = Array(repeating: 1, count: n)
    for i in 0..<arr.count {
        if arr[i] > result.last! {
            result.append(arr[i])
            list[i] = result.count - 1
            continue
        }
        
        var start = 0
        var end = result.count - 1
        while start <= end {
            let mid = (start+end)/2
            if result[mid] >= arr[i] {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        result[start] = arr[i]
        list[i] = start
    }
    //print(list)
    var cnt = result.count
    print(cnt)
    var answer: [Int] = []
    
    for i in stride(from: n-1, through: 0, by: -1) {
        if list[i] == cnt-1 {
            answer.append(arr[i])
            cnt -= 1
        }
    }
    print(answer.reversed().map{String($0)}.joined(separator: " "))
    
}
solution()
```
