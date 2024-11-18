```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var level: [Int] = []
    for _ in 0..<n {
        level.append(Int(readLine()!)!)
    }
    var num = level.last! - 1
    var result = 0
    for l in level.reversed()[1...] {
        if num < l {
            //print(l, num)
            result += (l-num)
            //print(result)
            num = num-1
        } else {
            num = l-1
        }
    }
    print(result)
    
}

solution()
/*
 */
  

```
