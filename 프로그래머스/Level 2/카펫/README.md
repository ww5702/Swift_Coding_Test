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
따라서 약수를 찾는 방식으로 진행   
