첫 제출   
당연히 removeFirst()는 시간복잡도가 O(N)이기에 popFisrt()로 구현해봤지만   
시간초과는 매한가지였다.   
```
import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var q1 = queue1[queue1.startIndex...]
    var q2 = queue2[queue2.startIndex...]
    let limit = q1.count + q2.count
    var answer = 0
    while true {
        if q1.reduce(0,+) > q2.reduce(0,+) {
            let num = q1.popFirst()
            q2.append(num!)
            answer += 1
        } else if q1.reduce(0,+) < q2.reduce(0,+) {
            let num = q2.popFirst()
            q1.append(num!)
            answer += 1
        } else {
            break
        }
        
        // 너무 오래되면 break
        if answer > limit {
            answer = -1
            break
        }
        //print(q1, q2, answer)
    }
    //print(answer)
    return answer
}
```
