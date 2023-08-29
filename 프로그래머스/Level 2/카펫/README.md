모든 타일의 개수를 더한뒤 제곱근이 정수로 떨어진다면 그대로 return   
아니라면 기본값으로 min을 주어준뒤 +1씩 하면서 진행   
하지만 수가 기하급수적으로 커진다면 시간초과   
```
import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var result: [Int] = []
    var sum = brown + yellow
    var min = Int(sqrt(Double(sum)))
    var cnt = 1
    if Int(pow(Double(min), 2)) == sum {
        return [min, min]
    } else {
        while true {
            if min * (min+cnt) == sum { break }
            cnt += 1
        }
    }
    return [min+cnt, min]
}
```
제곱근 가까운 수를 합과 나누면 정답이 되지 않을까 판단하여 다시 풀이   
하지만 시간초과는 일어나지않았지만 실패   

```
import Foundation
func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var sum = brown + yellow
    var min = Int(sqrt(Double(sum)))
    if Int(pow(Double(min), 2)) == sum {
        return [min, min]
    } else {
        return [(sum/min), min]
    }
}
```
