우선순위큐가 아닌 주어진 문법대로 풀이했다.   
이렇게 풀더라도 정답처리가 되긴하였다.   

```
import Foundation
func solution(_ operations:[String]) -> [Int] {
    var arr: [Int] = []
    for o in operations {
        var value = o.components(separatedBy:" ")
        let order = value[0]
        let number = value[1]
        // input
        if order == "I" {
            arr.append(Int(number)!)
        } else {
            // 배열이 비어있다면 무시
            if arr.isEmpty {
                continue
            } else {
                // 최대값 삭제
                if number == "1" {
                    var max = arr.max()!
                    arr.remove(at: arr.firstIndex(of: max)!)
                } else {
                // 최소값 삭제
                    var min = arr.min()!
                    arr.remove(at: arr.firstIndex(of: min)!)
                }
            }
        }
    }
    return arr.isEmpty ? [0,0] : [arr.max()!,arr.min()!]
}
```
