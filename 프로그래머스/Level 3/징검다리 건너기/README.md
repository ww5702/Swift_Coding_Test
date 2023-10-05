제일 먼저 떠올릴 수 있는 방법은 1씩 빼다가 0이 k개만큼 나오면 break해주는것이다.   
하지만 당연하게도 효율성에서 실패판정을 받았다.   

```
import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var stones = stones
    var result = 0
    var zeroCnt = 0
    var possible = true
    while zeroCnt < k{
        zeroCnt = 0
        for i in 0..<stones.count {
            if stones[i] == 0 { zeroCnt += 1}
            else { zeroCnt = 0 }
            
            if zeroCnt == k { possible.toggle()
                             break }
            
            if stones[i] - 1 < 0 {
                stones[i] = 0
            } else {
                stones[i] -= 1
            }
        }
        if possible { result += 1}
        possible = true
    }
    return result
}
```
