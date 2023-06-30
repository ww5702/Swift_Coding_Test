첫 제출   
배열을 나누고 쪼개고 합칠수있는지 물어보는 기초적인 문제엿다.   
p의 길이도 최대 3   
t의 길이도 최대 10,000   
이라서 편하게 구성했다.   

```
import Foundation

func solution(_ t:String, _ p:String) -> Int {
    let plength = p.map{String($0)}.count
    let tlength = t.map{String($0)}.count
    let t = t.map{String($0)}
    var result = 0
    for i in 0...tlength-plength {
        let num = t[i..<i+plength].joined()
        print(num)
        if Int(num)! <= Int(p)! {
            result += 1   
        }
    }
    return result
}
```
