문제를 이해하는데 더 어려웠던 문제이다.   
쉽게 생각하면 k개로 범위를 나눈다는 의미이다.   
예제 1 6 9 3 6 7   
을 예시로 보자   
위 좌표를 정렬한다면   
1 3 6 7 9 가 된다. (중복은 같은장소를 의미하니 상관없다)   
해당 좌표들 사이의 거리는 2 3 1 2가 된다.   
만약 3<->6의 통신을 끊는다면   
(1,3) / (6,7,9)가 되고, 수신영역은 2+1+2 = 5가 된다.   
만약 6<->7을 끊는다고 가정하면   
(1,3,6) / (7,9)가 되고, 2+3+1 = 6으로 5보다 작다.   
즉, k-1개 만큼 거리가 많이 차이나는 신호를 끊는것이다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let k = Int(readLine()!)!
    var board = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.sort(by:<)
    //print(board)
    var dis: [Int] = []
    for i in 0..<n-1 {
        dis.append((board[i+1]-board[i]))
    }
    //print(dis)
    dis.sort(by: <)
    
    if k >= n {
        print(0)
    } else {
        for _ in 0..<k-1 {
            dis.removeLast()
        }
        print(dis.reduce(0, +))
    }
}
solution()
/*
 
 
 */

```
