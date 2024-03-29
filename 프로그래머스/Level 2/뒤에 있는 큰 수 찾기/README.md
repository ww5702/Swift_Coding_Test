i를 i+1부터 끝까지 탐색하며 완전탐색으로 풀이해보았다.   
당연히 100,000개의 큰 범위일때 n(n-1)의 시간복잡도는 시간초과를 야기한다.   

```
import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result: [Int] = []
    for i in 0..<numbers.count-1 {
        var temp: Int = numbers[i]
        for j in i+1..<numbers.count {
            if temp < numbers[j] {
                temp = numbers[j]
                break
            }
        }
        if temp == numbers[i] {
            result.append(-1)
        } else {
            result.append(temp)
        }
    }
    // 마지막 수는 -1이 무조건 들어간다.
    result.append(-1)
    //print(result)
    return result
}
```
두번째 제출   
반복문 속에 append를 해주고 코드를 좀더 간결화하였다.   
하지만 또 시간초과   
```
import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result: [Int] = []
    for i in 0..<numbers.count-1 {
        for j in i+1..<numbers.count {
            if numbers[i] < numbers[j] {
                result.append(numbers[j])
                break
            }
        }
        if result.count != i+1 {result.append(-1)}
    }
    // 마지막 수는 -1이 무조건 들어간다.
    result.append(-1)
    //print(result)
    return result
}
```
세번째 제출   
스택을 이용해 만약 스택이 비어있지않고, 해당 숫자가 더 크다면 -1로 통일되어있는 배열을 바꿔준다.   
```
import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result = [Int](repeating: -1, count: numbers.count)
    var stack = [Int]()
    
    for i in 0..<numbers.count {
        // 스택이 비어있지 않고, 스택의 마지막이 현재의 숫자보다 크다면
        // result를 교체해주면서 return
        while !stack.isEmpty && numbers[stack.last!] < numbers[i]{
            result[stack.popLast()!] = numbers[i]
            //print(result)
        }
        stack.append(i)
        //print(stack)
    }
    return result
}

```
