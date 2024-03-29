딕셔너리를 이용하고 고차함수인 filter를 사용하면 쉽게 풀이가 가능한 문제이다.   
하지만 filter가 for문안에 들어간다면 시간복잡도가 너무 커진다.   
```
import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var failure = [Int:Double]()
    for i in 1..<N+1{
        let failNum = stages.filter({$0 == i}).count
        let clearNum = stages.filter({$0 >= i}).count
        failure[i] = Double(failNum) / Double(clearNum)
    }
    let arr = failure.sorted(by:{$0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1})
    //print(arr)
    let result = arr.map{$0.key}
    
    return result
}
```
단순 count로도 문제를 해결할 수 있다.   
코드는 더 복잡해보이지만 시간복잡도로는 더 빠른 셈   
```
import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var failure = [Int:Double]()
    var people = Double(stages.count)
    var countArr = Array(repeating:0, count: N+2)
    
    for s in stages {
        countArr[s] += 1
    }
    for i in 1..<N+1 {
        if countArr[i] == 0 {
            failure[i] = 0.0
        } else {
            people -= Double(countArr[i])
            failure[i] = Double(countArr[i]) / people
        }
    }
    let arr = failure.sorted(by:{$0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1})
    //print(arr)
    let result = arr.map{$0.key}
    
    return result
}
```
다른 사람의 풀이중 tuple을 사용해 풀이한 해결도 찾을 수 있었다.   
고차함수를 한번만 사용해 문제를 해결한 것을 확인 할 수 있었다.   
하지만 이 또한 고차함수를 사용했기에 5번과 9번이 시간초과가 발생하므로 해당부분을 count를 사용해 풀이해준다면 해결될것이다.   
```
import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var fail = [(Int,Double)]()
    var people = stages.count
    
    for i in 1...N {
        let now = stages.filter{$0 == i}.count
        people -= now
        
        let value = Double(now) / Double(people)
        fail.append((i,value))
    }
    //print(fail)
    fail = fail.sorted(by:{$0.1 > $1.1})
    //print(fail)
    return fail.map{$0.0}
}
```
