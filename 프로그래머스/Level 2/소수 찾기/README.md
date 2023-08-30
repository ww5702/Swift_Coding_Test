주어진 숫자를 1자리 2자리 3자리 ... 숫자.count까지 글자수를 나눠가며   
순열을 구해준다 (permutation)   
구해진 순열을 011과 같은 수를 11로 변환시켜준 뒤 소수인지 아닌지 판별을 한다.   
같은 숫자가 소수로 판단될 경우를 생각해 Set배열을 이용해 중복을 제거하여 제출한다.   
```
import Foundation
func permutation<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    var stack: [([T], [Bool])] = array.enumerated().map {
        var visited = Array(repeating: false, count: array.count)
        visited[$0.offset] = true
        return ([$0.element], visited)
    }
    
    while stack.count > 0 {
        let now = stack.removeLast()
        
        let elements = now.0
        var visited = now.1
        
        if elements.count == n {
            result.append(elements)
            continue
        }
        
        for i in 0...array.count-1 {
            if visited[i] { continue }
            visited[i] = true
            stack.append((elements + [array[i]], visited))
            visited[i] = false
        }
    }
    
    return result
}
func isPrime(_ num: Int) -> Bool {
    if (num < 4) {
        return num <= 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if (num % i == 0) { return false }
    }
    return true
}
func solution(_ numbers:String) -> Int {
    var numbers = numbers.map{String($0)}
    var arr = Set<Int>()
    for i in 0..<numbers.count {
        let value = permutation(numbers, i+1)
        for v in value {
            let num = Int(v.joined())!
            if isPrime(num) {
                arr.insert(num)
            }
        }
    }
    //print(arr)
    return arr.count
}
```
