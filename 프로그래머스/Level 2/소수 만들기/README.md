조합을 만드는 함수를 구현하고, 소수를 구분하는 함수를 구현해서 true일때마다 answer+1을 해준다.   

```
import Foundation
func combination<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    var stack = array.enumerated().map { ([$0.element], $0.offset) }
    
    while stack.count > 0 {
        // print(stack)
        let now = stack.removeLast()
        
        let elements = now.0
        let index = now.1
        
        if elements.count == n {
            result.append(elements.sorted())
            continue
        }
        
        guard index+1 <= array.count-1 else { continue }
        
        for i in index+1...array.count-1 {
            stack.append((elements + [array[i]], i))
        }
        
    }
    
    return result
}
func isPrime(_ num: Int) -> Bool {
    if num < 4 {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 { return false }
    }
    return true
}
func solution(_ nums:[Int]) -> Int {
    var answer = 0
    let arr = combination(nums, 3)
    for a in arr {
        let num = a.reduce(0,+)
        if isPrime(num) { answer += 1}
    }
    return answer
}
```
