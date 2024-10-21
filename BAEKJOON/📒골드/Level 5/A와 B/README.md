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
