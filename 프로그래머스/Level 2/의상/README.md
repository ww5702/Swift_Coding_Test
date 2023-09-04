딕셔너리로 각 의상들의 갯수를 구해준다.   
상의 2벌, 하의 3벌이면 (2+1)x(3+1)로 12가지 이다.   
하지만 아예 안입는 경우는 배제한다고 했으므로 -1   
```
import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var comb: [String:Int] = [:]
    for c in clothes {
        if comb[c[1]] != nil {
            comb[c[1]]! += 1
        } else {
            comb[c[1]] = 1
        }
    }
    var sum = 1
    for (index, value) in comb {
        sum *= (value + 1)
    }
    return sum-1
}
```
곱셈 부분을 고차함수로도 전개할 수 있다.   

```
import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var comb: [String:Int] = [:]
    for c in clothes {
        if comb[c[1]] != nil {
            comb[c[1]]! += 1
        } else {
            comb[c[1]] = 1
        }
    }
    var sum = 1
    var arr = comb.map{(val1: String, val2: Int) -> Int in return val2+1 }
    return arr.reduce(1){$0*$1}-1
}
```
