```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var arr = [Int]()
    var target = Int(readLine()!)!
    for _ in 1..<n {
        arr.append(Int(readLine()!)!)
    }
    
    var cnt = 0
    while arr.max() ?? 0 >= target {
        if let idx = arr.firstIndex(of: arr.max()!) {
            arr[idx] -= 1
            target += 1
            cnt += 1
        }
    }
    print(cnt)
}

solution()

```
