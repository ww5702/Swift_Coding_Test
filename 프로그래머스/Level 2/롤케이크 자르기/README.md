첫 제출   
범위를 정해 앞범위 뒷범위의 set배열로 잡아 비교해서 수가 같다면 +1로 생각하고 풀이하였다.   
하지만 O(n^2)로 시간초과 발생   
```
import Foundation

func solution(_ topping:[Int]) -> Int {
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
두번째 제출   
0/전부로 배열을 설정   
전체 토핑의 개수를 다른 배열로 설정해 다른사람에게 토핑이 하나씩 넘어갔을때   
토핑개수 배열에서 -1,   
토핑개수가 0이 된다면 b사람에게 해당 토핑 삭제   
```
import Foundation

func solution(_ topping:[Int]) -> Int {
    var answer = 0
    var a = Set<Int>()
    var b = Set<Int>(Set(topping))
    //print(a,b)
    let maxValue = topping.max()!
    // 토핑의 개수 확인
    var toppingArr = Array(repeating: 0, count: maxValue+1)
    for t in topping {
        toppingArr[t] += 1
    }
    for t in topping {
        a.insert(t)
        // a 사람에게 토핑 하나 추가
        // 추가된만큼 개수를 샜던 arr에서 하나 빼고
        // 뺐을때 전체 개수가 0이라면 b 사람에게 해당 토핑 삭제
        toppingArr[t] -= 1
        if toppingArr[t] <= 0 {
            b.remove(t)
        }
        
        if a.count == b.count { answer += 1}
    }
    
    return answer
}
```
