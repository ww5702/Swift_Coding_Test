 첫 제출   
 이중 반복문을 사용하여 누구나 떠올릴수있는 방법으로 풀이하였다.   
 당연히 최악의 경우 시간초과가 발생하게 된다.   

```
import Foundation

func solution(_ n:Int, _ l:Int64, _ r:Int64) -> Int {
    let one = "11011"
    let zero = "00000"
    var result = "1"
    for i in 0..<n {
        var value = result.map{String($0)}
        var temp = ""
        for j in value {
            if j == "1" {
                temp.append(one)
            } else {
                temp.append(zero)
            }
        }
        result = temp
    }
    //print(result)
    var checkAnswer = result.map{String($0)}[Int(l-1)...Int(r-1)]
    var cnt = 0
    for i in checkAnswer {
        if i == "1" { cnt += 1}
    }
    //print(cnt)
    return cnt
}
// 11011
// 110/11 11011 00000 11/011 11011
```
