```
import Foundation
func solution(){
    let arr = Array(readLine()!)
    //print(arr)
    var cnt = Array(repeating: 0.0, count: 9)
    for i in 0..<arr.count {
        let idx = Int(String(arr[i]))!
        if idx == 9 {
            cnt[6] += 1.0
        } else {
            cnt[idx] += 1.0
        }
    }
    cnt[6] /= 2
    //print(cnt)
    let max = ceil(cnt.max()!)
    print(Int(max))
}
solution()

```
