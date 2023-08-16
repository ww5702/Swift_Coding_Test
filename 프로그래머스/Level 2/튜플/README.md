그저 배열을 중복제거하여 출력하는것이라고 판단하여 풀었다.   
하지만 튜플이라는 문제답게 삽입된 순서를 기억하여 삽입된 원소를 차례차례 삽입해주는것이다.   
```
import Foundation

func solution(_ s:String) -> [Int] {
    var num = s.components(separatedBy:[",","{","}"])
    var num2 = num.split(separator:"")
    var result = Set<Int>()
    for n in num2 {
        let value = n.map{String($0)}
        for v in value {
            result.insert(Int(v)!)
        }
    }
    var value: [Int] = []
    for r in result {
        value.append(r)
    }
    return value
}
```
