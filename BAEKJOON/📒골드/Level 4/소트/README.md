버블정렬이다.   
하지만 해당경우는 가장 큰수를 가져온다는 조건이 빼져있다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board = readLine()!.split(separator: " ").map{Int(String($0))!}
    let s = Int(readLine()!)!
    for _ in 0..<s {
        for i in 0..<n-1 {
            if board[i] < board[i+1] {
                let temp = board[i]
                board[i] = board[i+1]
                board[i+1] = temp
                break
            }
        }
        //print(board)
    }
    print(board.map{String($0)}.joined(separator: " "))
}
solution()
/*
 
 */

```
따라서 최대값을 value값으로 지정하여 하나씩 줄여가면서 해다 위치를 찾아주려고헀다   
하지만 이번에는 교환횟수가 i보다 큰 경우 바꿔주지못한다는 점을 망각했다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board = readLine()!.split(separator: " ").map{Int(String($0))!}
    var value = board.sorted(by: >)
    var idx = 0
    let s = Int(readLine()!)!
    var cnt = 0
    var isEnd = false
    
    while true {
        let maxValue = 0
        let now = value[idx]
        let tempBoard = board
        //print(now, idx)
        for i in stride(from: board.firstIndex(of: now)!, through: 1, by: -1) {
            if board[i-1] < board[i] {
                let temp = board[i-1]
                board[i-1] = board[i]
                board[i] = temp
                cnt += 1
            } else {
                break
            }
            //print(board)
            if cnt == s {
                isEnd = true
                break
            }
        }
        if isEnd { break }
        idx += 1
        // 변하지 않았을 경우 탈출
        if tempBoard == board { break }
    }
    print(board.map{String($0)}.joined(separator: " "))
}
solution()
/*
 
 */

```
따라서 이번에는 maxvalue를 min(s,n)으로 도달 할 수 있는 범위내에서 가장 큰값을 골라줬으나   
visited문제때문에 실패   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board = readLine()!.split(separator: " ").map{Int(String($0))!}
    var visited = Array(repeating: false, count: n)
    let s = Int(readLine()!)!
    var cnt = 0
    var isEnd = false
    
    while true {
        var maxValue = -1
        var idx = 0
        for i in 0..<min(s, n)+1 {
            if !visited[i] {
                maxValue = max(maxValue, board[i])
                idx = i
            }
        }
        visited[idx] = true
        print(maxValue, idx)
        
        let tempBoard = board
        for i in stride(from: idx, through: 1, by: -1) {
            
            if board[i-1] < board[i] {
                let temp = board[i-1]
                board[i-1] = board[i]
                board[i] = temp
                cnt += 1
            } else {
                break
            }
            print(board)
            if cnt == s {
                isEnd = true
                break
            }
        }
        if isEnd { break }
        idx += 1
        // 변하지 않았을 경우 탈출
        if tempBoard == board { break }
    }
    print(board.map{String($0)}.joined(separator: " "))
}
solution()
/*
 
 */

```
사실 max값을 지정하여 i+s 즉 현재값부터 도달할수있는곳이 끝까지 가능하다면 n-1까지, 가지못한다면   
i+s 즉 갈수있는곳까지 중에서 가장 큰값을 지정하여   
해당값을 i로 가져오면 되는것이다.   
물론 해당값이 움직일수없거나 갈수없는 횟수라면 넘긴다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board = readLine()!.split(separator: " ").map{Int(String($0))!}
    var s = Int(readLine()!)!
    
    for i in 0..<n {
        let maxValue = board[i...((i+s) >= n ? n-1 : (i+s))].max()!
        let idx = board.firstIndex(of: maxValue)!
        
        if i == idx || idx-i > s || s == 0 { continue }
        else {
            s -= (idx-i)
            board.remove(at: idx)
            board.insert(maxValue, at: i)
        }
    }
    
    
    print(board.map{String($0)}.joined(separator: " "))
}
solution()
/*
 
 */

```
