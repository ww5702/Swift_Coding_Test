```
import Foundation
func solution(){
    while let n = Int(readLine()!) {
        var cnt = 0
        var next = 1
        
        while true {
            cnt += 1
            //print(cnt, next)
            if next % n == 0 {
                print("\(cnt)")
                break
            } else {
                next = ((next*10)+1)
                next %= n
            }
        }
    }
}

solution()

```
