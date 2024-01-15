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
