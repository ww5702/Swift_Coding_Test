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
