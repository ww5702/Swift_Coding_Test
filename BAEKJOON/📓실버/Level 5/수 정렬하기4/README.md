```
import Foundation

func solution(){
    let n = Int(readLine()!)!
    var board: [Int] = []
    for _ in 0..<n {
        board.append(Int(readLine()!)!)
    }
    board.sorted(by: >).forEach({
        print($0, separator: " ")
    })
}
solution()
/*
 
 */

```
