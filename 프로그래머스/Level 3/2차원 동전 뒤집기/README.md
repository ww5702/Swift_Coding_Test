dfs로 생각하여 한번씩 번갈아가면서 숫자를 뒤집어 준다고 생각하고   
풀이해보았지만 시간초과   

```
import Foundation

func solution(_ beginning:[[Int]], _ target:[[Int]]) -> Int {
    var board = beginning
    for i in 0..<beginning.count {
        print(beginning[i])
    }
    print()
    for i in 0..<beginning.count {
        print(target[i])
    }
    
    var result = Int.max
    var visited: [Bool] = Array(repeating: false, count: target.count*2)
    
    
    func dfs(_ board: [[Int]], _ cnt: Int) { 
        if cnt > board.count*2 { return }
        
        if (isOk(board, target)) {
            result = min(result, cnt)
            return
        }
        
        for i in 0..<beginning.count*2 {
            if (!visited[i]) {
                var newboard = change(board, i)
                visited[i] = true
                dfs(newboard, cnt+1)
                visited[i] = false
            }
        }
    }
    
    func change(_ board: [[Int]], _ num: Int) -> [[Int]]{
        var board = board
        // 열
        if num >= target.count {
            for i in 0..<target.count {
                if board[i][num-target.count] == 1 {
                    board[i][num-target.count] == 0
                } else {
                    board[i][num-target.count] == 1
                }
            }
        } else {
        // 행 
            for i in 0..<target.count {
                if board[num][i] == 1 {
                    board[num][i] == 0
                } else {
                    board[num][i] == 1
                }
            }
        }
        return board
    }
    
    func isOk(_ board: [[Int]], _ target: [[Int]]) -> Bool {
        
        for i in 0..<board.count {
            for j in 0..<board.count {
                if target[i][j] != board[i][j] {
                    return false
                }
            }
        }
        
        return true
    }
    
    dfs(board, 0)
    
    return result
}
```

```
import Foundation

func solution(_ beginning:[[Int]], _ target:[[Int]]) -> Int {
    let n = beginning.count
    let m = beginning[0].count
    
    let targetBool = target.map{$0.map{$0 == 1 ? true : false}}
    print(targetBool)
    
    var beginCnt = 0
    var reverseCnt = 0
    var begin = beginning.map{ $0.map { $0 == 1 ? true : false } }
    var reverse = beginning.map{ $0.map { $0 == 1 ? true : false } }
    
    // for i in 0..<n {
    //     print(begin[i])
    // }
    // print()
    // for i in 0..<n {
    //     print(reverse[i])
    // }
    
    func calculate(_ cnt: Int, _ now: [[Bool]]) -> Int {
        var ans = 0
        for i in 0..<n {
            if targetBool[i] == now[i] { continue }
            if now[i].map{$0 ? false : true} == targetBool[i] {
                ans += 1
                continue
            }
            return -1
        }
        return ans + cnt
    }
    
    // 타겟과 다른 열을 beginCnt +1 그리고 다른열의 흰돌과 검은돌을 바꾸기
    // 타겟과 같은 열을 reverseCnt +1 같은열의 흰돌과 검은돌 바꾸기
    for j in 0..<m {
        if targetBool[0][j] != begin[0][j] {
            for i in 0..<m {
                begin[i][j] = begin[i][j] ? false : true
            }
            beginCnt += 1
        }

        if targetBool[0][j] == reverse[0][j] {
            for i in 0..<m {
                reverse[i][j] = reverse[i][j] ? false : true
            }
            reverseCnt += 1
        }
    }
    // print()
    // for i in 0..<n {
    //     print(begin[i])
    // }
    // print()
    // for i in 0..<n {
    //     print(reverse[i])
    // }
    
    //print(beginCnt, reverseCnt)
    let b = calculate(beginCnt, begin)
    let r = calculate(reverseCnt, reverse)
    
    
    return b == -1 || r == -1 ? b > r ? b : r : b < r ? b : r
}
```
