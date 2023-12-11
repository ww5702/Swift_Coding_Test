## 25192 인사성 밝은 곰곰이
set 함수를 이용해 중복을 제거해주면서 정답을 추가해준다.
```
import Foundation
func solution() {
    let N = Int(readLine()!)!
    var list = Set<String>()
    var answer = 0
    for _ in 0..<N {
        let value = readLine()!
        if value == "ENTER" {
            answer += list.count
            list.removeAll()
        } else {
            list.insert(value)
        }
        //print(list, answer)
    }
    answer += list.count
    print(answer)
}
solution()

```
## 26069 붙임성 좋은 총총이
set 함수를 이용해 무지개춤을 추는 사람을 특정해준다.   

```
import Foundation
func solution() {
    let N = Int(readLine()!)!
    var list = Set<String>()
    list.insert("ChongChong")
    for _ in 0..<N {
        let value = readLine()!.split(separator: " ").map{String($0)}
        if list.contains(value[0]) || list.contains(value[1]) {
            list.insert(value[0])
            list.insert(value[1])
        }
    }
    print(list.count)
}

solution()

```
