로또가 맞은 개수를 count해주고, 0의 개수만큼 다 맞는다면 최고, 다 틀렸다면 최저순위이다.   
```
import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var result: [Int] = []
    var cnt = 0
    for l in lottos {
        if win_nums.contains(l) {
            cnt += 1
        }
    }
    var zero = lottos.filter{$0 == 0}
    var check: [Int] = [cnt+zero.count, cnt]
    for c in check {
        switch(c) {
        case 6:
        result.append(1)
        break
        case 5:
        result.append(2)
        break
        case 4:
        result.append(3)
        break
        case 3:
        result.append(4)
        break
        case 2:
        result.append(5)
        break
        default:
        result.append(6)
        break
        }
    }
    return result
}
```
