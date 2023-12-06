# 정수론의 세계로 조금 더 들어가 봅시다.	
## 4134 다음 소수
에라토스테네스의 체를 사용하지 않더라도 풀이가 가능한 문제이다.   
```
import Foundation
func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    for i in 2..<Int(sqrt(Double(n)) + 1) {
        if n % i == 0 { return false }
    }
    return true
}
func solution() {
    var T = Int(readLine()!)!
    for _ in 1...T {
        var n = Int(readLine()!)!
        while !isPrime(n) {
            n += 1
        }
        print(n)
    }
}
solution()


```
