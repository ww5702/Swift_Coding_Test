```
import Foundation
func solution() {
    let cnt = Int(readLine()!)!
    var stack: [Character] = []
    var result = 0
    
    for _ in 0..<cnt {
        stack = []
        let input = readLine()!
        for s in input {
            if let top = stack.last, top == s {
                stack.removeLast()
            } else {
                stack.append(s)
            }
        }
        result += stack.isEmpty ? 1 : 0
    }
    print(result)
    
}

solution()
/*

 */

```
