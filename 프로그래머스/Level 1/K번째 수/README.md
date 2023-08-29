배열을 자르고 정렬할 수 있다면 쉽게 풀 수 있는 문제이다.   
```
import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    for c in commands {
        let arr = array[c[0]-1...c[1]-1].sorted(by:<)
        result.append(arr[c[2]-1])
    }
    return result
}
```
