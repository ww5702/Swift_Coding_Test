이분탐색을 이용한다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    var (x,y) = (input[0],input[1])
    //print(Double(y/x)*100)
    var percentage = y*100/x
    var cnt = -1
    //print(percentage)
    //print(result)
    var start = 1
    var end = 1000000000
    while (start <= end) {
        var mid = (start+end)/2
        let nx = x + mid
        let ny = y + mid
        let nz = ny*100/nx
        if percentage != nz {
            end = mid-1
            cnt = mid
        } else {
            start = mid+1
        }
    }
    print(cnt)
}
solution()

```
