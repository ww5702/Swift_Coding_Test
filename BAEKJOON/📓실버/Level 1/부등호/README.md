```
import Foundation
func solution() {
    let k = Int(readLine()!)!
    var board = readLine()!.split(separator: " ").map{String($0)}
    //print(board)
    var visited = Array(repeating: false, count: 10)
    var tempMax = ""
    var tempMin = ""
    for i in 0...k {
        tempMin += String(9-i)
        tempMax += String(i)
    }
    for i in 0...9 {
        visited[i] = true
        combi(0, i, String(i))
        visited[i] = false
    }
    
    func combi(_ idx: Int, _ last: Int, _ word: String) {
        if idx == k {
            //print(word)
            tempMax = Int(tempMax)! < Int(word)! ? word : tempMax
            tempMin = Int(tempMin)! > Int(word)! ? word : tempMin
            return
        }
        
        if board[idx] == ">" {
            for i in stride(from: last-1, through: 0, by: -1) {
                if !visited[i] {
                    visited[i] = true
                    combi(idx+1, i, word+String(i))
                    visited[i] = false
                }
            }
        } else {
            if last != 9 {
                for i in last+1...9 {
                    if !visited[i] {
                        visited[i] = true
                        combi(idx+1, i, word+String(i))
                        visited[i] = false
                    }
                }
            }
            
        }
    }
    
    print(tempMax)
    print(tempMin)
}


solution()
/*
 */

```
