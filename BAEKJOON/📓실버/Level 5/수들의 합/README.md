```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var cnt = 0
    var sum = 0
    for i in 1...n+1 {
        sum += i
        //print(i, sum)
        if sum >= n {
            cnt = i
            break
        }
    }
    //print(sum, cnt)
    print(sum == n ? cnt : cnt-1)
}
solution()


```
