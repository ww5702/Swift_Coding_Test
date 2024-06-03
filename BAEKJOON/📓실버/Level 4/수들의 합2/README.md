```
import Foundation
func solution(){
    var input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    var (left, right) = (0,1)
    var sum = arr[left]
    var cnt = 0
    while true {
        if sum < m {
            if right < n {
                sum += arr[right]
                right += 1
            } else {
                break
            }
        } else if sum == m {
            cnt += 1
            sum -= arr[left]
            left += 1
        } else {
            sum -= arr[left]
            left += 1
        }
    }
    print(cnt)
}
solution()

```
