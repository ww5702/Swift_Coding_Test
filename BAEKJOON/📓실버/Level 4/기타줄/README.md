몫 + 나머지 vs 몫 +1 vs 나머지로 전부 중 고르는 문제이다.   
```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (nm[0],nm[1])
    var setmin = Int.max
    var alonemin = Int.max
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        setmin = min(setmin, input[0])
        alonemin = min(alonemin, input[1])
    }
    
    let a = setmin * (n/6) + alonemin * (n%6)
    let b = setmin * ((n/6)+1)
    let c = alonemin * n
    
    print(min(a, min(b,c)))
}
solution()


```
