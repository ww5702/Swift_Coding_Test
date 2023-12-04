# 수학적 사고력을 길러 봅시다.
## 2745 진법 변환
radix를 이용해 풀이해준다.   
```
import Foundation
func solution() {
    var input = readLine()!.split(separator:" ").map{String($0)}
    let N = input[0]
    let B = Int(input[1])!
    print(Int(N,radix:B)!)
    
}
solution()

```
## 11005 진법 변환2 
radix를 이용해 풀이해준다.   
```
import Foundation
func solution() {
    var input = readLine()!.split(separator:" ").map{Int(String($0))!}
    let N = input[0]
    let B = input[1]
    print(String(N,radix:B).uppercased())
    
}
solution()

```
## 2720 세탁소 사장 동혁
/ 와 %를 적절히 사용해서 문제에서 원하는 값을 출력해준다.   
```
import Foundation
func solution() {
    var T = Int(readLine()!)!
    for _ in 0..<T {
        var C = Int(readLine()!)!
        var dolor = C/100, cent = C%100
        var quarter = dolor*4 + cent/25
        cent %= 25
        var dime = cent / 10
        cent %= 10
        var nickel = cent / 5
        cent %= 5
        print("\(quarter) \(dime) \(nickel) \(cent)")
    }
}
solution()

```
## 2903 중앙 이동 알고리즘
변이 2개 3개 5개 9개 등등   
1 2 4 8 등비수열로 변화한다는 점을 파악하면 쉽다.   

```
import Foundation
func solution() {
    var N = Int(readLine()!)!
    // 2 3 5 9
    // 1 2 4 8 씩 증가
    var value = (1+Int(pow(Double(2), Double(N))))
    print(Int(pow(Double(value),2)))
}
solution()

```
