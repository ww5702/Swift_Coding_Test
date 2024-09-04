```
import Foundation
func solution() {
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var board = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.sort(by: <)
    
    func dfs(_ arr: [Int]) {
        if arr.count == m {
            print(arr.map{String($0)}.joined(separator: " "))
            return
        }
        
        for i in 0..<n {
            if arr.count != 0 && arr.last! > board[i] { continue }
            
            dfs(arr+[board[i]])
        }
    }
    
    dfs([])
}

solution()
/*
 */

```
