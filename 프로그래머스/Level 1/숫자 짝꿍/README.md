첫 제출   
어차피 수는 0~9이기에 array를 통해 공통된 수를 증가시켰고,   
내림차순으로 정렬 후 0의 경우의 수를 제외하고 Int로 변화시켜줬다.   
하지만 0일때의 경우의수가 생각보다 많아서 실패가 나왔다.   
```
import Foundation

func solution(_ X:String, _ Y:String) -> String {
    let x = X.map{String($0)}
    let y = Y.map{String($0)}
    //print(x,y)
    var xArr = Array(repeating: 0, count: 10)
    var yArr = Array(repeating: 0, count: 10)
    for i in x {
        let index = Int(i)!
        xArr[index] += 1
    }
    for i in y {
        let index = Int(i)!
        yArr[index] += 1
    }
    //print(xArr)
    //print(yArr)
    var result: [String] = []
    for i in 0..<10 {
        if xArr[i] != 0 && yArr[i] != 0 {
            var value = 0
            if i == 0 { value = 1 }
            else { value = min(xArr[i],yArr[i]) }
            for v in 0..<value {
                result.append(String(i))
            }
        }
    }
    //print(result)
    if result.count == 0 {
        return "-1"
    } else {
        result.sort(by:>)
        return "\(Int(result.joined(separator:""))!)"
    }
}
```
두 번째 제출   
방식은 위와 같지만 매우 간단하게 코드를 줄일 수 있었고,   
무엇보다 "0000" 와 같은 경우일때 첫 번째 제출의 0을 피해갈 수 있던 점이 문제였다.   
```
import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var list: [String] = []
    for i in 0..<10 {
        let xCount = X.filter{ String($0) == String(i) }.count
        let yCount = Y.filter{ String($0) == String(i) }.count
        list += Array(repeating: String(i), count: min(xCount, yCount))
    }
    //print(list)
    
    return list.isEmpty ? "-1" : list.filter { $0 == "0" }.count == list.count ? "0" : list.sorted(by: >).joined()
}
```
