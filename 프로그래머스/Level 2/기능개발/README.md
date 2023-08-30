progress[0]을 100에서 빼준다음 speeds[0]으로 100을 넘기는 몫을 구해준다.   
그리고 해당 값을 넘기지 못한다면 계속해서 +1   
만약 해당값보다 뒤에 끝나는 기능이라면 releaseDay를 해당값으로 변경 후 1을 추가해준다.   
```
import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result: [Int] = []
    var lastReleaseDay = 0
    for i in 0..<progresses.count {
        let value = Int(ceil(Double(100-progresses[i])/Double(speeds[i])))
        //print(value)
        if value > lastReleaseDay {
            lastReleaseDay = value
            result.append(1)
        } else {
            result[result.count-1] += 1
        }
    }
    return result
}
```
하지만 해당 문제는 스택/큐 문제이므로 스택과 큐로 다시 풀이하였다.   
