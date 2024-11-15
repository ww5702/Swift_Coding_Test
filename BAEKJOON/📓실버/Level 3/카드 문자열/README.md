dfs로 하면 시간초과   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        let board = readLine()!.split(separator: " ").map{String($0)}
        
        var result = Array(repeating: "Z", count: n)
        let temp = result
        
        func dfs(_ word: [String], _ idx: Int) {
            //print(word,idx)
            
            if idx >= n {
                if word.joined(separator: "") < result.joined(separator: "") {
                    result = word
                }
                return
            }
            
            dfs(word+[board[idx]], idx+1)
            dfs([board[idx]]+word, idx+1)
        }
        
        dfs([board[0]], 1)
        print(result.joined(separator: ""))
    }
}

solution()
/*
 */
  

```
그냥 1차반복문으로 구현   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        let board = readLine()!.split(separator: " ").map{String($0)}
        var result: [String] = []
        for b in board {
            if result.isEmpty { result.append(b); continue}
            
            if result.first! >= b {
                result.insert(b, at: 0)
            } else {
                result.append(b)
            }
        }
        print(result.joined(separator: ""))
    }
}

solution()
/*
 */
  

```
