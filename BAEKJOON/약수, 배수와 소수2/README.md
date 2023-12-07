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

## 17103 골드바흐 파티션
최대값 1,000,000까지의 소수를 에라토스테네스의 체로 구한 뒤,   
주어진 짝수의 절반까지의 값 i + N-i 가 소수면 + 1   
그리고 절반의 값이 소수면 추가로 +1하여   
값을 출력한다.   
```
import Foundation
var num = 1000000
var numArray = Array(repeating: 0, count: num+1)
for i in 2...num {
    numArray[i] = i
}
for i in 2...num {
    if numArray[i] == 0 { continue }
    for j in stride(from: i+i, through: num, by: i) {
        numArray[j] = 0
    }
}
func solution() {
    var T = Int(readLine()!)!
    for _ in 0..<T {
        var N = Int(readLine()!)!
        var answer = 0
        let limit = N/2
        for i in 1..<limit {
            if numArray[i] != 0 && numArray[N-i] != 0 {
                answer += 1
            }
        }
        if numArray[limit] != 0 { answer += 1 }
        print(answer)
    }
}
solution()


```
## 13909 창문 닫기 
N까지의 배수를 구하면서 +1   
그리고 최종 window값이 짝수라면 문이 닫혀있고 홀수라면 문이 열려있다.   

```
import Foundation
func solution() {
    var N = Int(readLine()!)!
    var window = Array(repeating: 0, count: N+1)
    for i in 1...N {
        for j in stride(from: i, through: N, by: i) {
            window[j] += 1
        }
        //print(window)
    }
    print(window.filter{$0 % 2 != 0}.count)
}
solution()
```
그리고 위의 코딩이 즉 제곱들을 찾아줘야 하는 코딩을 의미한다.   
```
import Foundation
func solution() {
    var N = Int(readLine()!)!
    var answer = 0
    var i = 1
    while i*i <= N {
        answer += 1
        i += 1
    }
    print(answer)
}
solution()


```
