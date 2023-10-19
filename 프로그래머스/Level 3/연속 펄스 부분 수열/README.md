구현으로 풀긴 풀었으나 500,000개의 index가 있어 시간초과가 당연히 발생   
dp로 풀이하면 더 시간을 줄일 수 있을것 같았다.   
```
import Foundation

func solution(_ sequence:[Int]) -> Int64 {
    /*
    -1, 1, -1, 1 을 반복해서 곱하거나
    1, -1, 1, -1 을 반복해서 곱할 수 있다
    */
    func calculate(_ index: Int, _ start: Int) -> Int {
        // sequence[index]부터 끝까지
        var sum = 0, result = -987654321, giho = start
        var end = sequence.count
        // 끝지점을 하나씩 줄이면서 더하다가 시작 Index와 같아진다면 break
        while index <= end {
            for i in index..<end {
                sum += (sequence[i]*giho)
                giho *= -1
            }
            result = result < sum ? sum : result
            // 합과 기호를 초기화, 끝에서 한칸씩 당겨주기
            sum = 0
            giho = start
            end -= 1
        }
        return result
    }
    var cache: [Int] = Array(repeating: -987654321, count: sequence.count)
    for i in 0..<sequence.count {
        // 첫번째 숫자부터 시작해서 1,-1,1... 을 곱하거나
        // -1, 1, -1...을 곱하거나
        let a = calculate(i, 1)
        let b = calculate(i, -1)
        cache[i] = a > b ? a : b
    }
    //print(cache)
    return Int64(cache.max()!)
}
```
배열을 2개를 만들어 그전까지 연속된 값들 vs 현재값부터 다시 시작하더라도 이게 더 크다   
이 점화식을 떠올릴 수 있다면 쉽게 풀 수 있다.   
3번째 index까지 더한값이 -2 4번째 index값이 -1이라면 4번째 index부터 다시 저장하고   
연속된 값들을 비교해주는 것이다.   
```
import Foundation

func solution(_ sequence:[Int]) -> Int64 {
    /*
    -1, 1, -1, 1 을 반복해서 곱하거나
    1, -1, 1, -1 을 반복해서 곱할 수 있다
    */
    var cache1: [Int] = Array(repeating: -987654321, count: sequence.count)
    var cache2: [Int] = Array(repeating: -987654321, count: sequence.count)
    var num1 = [-1]
    var num2 = [1]
    
    var giho = 1
    
    for i in 1..<sequence.count {
        num1.append(giho)
        num2.append(-giho)
        giho *= -1
    }
    
    cache1[0] = num1[0] * sequence[0]
    cache2[0] = num2[0] * sequence[0]
    
    for i in 1..<sequence.count {
        cache1[i] = max(sequence[i]*num1[i], cache1[i-1]+(sequence[i]*num1[i]))
        cache2[i] = max(sequence[i]*num2[i], cache2[i-1]+(sequence[i]*num2[i]))
    }
    return Int64(max(cache1.max()!, cache2.max()!))
}
```
