```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var dict: [String:Int] = [:]
    for _ in 0..<n {
        let book = readLine()!
        let value = dict[book] ?? 0
        dict[book] = value + 1
    }
    
    let newDict = dict.sorted(by: {$0.value == $1.value ? $0.key < $1.key : $0.value > $1.value})
    //print(newDict)
    print(newDict[0].key)
}

solution()
/*
 */

```
