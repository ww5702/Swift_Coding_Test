첫 제출   
범위를 정해 앞범위 뒷범위의 set배열로 잡아 비교해서 수가 같다면 +1로 생각하고 풀이하였다.   
하지만 시간초과 발생   
```
import Foundation

func solution(_ topping:[Int]) -> Int {
    var a = Set<Int>()
    var b = Set<Int>()
    var answer = 0
    for i in 0..<topping.count-1 {
        let a = topping[0...i]
        let b = topping[i+1...topping.count-1]
        //print(Set(a), Set(b))
        if Set(a).count == Set(b).count { answer += 1}
    }
    //print(answer)
    return answer
}
```
