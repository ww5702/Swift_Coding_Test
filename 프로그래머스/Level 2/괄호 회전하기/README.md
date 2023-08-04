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
두번째 제출   
아예 하나씩 추가하면서 그때그때 옳은지 확인하는 구조로 바꾸었다.   
만약 뒤에서부터 확인하면서 닫힌괄호일때 올바른 문법으로 닫혔으면 둘을 삭제해준다.   
아니라면 추가해주고, 끝까지 돌았을때 queue에 남았다면 false   
```
import Foundation
func isCorrect(_ s: String) -> Bool {
    var queue: [Character] = []
    
    for c in s {
        if queue.isEmpty {
            queue.append(c)
        } else {
            guard let last = queue.last else { continue }
            switch last {
            case "[": if c == "]" { queue.removeLast() } else { queue.append(c) }
            case "(": if c == ")" { queue.removeLast() } else { queue.append(c) }
            case "{": if c == "}" { queue.removeLast() } else { queue.append(c) }
            default: queue.append(c)
            }
        }
    }
    
    return queue.isEmpty
}

func solution(_ s:String) -> Int {
    var count = 0
    
    for offset in 0..<s.count {
        let startIndex = s.index(s.startIndex, offsetBy: offset)
        let str = s[startIndex..<s.endIndex] + s[s.startIndex..<startIndex]
        if isCorrect(String(str)) { count += 1 }
    }
    
    return count
}
```
