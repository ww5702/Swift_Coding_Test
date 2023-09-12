```
import Foundation

func solution(_ s:String) -> Int{
    var answer:Int = -1
    var s = s.map{String($0)}
    var idx = 0
    while true {
        //print("현재 ",s, idx)
        // 같은 글자를 발견
        if s[idx] == s[idx+1] {
            s.remove(at: idx)
            s.remove(at: idx)
            //print("제거 후 ",s)
            
            // 어차피 처음으로 돌아가는것이 아닌 삭제된 배열 앞으로만
            // index가 돌아가면 된다.
            if idx >= 1 {
                idx -= 1
            } else {
                idx = 0
            }
        } else {
            idx += 1
        }
        // 배열이 비었다면 return
        if s.isEmpty { 
            return 1
        }
        // 만약 index를 끝까지 살펴봤다면 return
        if idx == s.count-1 { break }
    }
    return 0
}
```
시간초과가 발생   
따라서 삭제는 removeLast()만 진행해주는 방식으로 구현   
반복문을 돌면서 추가하지않고, 제일 뒷 글자를 삭제해주면 2글자를 삭제해주는 것고 같아진다.   

```
import Foundation

func solution(_ s:String) -> Int{
    var s = Array(s)
    let length = s.count
    var result: [Character] = []
    
    for i in 0..<length {
        if !result.isEmpty && result.last == s[i] {
            result.removeLast()
        } else {
            result.append(s[i])
        }
    }
    return result.isEmpty ? 1 : 0
}
```
