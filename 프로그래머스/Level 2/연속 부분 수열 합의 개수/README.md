첫 제출   
원형 스택처럼 index가 마지막 원소라면 다음 원소는 0으로 돌아가는 구조이다.   
일단 첫 제출로는 연속부분수열 개수가 index와 더했을때 배열의 크기를 넘어가면 나눠서 더해주도록 구현했다.   
하지만 일일이 비교하는 구조기에 배열이 커진다면 시간초과가 발생한다.   
```
import Foundation

func solution(_ elements:[Int]) -> Int {
    var result = Set<Int>()
    var answer = 0
    var cnt = 1
    while cnt < elements.count {
        for e in 0..<elements.count{
            // 만약 연속 부분수열이 뒤로 넘어가지않는다면
            if e + cnt <= elements.count {
                let arr = elements[e..<e+cnt]
                let sum = arr.reduce(0,+)
                //print(arr, sum)
                result.insert(sum)
                //print("저장 ",result)
            } else {
                // 만약 연속 부분수열이 최대값을 넘어갔다면
                let arr1 = elements[e..<elements.count]
                let arr2 = elements[0..<e+cnt-elements.count]
                let sum = arr1.reduce(0,+) + arr2.reduce(0,+)
                //print("넘어감")
                //print(arr1, arr2, sum)
                result.insert(sum)
                //print("저장 ",result)
            }
        }
        cnt += 1
    }
    result.insert(elements.reduce(0,+))
    //print(result.count)
    return result.count
}
```
두번째 제출   
같은 이론이지만 구현하는 방식이 다르다.   
index가 0부터 시작해서 0, 0~1, 0~2, 0~3 처럼 더해준 값을 set배열에 넣어주고,   
1부터 시작해서 1, 1~2, 1~3, 1~4 1~5, 1~5 + 0... 처럼 더해준 값을 set배열에 넣어준다.   
```
import Foundation

func solution(_ elements:[Int]) -> Int {
    var result = Set<Int>()
    for i in 0..<elements.count {
        var number = 0
        for offset in 0..<elements.count {
            let value = (i + offset) % elements.count
            //print(value)
            number += elements[value]
            result.insert(number)
        }
        //print(result)
    }
    return result.count
}
```
