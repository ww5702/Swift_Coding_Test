dfs로 풀이했으나 시간초과   

```
import Foundation
func solution(){
    let s = readLine()!
    let t = readLine()!.map{String($0)}
    var isPossible = false
    
    func dfs(_ word: [String]) {
        //print(word)
        if isPossible { return }
        
        if word.count == t.count {
            for i in 0..<t.count {
                if t[i] != word[i] {
                    return
                }
            }
            isPossible = true
            return
        }
        
        if word.count > t.count { return }
        
        
        dfs(word + ["A"])
        dfs(word.reversed() + ["B"])
    }
    dfs([s])
    
    print(isPossible ? "1" : "0")
}

solution()
/*
 
 */

```
거꾸로 문제풀이하는게 훨씬 쉬웠다   
A를 추가하는 경우, B를 추가하는 경우밖에 없다   
따라서 맨뒤가 B라면 지우고 뒤집기,   
A가 맨뒤라면 그냥 지우기   
를 반복하여 s의 크기와 동일할때까지 반복해준다.   

```
import Foundation
func solution(){
    let s = readLine()!
    var t = readLine()!.map{String($0)}
    
    while s.count != t.count {
        if t[t.count-1] == "A" {
            t.removeLast()
        } else if t[t.count-1] == "B" {
            t.removeLast()
            t.reverse()
        }
    }
    print(s == t.joined(separator: "") ? "1" : "0")
    //print(s,t)
}

solution()
/*
 
 */
```
