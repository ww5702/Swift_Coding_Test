```
import Foundation
/*
최대한 많이 들어가야하므로 오름차순으로 sorting을 진행 후 
하나씩 집어넣다가 남은 예산을 넣었을때 초과된다면 return
만약 다 넣었음에도 예산이 남았다면 그대로 return
*/
func solution(_ d:[Int], _ budget:Int) -> Int {
    var d = d
    var arr = d.sorted(by: <)
    var (sum,result) = (0,0)
    while true {
        if (budget-sum) < arr[0] { break }
        sum += arr.removeFirst()
        result += 1
        if arr.isEmpty { break }
    }
    return result
}
```
