단순하게 주어진 a의 수보다 최소한의 수로 큰 수로 이기는게 가장 많이 이길수 있지 않을까 생각하였다.   
하지만 주어진 조건이 각 수가 100,000개가 넘어가는데 매번 filter, sorting을 하면 시간초과가 걸린다.   

```
import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var b = b
    var result = 0
    for i in a {
        var value = b.filter{$0>i}.sorted(by:<)
        if value.count >= 1 {
            var index = b.firstIndex(of: value[0])!
            b.remove(at: index)
            result += 1
        }
    }
    //print(result)
    return result
}
```
