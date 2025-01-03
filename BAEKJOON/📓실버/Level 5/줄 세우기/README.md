```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        var arr = input[1...]
        var result = 0
        while !arr.isEmpty {
            let now = arr.removeFirst()
            let cnt = arr.filter({$0 < now}).count
            result += cnt
        }
        print(input[0], result)
    }
}
solution()
/*
 */

```
