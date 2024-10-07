```
import Foundation
func solution(){
    while let n = readLine() {
        var cnt = 0
        var next = 1
        
        while true {
            cnt += 1
            //print(cnt, next)
            if next % Int(n)! == 0 {
                print("\(cnt)")
                break
            } else {
                next = ((next*10)+1)
                next %= Int(n)!
            }
        }
    }
}

solution()


```
