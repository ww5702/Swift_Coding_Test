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
따라서 심사인원이 아닌 걸리는 시간을 이분탐색을 이용하여 풀이하였다.   
```
import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    /*
    최소공배수처럼 최소값과 최대값을 구한뒤
    최대값과 최소값의 중간일때 총 몇명의 사람을 심사할수있는지 파악한다
    더 많이 심사했다면 그보다 적은 시간으로
    더 적게 심사했다면 그보다 많은 시간으로 다시 반복한다.
    max = 심사 최대 시간 * 사람의 수 
    min = 심사 최소 시간 * 사람의 수
    */
    var max = times.max()! * n
    var min = 1
    var result = 0
    while max >= min {
        let mid = (max+min)/2
        var sum = 0
        times.forEach {
            sum += (mid/$0)
        }
        if sum < n {
            // 시간이 더 필요함
            min = mid + 1
        } else {
            max = mid - 1
            result = mid
        }
    }
    return result
}
```
