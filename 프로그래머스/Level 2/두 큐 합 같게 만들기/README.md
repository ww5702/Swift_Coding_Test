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
두 번째 제출   
O(N)을 O(1)로 만들어줄 방법을 생각하다 index를 따로 구해 

```
import Foundation
func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var q1 = queue1
    var q2 = queue2
    var (q1Front, q2Front) = (0,0)
    var limit = q1.count + q2.count
    var answer = 0
    
    while true {
        if q1.reduce(0,+) > q2.reduce(0,+) {
            if q1Front <= q1.count {
                let element = q1[q1Front]
                q2.append(element)
            } else { break }
            q1[q1Front] = 0
            q1Front += 1
            answer += 1
        } else if q1.reduce(0,+) < q2.reduce(0,+) {
            if q2Front <= q2.count {
                let element = q2[q2Front]
                q1.append(element)
            } else { break }
            q2[q2Front] = 0
            q2Front += 1
            answer += 1
        } else {
            break
        }
        
        if answer > limit {
            answer = -1
            break
        }
    }
    //print(answer)
    return answer
}
```
세 번째 제출   
반복문마다 reduce해주는 연산도 생각보다 큰 시간을 차지할 수있겠다는 생각을 하였다.   
따라서 처음 sum1, sum2를 따로 구해주고, 반복문을 진행하였다.   
그리고 테스트케이스1번을 게속해서 틀리는 경우는   
(3,3,3,3) (3,3,21,3)을 같게 만드려면 9번의 경우가 필요한데 위의 코드는 횟수가 8번을 넘어가면 -1을 return하게 만들었기 때문에 틀리는것이다.   
횟수제한에 여유를 준다면 통과할 수 있다.   
```
import Foundation
func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var q1 = queue1
    var q2 = queue2
    var (q1Front, q2Front) = (0,0)
    var (q1Sum, q2Sum) = (q1.reduce(0,+), q2.reduce(0,+))
    var limit = q1.count + q2.count
    var answer = 0
    
    while true {
        if q1Sum > q2Sum {
            if q1Front <= q1.count {
                let element = q1[q1Front]
                q2.append(element)
                q2Sum += element
                q1Sum -= element
            } else { break }
            q1[q1Front] = 0
            q1Front += 1
            answer += 1
        } else if q1Sum < q2Sum {
            if q2Front <= q2.count {
                let element = q2[q2Front]
                q1.append(element)
                q1Sum += element
                q2Sum -= element
            } else { break }
            q2[q2Front] = 0
            q2Front += 1
            answer += 1
        } else {
            break
        }
        
        if answer > limit+2 {
            answer = -1
            break
        }
    }
    //print(answer)
    return answer
}
```
