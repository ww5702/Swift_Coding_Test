입국심사를 해야할 사람은 10억명, 그리고 심사관은 10만명으로   
딱봐도 수가 굉장히 크다는것을 알 수있다.   
따라서 처음 생각한 방법은 심사관이 비었다면 해당 index를 이분탐색으로 찾아 집어넣고   
비는 순간 걸린 시간을 + 해주려고 했지만   
1분 기다렸다가 더 적게 걸리는 심사관한테 간다는 등의 예외를 해결할 수 없었다.   
따라서 풀이를 참고해보았다.   
```
import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    func findIndex(_ start: Int, _ end: Int, _ times:[Int]) -> Int {
        
    }
    var result = 0, n = n
    var timesEmpty = Array(repeating: true, count: times.count)
    var remainTime = times
    // 초기값 input
    for i in 0..<times.count {
        if n-1 >= 0 {
            timesEmpty[i] = false
            n -= 1
        } else {
            break
        }
    }
    print(timesEmpty,n)
    while n > 0 {
        timesEmpty.contains(true) {
        }
    }
    
    
    return 0
}
```
