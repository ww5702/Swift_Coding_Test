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
