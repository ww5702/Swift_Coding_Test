enemy값을 오름차순으로 정렬 후   
숫자를 빼다가 남은 병사의 수가 0보다 작아진다면 이미 전에 뺏던 값들중 최대값을 더해준다   
그게 곧 최대값들중 하나를 뺀것과 동일하기 때문   
하지만 시간초과   
아마 계속해서 sorting을 해주는것이라 판단   
```
import Foundation

func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    var n = n
    var k = k
    var cnt = 0
    var list: [Int] = []
    for i in 0..<enemy.count {
        list.append(enemy[i])
        list.sort(by:>)
        // 남아있는 병사의 수가 더 작고 무적권이 없다면 리턴
        if n - enemy[i] >= 0 {
            n -= enemy[i]
        } else if k > 0 {
            n = n - enemy[i] + list[0]
            list.removeFirst()
            k -= 1
        } else {
            return cnt
        }
        cnt += 1
        
    }
    
    return cnt
}
```
두번째 제출   
heap구조를 추가해주기로 결정하였다.   
