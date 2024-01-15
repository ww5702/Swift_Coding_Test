# 투 포인터 알고리즘과 meet in the middle 알고리즘을 배워 봅시다.
## 3273 두 수의 합
100,000개의 수열이기에 이중반복문으로는 시간초과가 발생한다.   
따라서 start, end를 설정하고   
내리고 올리면서 값을 비교한다.   
만약 x보다 작다면 start += 1, x보다 크다면 end -= 1   
만약 x와 같다면 start+= 1, end -= 1을 동시에 해준다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    let x = Int(readLine()!)!
    arr.sort(by:<)
    
    var start = 0, end = n-1
    var cnt = 0
    while start < end {
        if arr[start] + arr[end] == x {
            //print(arr[start],arr[end])
            cnt += 1
            start += 1
            end -= 1
        }else if arr[start] + arr[end] < x {
            start += 1
        } else if arr[start] + arr[end] > x {
            end -= 1
        }
    }
    print(cnt)
}
solution()


```
## 2470 두 용액
정렬된 수열의 두 수를 더했을때 0과 가까운 수를 고르는 문제이다.   
0에 가까운 두 수를 골라야 하기에 절댓값을 이용하여 풀이를 진행한다.   
만약 해당 두 수가 result보다 0에 가깝다면 해당 합으로 result를 대체해주고,   
다시 두 수의 합이 0보다 작다면 start+=1,   
합이 0보다 크다면 end -= 1 를 해준다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    arr.sort(by:<)
    
    var start = 0, end = n-1
    var result = Int.max
    var answer: [Int] = []
    
    while start < end {
        
        if result > abs(arr[end] + arr[start]){
            result = abs(arr[end] + arr[start])
            answer = [arr[start],arr[end]]
        }
        if arr[start] + arr[end] < 0 {
            start += 1
        } else {
            end -= 1
        }
    }
    print(answer.sorted(by:<).map{String($0)}.joined(separator: " "))
}
solution()


```
