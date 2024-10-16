dfs로 풀이해봤으나 실패   
dp?로 풀이해보자   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board: [(Int,Int)] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append((input[0],input[1]))
    }
    
    
    var result = -1
    func dfs(_ idx: Int, _ sum: Int) {
        
        if idx > n { return }
        //print(idx, sum)
        result = max(result, sum)
        
        var day = 0
        for i in idx..<n {
            dfs(idx+day+board[i].0, sum+board[i].1)
            day += 1
        }
        
        return
    }
    
    
    for i in 0..<n {
        //print("시작",i, board[i].1)
        dfs(i+board[i].0, board[i].1)
    }
    
    print(result)
    
}

solution()
/*
 
 */


```
