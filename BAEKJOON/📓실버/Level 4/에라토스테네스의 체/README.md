```
import Foundation
func solution(){
    let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,k) = (nk[0],nk[1])
    var isPrime = Array(repeating: false, count: n+1)
    
    var cnt = 0
    
    for i in 2...n {
        for j in stride(from: i, to: n+1, by: i){
            if !isPrime[j] {
                cnt += 1
                isPrime[j] = true
                
                if cnt == k {
                    print(j)
                    break
                }
            }
        }
    }
    
    
}
solution()
/*
 */

```
