학생들은 고작 셋, 규칙적으로 그들이 적는 숫자도 정해져있다.   
따라서 세 사람의 정답 배열을 미리 지정해준다.   
dictionary를 이용해 3명의 정답을 +1 해준다.   
dictionary의 최대값을 정해준다.   
최대값과 같은 배열들을 sorting하여 return해준다.   
```
import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let one = [1,2,3,4,5]
    let two = [2,1,2,3,2,4,2,5]
    let three = [3,3,1,1,2,2,4,4,5,5]
    var result: [Int:Int] = [:]
    
    for i in 0..<answers.count {
        if answers[i] == one[i%one.count] {result[1] = (result[1] ?? 0) + 1}
        if answers[i] == two[i%two.count] {result[2] = (result[2] ?? 0) + 1}
        if answers[i] == three[i%three.count] {result[3] = (result[3] ?? 0) + 1}
        
    }
    let max = result.values.max()!
    
    return result.filter{$0.value == max}.keys.sorted(by: <)
}
```
