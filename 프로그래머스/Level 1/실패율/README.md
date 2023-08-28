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
