하나는 +1 하나는 -1일때의 그래프를 구성해 문제를 풀이한다.   

```
import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0
    
    func dfs(_ index: Int, _ sum: Int) {
        // 마지막 인덱스까지 더했을때 target과 합이 같다면 return
        if index == numbers.count && sum == target {
            count += 1
            return
        }
        
        guard index < numbers.count else { return }
        
        // 하나는 +1이고 하나는 -1인 경우
        dfs(index+1, sum + numbers[index])
        dfs(index+1, sum - numbers[index])
        
    }
    
    dfs(0, 0)
    return count
}
```
