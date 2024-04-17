두 숫자가 더해서 해당 숫자가 나와야하는 문제이므로   
이분탐색은 쓸수가 없다.   
arr[0] + arr[9]가 arr[0]보다 크다면 end -= 1   
작다면 start += 1을 올린다.   
만약 같다면 start나 end가 해당 index가 아닌지 확인해봐야 한다.   
자기 자신 + 0일수도 있기 때문이다.   
만약 0 + 자기자신이면 right - 1을 해줘야 한다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
    var result = 0
    for i in 0..<n {
        var left = 0, right = n-1, sum = 0
        while left < right {
            sum = arr[left] + arr[right]
            if sum > arr[i] {
                right-=1
            } else if sum < arr[i] {
                left+=1
            } else if sum == arr[i] {
                if i != left && i != right {
                    result += 1
                    break
                } else if i == right {
                    right -= 1
                } else if i == left {
                    left += 1
                }
            }
        }
        
    }
    print(result)
}
solution()


```
