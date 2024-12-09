```
import Foundation
func solution(){
    let abn = readLine()!.split(separator: " ").map{Int(String($0))!}
    var (a,b,n) = (abn[0],abn[1],abn[2])
    var ans = 0
    
    for _ in 0..<n {
        a %= b
        a *= 10
        ans = a/b
        //print(a,ans)
    }
    print(ans)
}
solution()
/*
 */

```
