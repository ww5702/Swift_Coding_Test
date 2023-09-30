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
조금만 더 생각하면 풀 수 있었다.   
어차피 100,000개의 index이더라도 반복문을 하나만 사용한다면 시간초과가 걸릴 수 없는데   
a와 b를 내림차순으로 정렬후 a를 순환시킨다.   
만약 b가 a보다 더 큰 순간에만 한칸씩 다음 b의 값으로 넘겨준다.   
이렇게 될 경우 항상 그 순간의 최대 b의 값으로 최대 a의 값을 이겨줄 수 있다.   
```
import Foundation
func solution(_ a:[Int], _ b:[Int]) -> Int {
    var a = a.sorted(by: >)
    var b = b.sorted(by: >)
    var result = 0
    var bindex = 0
    for i in 0..<a.count {
        if b[bindex] > a[i] {
            bindex += 1
            result += 1
        }
    }
    return result
}
```
