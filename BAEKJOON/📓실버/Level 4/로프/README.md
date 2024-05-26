```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var arr: [Int] = []
    for _ in 0..<n {
        arr.append(Int(readLine()!)!)
    }
    arr.sort(by: >)
    var result = -1
    for i in 0..<n {
        if arr[i] * (i+1) >= result {
            result = arr[i] * (i+1)
        }
    }
    print(result)
}
solution()

```
