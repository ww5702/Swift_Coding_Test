첫 제출   
약수의 개수가 홀수인 경우는 제곱근이 있는 경우밖에 존재하지 않는다.   
```
import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var result = 0
    for i in left...right {
        result += Double(Int(sqrt(Double(i)))) == sqrt(Double(i)) ? -i : i
    }
    return result
}
```
