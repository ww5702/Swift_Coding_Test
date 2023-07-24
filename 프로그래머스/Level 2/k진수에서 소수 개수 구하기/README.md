첫 제출   
String(n, radix: k)라는 진법 변환기를 알고있고,   
Int(sqrt(Double(num)))이라는 제곱근을 이용해 빠른 소수 구하기를 알고 있다면   
레벨 2로 안느껴질 정도로 쉬운 문제   
```
import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    var number = String(n,radix: k).split(separator:"0").map{Int($0)!}
    // 1 제외
    number = number.filter{$0 != 1}
    //print(number)
    var result = 0
    for n in number {
        var value = String(n, radix: 10)
        var prime = true
        // 소수 구하기
        for i in 2...Int(sqrt(Double(value)!)) + 1 {
            if Int(value)! % i == 0 && i != Int(value)! {
                prime = false
                break
            }
        }
        // 소수라면
        if prime {
            result += 1
        }
    }
    
    return result
}
```
