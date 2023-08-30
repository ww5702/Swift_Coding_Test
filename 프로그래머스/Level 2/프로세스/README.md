우선순위가 가장 높은값이 빠져나간다면 result += 1   
그리고 stack들의 값들을 remove해준다.   
만약 우선순위가 가장 높은값이 빠져나간게 아니라면 remove & 맨뒤로 append까지 해준다.   
index값은 계속해서 이동할것이기 때문에 -1 해주거나 맨뒤로 이동시켜준다.   

```
import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var p = priorities
    var result = 0
    var location = location
    while p.count != 0 {
        // location값이 계속해서 이동하므로 -1
        location -= 1
        let max = p.max()!
        let l = p[0]
        // 만약 우선순위가 가장 높은값이 제일 왼쪽에 있다면
        // 빠져나간다는 의미로 removeFirst() 해주고 Result += 1
        // 만약 아니라면 p[0]값을 제일 뒤로 이동, removeFirst()
        if l != max {
            p.append(l)
            p.removeFirst()
            if location < 0 { location = p.count-1 }
        } else {
            result += 1
            p.removeFirst()
            // location이 -1이라면 뽑으려는 값이 빠져나갔다는 뜻
            if location < 0 { break }
        }
    }
    return result
}
```
