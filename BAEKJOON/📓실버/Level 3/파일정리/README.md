```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var dict: [String:Int] = [:]
    for _ in 0..<n {
        let input = readLine()!.split(separator: ".").map{String($0)}
        let value = dict[input[1]] ?? 0
        dict[input[1]] = value + 1
    }
    //print(dict)
    dict.sorted(by: {$0.key < $1.key}).forEach{
        print("\($0.key) \($0.value)")
    }
}

solution()
/*
 */
  

```
