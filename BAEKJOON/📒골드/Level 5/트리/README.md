어떻게 보면 union-find문제이다.   
먼저 childNode graph를 만들어 연결되어있는 노드들을 이어준다.   
그리고 target이 해당하는 childNode에 들어가 다 끊어준다.   
그리고 루트노드에서부터 시작하여 childNode가 0이 되면 +1   
연결된 node들을 순환해준다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let parentNode = readLine()!.split(separator: " ").map { Int($0)! }
    var childNode: [[Int]] = Array(repeating: [], count: n)
    let target = Int(readLine()!)!
    var start = 0
    var result = 0
    
    func dfs(_ node: Int) {
        if childNode[node].count == 0 {
            result += 1
            return
        }
        
        for next in childNode[node] {
            dfs(next)
        }
    }
    
    for i in 0..<n {
        if parentNode[i] == -1 {
            start = i
            continue
        }
        
        childNode[parentNode[i]].append(i)
    }
    //print(childNode)
    
    if parentNode[target] == -1 {
        print(0)
    } else {
        childNode[parentNode[target]].removeAll{$0 == target}
        dfs(start)
        print(result)
    }
    
    //print(childNode)
    
}
solution()


```
