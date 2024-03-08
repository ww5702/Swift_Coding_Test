LIS(최장 증가 부분수열)의 거꾸로 버전이다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var list = readLine()!.split(separator: " ").map{Int($0)!}
    var dp: [Int] = Array(repeating: 1, count: n)
    for i in 0..<n {
        for j in 0..<i {
            if list[i] < list[j] {
                dp[i] = max(dp[i], dp[j]+1)
            }
        }
    }
    print(n - dp.max()!)
    
}
solution()
                     

/*
 7
 15 11 4 8 5 2 4
 */


```
dp가 아닌 이분탐색으로 nlogn으로 풀이도 가능하다.
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    var dp = [Int]()
    dp.append(arr[0])
    for i in 1..<n {
        if dp.last! > arr[i] {
            dp.append(arr[i])
        } else {
            var start = 0
            var end = dp.count - 1
            var mid = (start+end)/2
            
            while start < end {
                if dp[mid] > arr[i] {
                    start = mid + 1
                } else {
                    end = mid
                }
                mid = (start + end) / 2
            }
            dp[end] = arr[i]
        }
    }
    print(n - dp.count)
    
}
solution()


/*
7
15 11 4 8 5 2 4
 */


```
