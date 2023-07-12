첫 제출   
문제의 범위가 1,000,000이므로 하나의 반복문만 이용한다면 쉽게 풀이가 가능하다.   
```
import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var empty = a
    var cola = b
    var remain = n
    var answer = 0
    while remain >= empty {
        let refill = (remain/empty)*cola
        answer += refill
        remain = remain - (empty * (remain/empty)) + refill
        // print("남음병 : ", remain)
        // print("플러스 : ", refill)
        // print("리필 : ", answer)
        // print("---")
    }
    return answer
}
```
