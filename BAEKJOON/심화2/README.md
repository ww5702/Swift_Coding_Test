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
