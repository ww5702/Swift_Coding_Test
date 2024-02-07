# 조금 더 어려운 기하 문제를 풀어 봅시다.	
## 2166 다각형의 면적 
[신발끈 공식](https://ko.wikipedia.org/wiki/%EC%8B%A0%EB%B0%9C%EB%81%88_%EA%B3%B5%EC%8B%9D) 을 이용하면 쉽게 풀이할 수 있는 문제이다.   
물론 신발끈 공식이 있는줄도 모르고 있었다.   
만약 신발끈 공식으로 풀이하지 않는다면 한 점을 임의로 잡고   
해당 점에서부터 모든 정점을 향해 직선을 그어주고   
팔각형이라면 삼각형 6개로,   
육각형이라면 삼각형 4개로 나누어 풀이하는 방식을 사용할 것 같다.   
``` 
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board: [(Int,Int)] = []
    for _ in 0..<n {
        let xy = readLine()!.split(separator: " ").map{Int($0)!}
        let (x,y) = (xy[0],xy[1])
        board.append((y,x))
    }
    //print(board)
    var xy = 0
    var yx = 0
    for i in 0..<n-1 {
        xy += board[i].0 * board[i+1].1
        yx += board[i].1 * board[i+1].0
    }
    xy += board[n-1].0 * board[0].1
    yx += board[n-1].1 * board[0].0
    let result = Double(abs(xy-yx))/2
    print(String(format: "%.1f", result))
    
}
solution()

```
## 11758 CCW
문제의 이름처럼 세 점을 이용해 방향성을 구하는 알고리즘인   
CCW 알고리즘이 존재한다.   
외적을 이용해 구할 수 있으며, 외적의 결과가 음수면 시계방향,   
직선은 0,   
반 시계의 방향일 경우 양수가 나온다.   
(x1*y2 + x2*y3 + x3*y1) - (y1*x2 + y2*x3 + y3*x1)    
을 구하는 문제이다.   
```
import Foundation
func solution(){
    var board: [(Int,Int)] = []
    for _ in 0..<3 {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        board.append((input[0],input[1]))
    }
    
    let x = (board[0].0 * board[1].1 + board[1].0 * board[2].1 + board[2].0 * board[0].1)
    let y = (board[0].1 * board[1].0 + board[1].1 * board[2].0 + board[2].1 * board[0].0)
    print(x - y == 0 ? 0 : x-y > 0 ? 1 : -1)
}
solution()

```
