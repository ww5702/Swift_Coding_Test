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
