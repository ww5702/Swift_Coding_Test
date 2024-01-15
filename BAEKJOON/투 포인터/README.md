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
## 1806 부분합
가장 짧은 s를 만드는 길이를 만드는 것이기에   
주어진 수열은 정렬할 필요가 없다   
0번부터 시작하여 s를 만들때까지 end를 늘려준다.   
만약 s를 넘기다면 해당 인덱스들로 s이상을 만들수 있으므로    
min(result)를 갱신할 수 있다면 갱신해준다.   
그리고 첫번째 인덱스를 빼주고 cnt도 -1   
다시 2번째 인덱스부터 s이상을 만들 수 있을떄까지 더해준다.   
지문의 예시로는 더 더하지 않아도 s 이상을 만들 수 있어   
while문은 동작하지 않는다.   
위의 과정을 반복하여 정답을 구해낸다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,s) = (input[0],input[1])
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    
    var result = Int.max
    var end = 0, sum = 0
    var cnt = 0
    
    for start in 0..<n {
        
        while sum < s && end < n {
            sum += arr[end]
            end += 1
            cnt += 1
            //print(sum)
        }
        
        if sum >= s {
            result = min(result, cnt)
            //print("ressult",sum,result)
        }
        sum -= arr[start]
        cnt -= 1
    }
    print(result == Int.max ? 0 : result)
}
solution()


```
