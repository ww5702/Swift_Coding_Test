위에서 뽑기 때문에 이중반복문을 사용해 인형을 뽑고   
0이 아닌 배열을 filter한뒤   
두 수가 같다면 두 수를 전부 제거 , +1해준다.   
```
import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var now: Int = 0
    var result: [Int] = []
    for m in moves {
        // 위에서부터 0이 아닌 인형이 나올때가지
        for i in 0..<board[0].count {
            if board[i][m-1] != 0 {
                now = board[i][m-1]
                board[i][m-1] = 0
                break
            }
        }
        // 4 3 1 1 3 
        result.append(now)
        now = 0
    }
    result = result.filter{$0 != 0}
    //print(result)
    
    var index = 1
    var cnt = 0
    while index != result.count-1 {
        if result[index] == result[index-1] {
            cnt += 1
            result.remove(at: index-1)
            result.remove(at: index-1)
            index -= 1
        } else {
            index += 1
        }
    }
    
    return cnt*2
}
```
테스트케이스 1,2번이 말썽이었다.   
[[0, 0, 0, 0], [0, 0, 0, 0], [0, 4, 4, 0], [1, 2, 2, 1]] / [2, 3, 1, 4, 2, 3]   
해당 테스트케이스를 통과시킬 수 있다면 1,2번 또한 통과시킬 수 있었다.   
```
import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var now: Int = 0
    var result: [Int] = []
    for m in moves {
        // 위에서부터 0이 아닌 인형이 나올때가지
        for i in 0..<board[0].count {
            if board[i][m-1] != 0 {
                now = board[i][m-1]
                board[i][m-1] = 0
                break
            }
        }
        // 4 3 1 1 3 
        if now != 0 { 
            result.append(now)
            now = 0
        }
    }
    result = result.filter{$0 != 0}
    //print(result)
    
    var index = 1
    var cnt = 0
    
    while true {
        if index == result.count { break }
        if result.isEmpty { break }
        
        if result[index] == result[index-1] {
            cnt += 1
            result.remove(at: index-1)
            result.remove(at: index-1)
            if index != 1 { index -= 1 }
        } else {
            index += 1
        }
    }
    
    return cnt*2
}
```
