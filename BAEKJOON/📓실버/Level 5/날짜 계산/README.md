```
import Foundation
func solution(){
    let esm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (e,s,m) = (esm[0],esm[1],esm[2])
    
    var (a,b,c) = (1,1,1)
    var cnt = 1
    while true {
        if a == e && b == s && c == m {
            print(cnt)
            break
        }
        
        cnt += 1
        a += 1; b += 1; c += 1
        if a > 15 { a = 1 }
        if b > 28 { b = 1 }
        if c > 19 { c = 1 }
    }
}

solution()
/*
 */
  

```
