당연히 dfs는 시간초과   
누적합인거같은데 어떻게 해야할지 고민좀 해봐야겠다.   

```
import Foundation

func solution(){
    let n = Int(readLine()!)!
    var board = readLine()!.split(separator: " ").map{Int(String($0))!}
    var isPossible = Array(repeating: false, count: 1_000_000_001)
    var visited = Array(repeating: false, count: n)
    
    func isEnd() -> Bool {
        for i in 0..<n {
            if !visited[i] { return false }
        }
        return true
    }
    
    func dfs(_ sum: Int) {
        isPossible[sum] = true
        //print(sum)
        
        if isEnd() { return }
        
        for i in 0..<n {
            if !visited[i] {
                visited[i] = true
                dfs(sum+board[i])
                visited[i] = false
            }
        }
    }
    
    for i in 0..<n {
        visited[i] = true
        dfs(board[i])
        visited[i] = false
    }
    
    for i in 1...1000000000 {
        if !isPossible[i] { print(i); break }
    }
}
solution()
/*
 
 */

```
모를땐 예시를 들어보는게 제일 빠른거같다.   
1 2 3 4 일때   
누적합은 10, 그리고 1부터 9까지는 조합에 따라 다 만들수 있디.   
   
1 2 3 4 6 일때    
= 4까지의 합 10   
10부터 16까지 사이값을 구해본다.   
11에서 6을 뺀 5 가능하다   
12에서 6을 뺀 6 가능하다   
13 - 6 = 7   
14 - 6 = 8   
15 - 6 = 9   
다 된다.   
왜냐 애초에 10까지 다 만들수있었기에 사이가 10이라면 이미 만들수있다는것   
   
1 2 3 4 11 이라고 해도   
누적합으로 10까지 그리고 11로 11   
12는 다시 11에서 다시 누적합 10까지 다 가능하므로   
21까지 가능 22가 정답이다.   
    
그렇다면   
1 2 3 4 12라면   
10에서 12는 절대 못만들기때문에   
+1이 넘어간다면 실패   
아니라면 무작정 더하기 이게 답이다.   

```
import Foundation

func solution(){
    let n = Int(readLine()!)!
    var board = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.sort()
    
    var sum = 0
    for b in board {
        // 1 1 2 2 7 9 이라할때 7전까지 합은 6 그다음 숫자 7 따라서 만약 8이라면 어떻게해도 불가능
        if b > sum+1 {
            break
        }
        sum += b
    }
    print(sum+1)
}
solution()
/*

 
 
 */

```
