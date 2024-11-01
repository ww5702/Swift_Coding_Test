```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var i = 1
    var ans = 0
    while i <= n {
        ans += (n-i+1)
        //print(ans, i)
        i *= 10
    }
    print(ans)
}

solution()
/*
 9 까지느 1개
 10~99 까지는 2개
 3자리수는 3개
 
 */

```
