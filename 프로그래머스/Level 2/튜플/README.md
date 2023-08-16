그저 배열을 중복제거하여 출력하는것이라고 판단하여 풀었다.   
하지만 튜플이라는 문제답게 삽입된 순서를 기억하여 삽입된 원소를 차례차례 삽입해주는것이다.   
```
import Foundation

func solution(_ s:String) -> [Int] {
    var num = s.components(separatedBy:[",","{","}"])
    var num2 = num.split(separator:"")
    var result = Set<Int>()
    for n in num2 {
        let value = n.map{String($0)}
        for v in value {
            result.insert(Int(v)!)
        }
    }
    var value: [Int] = []
    for r in result {
        value.append(r)
    }
    return value
}
```
주어진 s를 앞뒤를 잘라주고 },{ 를 기준으로 잘라낸다음 ,을 기준으로 배열을 만들어준다   
그 후 만들어진 배열의 수가 적은 순서대로 정렬해준다.   
```
import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    s.removeFirst(2)
    s.removeLast(2)
    var num = s.components(separatedBy:"},{").map{$0.components(separatedBy:",").map{Int($0)!}}.sorted{$0.count < $1.count}
    //print(num)
    var copy: [Int] = []
    var result: [Int] = []
    
    for n in num {
        for i in n {
            if !result.contains(i) {
                result.append(i)
                break
            }
        }
    }
    //print(result)
    return result
}
```
