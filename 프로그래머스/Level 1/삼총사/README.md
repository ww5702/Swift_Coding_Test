첫 제출   
길이가 13까지밖에 없기에 3중반복문으로 구현한다면 쉽게 풀이할 수 있다.   
```
import Foundation

func solution(_ number:[Int]) -> Int {
    var answer = 0
    for i in 0..<number.count {
        for j in i+1..<number.count {
            for k in j+1..<number.count {
                let sum = number[i] + number[j] + number[k]
                if sum == 0 {answer += 1}
            }
        }
    }
    return answer
}
```
