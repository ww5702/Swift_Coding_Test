첫 제출   
먼저 괄호가 열리는 경우 break   
아니라면 끝났을때 열리고 닫히고가 정상적으로 되었다면 cnt+=1    
하지만 테스트케이스 14 하나 실패   
{(})이더라도 올바른 테스트케이스라고 판단하는것   

```
import Foundation
func solution(_ s:String) -> Int {
    var queue = s.map{String($0)}
    var count = 0
    for i in 0..<s.count {
        // check
        var (smallA,smallB,mediumA,mediumB,bigA,bigB) = (0,0,0,0,0,0)
        for q in queue {
            switch(q) {
                case "{":
                bigA += 1
                break
                case "}":
                bigB += 1
                break
                case "[":
                mediumA += 1
                break
                case "]":
                mediumB += 1
                break
                case "(":
                smallA += 1
                break
                case ")":
                smallB += 1
                break
                default:
                break
            }
            // 만약 닫히는 괄호가 먼저 나왔다면 break
            if bigA < bigB || mediumA < mediumB || smallA < smallB { break }
        }
        
        // 만약 괄호가 잘 열리고 닫혔다면
        if bigA == bigB && mediumA == mediumB && smallA == smallB { count += 1 }
        
        // 회전
        let input = queue.removeFirst()
        queue.insert(input, at: queue.count)
    }
    return count
}
```
