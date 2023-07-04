첫 제출   
주어진 글자를 한 글자씩 나눈 후   
뒤에서부터 index를 내려가면서 확인하면서 일치한다면 해당 Index를 append해준다.   
만일 없다면 -1을 append해준다.   

```
import Foundation

func solution(_ s:String) -> [Int] {
    var value = s.map{String($0)}
    //print(value)
    var result: [Int] = []
    for i in 0..<value.count {
        var index = i
        var isExist = false
        while (index > 0) {
            index -= 1
            if value[index] == value[i] {
                result.append(i-index)
                isExist = true
                break
            }
        }
        if isExist == false {
            result.append(-1)
        }
    }
    //print(result)
    return result
}
```
