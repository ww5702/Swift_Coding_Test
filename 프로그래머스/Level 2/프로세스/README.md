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
removeFisrt()는 시간복잡도 O(n)의 복잡도를 가져 시간초과를 가져올 수 도있다.   
따라서 index를 따로 설정해 오른칸으로 한칸씩 이동하며   
우선순위값이 빠진다면 result += 1 우선순위값이 빠진게 아니라면 append를 해주며 오른쪽으로 이동한다.   
removeFirst를 사용하지 않는것이다.   
만약 max값이 아닌데 빠져야하다 location과 index가 같은 순간은 location값이 맨 뒤로 이동하게 되므로 count-1로 설정해준다.   

```
import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var p = priorities
    var result = 0
    var index = 0
    var location = location
    while p.count != 0 {
        let max = p.max()!
        if p[index] != max {
            p.append(p[index])
            p[index] = 0
            if location == index { location = p.count - 1}
        } else {
            result += 1
            p[index] = 0
            if index == location { break }
        }
        index += 1
    }
    return result
}
```
