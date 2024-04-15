보이는바와 같이 피보나치수열의 문제라는것을 알 수 있다.   
```
1  1 
2  2
3  3
4  5
5  8
6  13
7  21
8  34
9  55

import Foundation
func solution(){
    let n = Int(readLine()!)!
    var cache = Array(repeating: 0, count: n+1)
    func fibo(_ n: Int) -> Int{
        if n == 1 {
            return 1
        }
        else if n == 2{
            return 2
        } else {
            cache[1] = 1
            cache[2] = 2
            for i in 3...n {
                cache[i] = ((cache[i-1] % 100007) + (cache[i-2] % 100007)) % 10007
            }
        }
        return cache[n]
    }
    print(fibo(n))
}
solution()


```
