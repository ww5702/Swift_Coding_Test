주어진 규칙을 그대로 구현하기만 하면 되는 문제이다.   
하지만 ArraySlice와 같은 substring 부분이 미숙하여 굉장히 오래 걸린 문제이다...   
```
import Foundation
func solution(){
    func dfs(_ str: String) -> String {
        if str.count < 1 { return "" }
        
        var cnt = 0, index = str.startIndex
        //print(cnt, index)
        
        // 첫 균현잡힌 괄호 문자열 나누기
        repeat {
            cnt += String(str[index]) == "(" ? 1 : -1
            index = str.index(after: index)
        } while cnt != 0
        
        //print(cnt,index)
        var u = String(str[..<index])
        var v = String(str[index...])
        //print(u,v)
        
        // 첫 시작이 (라면 올바른 괄호 문자열이다.
        if String(u.first!) == "(" {
            return u + dfs(v)
        } else {
            u.removeLast()
            u.removeFirst()
            return "(\(dfs(v))\(u.map{String($0) == "(" ? ")" : "("}.joined())"
        }
    }
    
    print(dfs(readLine()!))
}
solution()

/*
(()())()
 */


```
