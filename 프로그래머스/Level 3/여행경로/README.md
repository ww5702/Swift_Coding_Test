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
따라서 반복문을 다 돌려도 알맞은 공항을 찾지 못했다면 removeLast()를 해주는 코드를 추가해준다.   
그리고 removeLast를 해주기 전에 크기가 같아져서 반복문을 빠져나가는 경우를 방지해주기 위해 +1을 해주어 방지한다.   

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
                //print(start,tickets[i][1])
                result.append(start)
                dfs(tickets[i][1])
                if result.count == tickets.count + 1 {
                    return
                }
                result.removeLast()
                visited[i] = false
            }
        }
        
    }
    // 시작지점은 ICN이라고 나와있다
    dfs("ICN")
    //print(result)
    return result
}
```
