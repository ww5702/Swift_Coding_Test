만약 괄호가 시작되는 ( 부분이라면 그냥 append   
하지만 괄호가 닫히는 )부분이라면 조건을 따져본다.   
만약 열린 괄호가 들어가있지 않았다면 해당 문장은 문법적으로 오류가 있으므로 false   
하지만 그게 아니라면 열린 괄호 하나를 지워준다.   

모든 괄호들을 판별했을 때 큐가 비어있다면 문법적으로 오류가 없는 문장   
큐가 남아있다면 열린 괄호들이 다 닫히지 않다는 것이므로 false   

```
import Foundation

func solution(_ s:String) -> Bool
{
    var word = s.map{String($0)}
    var queue: [String] = []
    for w in word {
        if w == "(" {
            queue.append("(")
        } else if w == ")" {
            if queue.isEmpty {
                return false
            } else {
                queue.removeLast()
            }
        }
    }
    return queue.isEmpty ? true : false
}
```
