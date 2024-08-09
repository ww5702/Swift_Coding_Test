50점    
```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var arr = Array(readLine()!)
    let word = String(repeating: "IO", count: n) + "I"
    var result = 0
    //print(word)
    //print(arr)
    var idx = 0
    while idx <= m-(n*2+1) {
        let value = arr[idx..<idx+(2*n)+1].map{String($0)}.joined(separator: "")
        //print(value)
        if word == value {
            //print("정답")
            result += 1
            idx += 2
        } else {
            idx += 1
        }
    }
    print(result)
}


solution()
/*
 */

```
