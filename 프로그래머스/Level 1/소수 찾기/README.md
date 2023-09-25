풀이 방법은 쉽게 떠올렸으나 n의 최대값이 1,000,000이고 sqrt를 사용하긴했으나   
이중 반복문을 사용해서 효율성 검사에서 걱정을 했으나 통과했다.   

```
import Foundation
func solution(_ n:Int) -> Int {
    var cnt = 0
    var isPrime = true
    for i in 2...n {
        if i < 4 {
            cnt += 1
            continue
        }
        for j in 2...Int(sqrt(Double(i))) {
            if i % j == 0 {
                isPrime = false
                break
            }
        }
        if isPrime == true { cnt += 1 }
        isPrime = true
    }
    return cnt
}
```
