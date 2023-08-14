String(value, radix: ?) 를 이용해 이진변환을 할 줄 안다면 쉽게 풀이할 수 있는 문제였다.   
```
import Foundation

func solution(_ s:String) -> [Int] {
    var result: [Int] = []
    var s = s
    var (one,zero) = (0,0)
    var count = 0
    // 이진 변환 결과가 1일때 까지
    while s != "1" {
        // 0제거
        one = s.components(separatedBy:"0").joined().map{String($0)}.count
        zero += s.components(separatedBy:"1").joined().map{String($0)}.count
        // 이진변환결과
        s = String(one, radix: 2)
        count += 1
    }
    result.append(count)
    result.append(zero)
    return result
}
```
