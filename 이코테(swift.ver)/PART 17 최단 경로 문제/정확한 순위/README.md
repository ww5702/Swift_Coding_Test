사람이 500명을 딱 넘지 않으므로 플로이드워셜 알고리즘을 사용할 수 있다.   
사람을 도시로 생각하고 어떠한 사람을 통해 다른 사람으로 갈 수 있다면 +1을 해준다.   
만약 board[i][j] 나 board[j][i]가 Int.max값이 없다면 갈 수 있다는 의미이고   
반복문을 통해 1번사람~n번사람까지 돌았을때 다 갈수있다면 result+=1을 해준다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var board = Array(repeating: Array(repeating: Int.max, count: n+1), count: n+1)
    for i in 0...n {
        board[i][i] = 0
    }
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        board[input[0]][input[1]] = 1
    }
    for i in 1...n {
        print(board[i])
    }
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if board[i][k] != Int.max && board[k][j] != Int.max {
                    board[i][j] = min(board[i][j], board[i][k] + board[k][j])
                }
            }
        }
    }
    print()
    var result = 0
    for i in 1...n {
        var cnt = 0
        for j in 1...n {
            if board[i][j] != Int.max || board[j][i] != Int.max { cnt += 1 }
        }
        if cnt == n { result += 1 }
    }
    print(result)
}
solution()


/*
 6 6
 1 5
 3 4
 4 2
 4 6
 5 2
 5 4
 */


```
