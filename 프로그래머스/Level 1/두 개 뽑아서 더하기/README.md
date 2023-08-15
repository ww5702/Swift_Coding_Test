Set를 이용해 중복을 제거해가며 두 수의 합을 더한다.   
```
import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result: Set<Int> = []
    for i in 0..<numbers.count-1 {
        for j in i+1..<numbers.count {
            result.insert(numbers[i]+numbers[j])
        }
    }
    return result.sorted(by:<)
}
```
