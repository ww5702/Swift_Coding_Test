```
import Foundation
func solution(){
    let l = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
    let n = Int(readLine()!)!
    let start = arr.last{ $0 < n }
    let end = arr.first{ $0 > n }
    if arr.contains(n) { print(0) }
    else if start == nil {
        print(n * (end!-n)-1)
    } else {
        print((n - (start ?? n)) * ((end ?? n)-n)-1)
    }
}
solution()

```
