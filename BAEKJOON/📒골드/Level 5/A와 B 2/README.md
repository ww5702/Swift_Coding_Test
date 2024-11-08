t를 s로 바꾸는게 더 쉽다.   
왜냐하면 BA라면 A에서 B를 넣고 뒤집은것이고   
ABA라면 A를 뒤에 넣은 경우가 있기 때문에   
해당 경우에만 dfs를 계속해줄 수 있다.   

```
import Foundation
func solution(){
    var s = readLine()!.map{String($0)}
    let t = readLine()!.map{String($0)}
    var isPossible = false
    
    func isOk(_ word: String) {
        
    }
    
    func dfs(_ word: [String]) {
        if isPossible { return }
        if word.count == s.count {
            if word == s {
                print(1)
                isPossible = true
            }
            return
        }
        
        let last = word.last!
        if last == "A" {
            var temp = word
            temp.removeLast()
            dfs(temp)
        }
        
        let first = word.first!
        if first == "B" {
            var temp = Array(word.reversed())
            temp.removeLast()
            dfs(temp)
        }
        
        
    }
    dfs(t)
    if !isPossible { print(0) }
}

solution()
/*
 */
  

```
