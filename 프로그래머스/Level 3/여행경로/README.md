dfs로 접근하여 풀이하면 쉽게 풀릴거라 생각하였다.   
하지만 1,2번의 테스트케이스가 계속해서 오류가 발생하였다.   
반례로 ICN B / ICN A / B ICN이 있을때   
밑의 코드로 풀게 된다면   
ICN ICN B ICN이 된다.   
도착 공항을 알파벳 순서로 정렬하게 됨으로써   
ICN A가 먼저 들어가게 되고,   
A로 시작하는 공항이 없으므로 그대로 다음 반복문이 실행되어 ICN B가 또 들어가게 된다   
이때 result는 이미 ICN ICN 이 되게 되는것이다   
그다음 ICN ICN B ICN이 되어 자연스럽게 return이 된다.   

```
import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    let tickets = tickets.sorted{$0[1] < $1[1]}
    var visited = Array(repeating: false, count: tickets.count)
    var result: [String] = []
    func dfs(_ start: String) {
        
        // 현재 방문한 도시 수가 티켓수와 같다면 return
        if result.count == tickets.count {
            result.append(start)
            return
        }
        for i in 0..<tickets.count {
            if tickets[i][0] == start && !visited[i] {
                visited[i] = true
                result.append(start)
                dfs(tickets[i][1])
                if result.count == tickets.count {
                    return
                }
            }
        }
        
    }
    // 시작지점은 ICN이라고 나와있다
    dfs("ICN")
    //print(result)
    return result
}
```
