첫 제출   
점수의 최대 값이 2000이므로   
완전 탐색으로도 충분히 해결이 가능하다고 판단   
```
import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var store: [Int] = []
    var result: [Int] = []
    for i in score {
        store.append(i)
        store.sort(by:>)
        if store.count <= k {
            result.append(store.last!)
        } else {
            result.append(store[k-1])
        }
    }
    //print(result)
    return result
}
```
값이 더 커진다면 우선순위 큐를 이용해 풀이해야 할것이다.   
