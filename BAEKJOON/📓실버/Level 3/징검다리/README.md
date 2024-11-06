```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        if n <= 2 {
            print(1)
        } else {
            var value = 1
            var num = 1
            while value < n {
                num += 1
                value += num
            }
            print(num-1)
        }
    }
}

solution()
/*
1 2 3 4 5 6 7 8 9 10 11 12 13
 92
 */
  

```
