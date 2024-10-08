```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var dict: [Int:Int] = [:]
    for _ in 0..<n {
        let num = Int(readLine()!)!
        let value = dict[num] ?? 0
        dict[num] = value + 1
    }
    //print(dict)
    let newDict = dict.sorted(by: {$0.value == $1.value ? $0.key < $1.key : $0.value > $1.value})
    //print(newDict)
    print(newDict.first!.key)
}

solution()
/*
 */

```
