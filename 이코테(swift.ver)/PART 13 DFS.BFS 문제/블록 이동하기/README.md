움직이는 몸통을 2개로 생각하고,   
상하좌우, 회전(가로모습일때, 세로모습일때)   
가로모습일때 -> 오른쪽 날개 기준, 왼쪽 날개 기준   
오른쪽 날개기준 -> 시계방향 회전, 반시계방향회전   
왼쪽 날개 기준 -> 시계방향 회전, 반시계방향회전   
위 과정을 세로모습일때   
이렇게 총 12가지 경우의 수를 벽에 부딪히지 않는지를 계산하며 bfs 돌리면 된다.   
구현 + bfs라고 생각한다   
다신 하고 싶지 않다.   
```
import Foundation
struct Robot {
    var wing1 = (0,0)
    var wing2 = (0,0)
    var cost = 0
    // 더 왼쪽에 위치한 날개
    var leftPosition: (Int,Int) {
        [wing1,wing2].sorted{$0.1 < $1.1}[0]
    }
    // 더 오른쪽에 위치한 날개
    var rightPosition: (Int,Int) {
        [wing1,wing2].sorted{$0.1 < $1.1}[1]
    }
    var topPosition: (Int,Int) {
        [wing1,wing2].sorted{$0.0 < $1.0}[0]
    }
    var bottomPosition: (Int,Int) {
        [wing1,wing2].sorted{$0.0 < $1.0}[1]
    }
    // y축이 같다면 가로
    var isHorizon: Bool {
        return wing1.0 == wing2.0
    }
    var toString: String {
        return "\(leftPosition.0),\(leftPosition.1),\(rightPosition.0),\(rightPosition.1)"
    }
    
}
func solution(){
    var board: [[Int]] = Array(repeating: [], count: 5)
    for i in 0..<5 {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        board[i] = input
    }
    //print(board)
    func findPosition(_ cur: Robot) -> [Robot] {
        func canMove(_ now: (Int,Int)) -> Bool {
            return board[now.0][now.1] == 0 ? true : false
        }
        var move = [Robot]()
        var n = board.count
        let curLeft = cur.leftPosition
        let curRight = cur.rightPosition
        let curTop = cur.topPosition
        let curBottom = cur.bottomPosition
        //print(curLeft,curRight,curTop,curBottom)
        
        // 위
        if curTop.0 >= 1 && canMove((curTop.0-1, curTop.1)) && canMove((curBottom.0-1, curBottom.1)){
            move.append(Robot(wing1: (curBottom.0-1, curBottom.1), wing2: (curTop.0-1, curTop.1)))
        }
        // 아래
        if curBottom.0 < n-1 && canMove((curBottom.0+1, curBottom.1)) && canMove((curTop.0+1, curTop.1)) {
            move.append(Robot(wing1: (curBottom.0+1, curBottom.1), wing2: (curTop.0+1, curTop.1)))
        }
        // 오른쪽
        if curRight.1 < n-1 && canMove((curRight.0, curRight.1+1)) && canMove((curLeft.0, curLeft.1+1)) {
            move.append(Robot(wing1: (curLeft.0, curLeft.1+1), wing2: (curRight.0, curRight.1+1)))
        }
        // 왼
        if curLeft.1 >= 1 && canMove((curLeft.0, curLeft.1-1)) && canMove((curRight.0, curRight.1-1)) {
            move.append(Robot(wing1: (curLeft.0, curLeft.1-1), wing2: (curRight.0, curRight.1-1)))
        }
        // 회전
        // 가로일떄
        if (cur.isHorizon) {
            // 오른쪽 날개를 중심
            // 시계방향
            if curRight.0 >= 1 && canMove((curLeft.0-1, curLeft.1)) && canMove((curRight.0-1, curRight.1)) {
                move.append(Robot(wing1: (curRight.0-1, curRight.1), wing2: curRight))
            }
            // 반시계방향
            if curRight.0 < n-1 && canMove((curLeft.0+1, curLeft.1)) && canMove((curRight.0+1, curRight.1)) {
                move.append(Robot(wing1: (curRight.0+1, curRight.1), wing2: curRight))
            }
            // 왼쪽 날개를 중심
            // 시계
            if curLeft.0 < n-1 && canMove((curLeft.0+1, curLeft.1)) && canMove((curRight.0+1, curRight.1)) {
                move.append(Robot(wing1: curLeft, wing2: (curLeft.0+1, curLeft.1)))
            }
            // 반시계
            if curLeft.0 >= 1 && canMove((curLeft.0-1, curLeft.1)) && canMove((curRight.0-1, curRight.1)) {
                move.append(Robot(wing1: curLeft, wing2: (curLeft.0-1, curLeft.1)))
            }
        } else {
        // 세로일때
            // 윗 날개 중심
            // 시계
            if curTop.1 >= 1 && canMove((curTop.0, curTop.1-1)) && canMove((curBottom.0, curBottom.1-1)) {
                move.append(Robot(wing1: curTop, wing2: (curTop.0, curTop.1-1)))
            }
            // 반시계
            if curTop.1 < n-1 && canMove((curTop.0, curTop.1+1)) && canMove((curBottom.0, curBottom.1+1)) {
                move.append(Robot(wing1: curTop, wing2: (curTop.0, curTop.1+1)))
            }
            // 아래 날개 중심
            // 시계
            if curBottom.1 < n-1 && canMove((curTop.0, curTop.1+1)) && canMove((curBottom.0, curBottom.1+1)) {
                move.append(Robot(wing1: (curBottom.0, curBottom.1+1), wing2: curBottom))
            }
            // 반시계
            if curBottom.1 >= 1 && canMove((curTop.0, curTop.1-1)) && canMove((curBottom.0, curBottom.1-1)) {
                move.append(Robot(wing1: (curBottom.0, curBottom.1-1), wing2: curBottom))
            }
        }
        
        return move
    }
    
    
    func bfs() -> Int {
        var n = board.count
        var visited = Set<String>()
        var muji = [Robot]()
        muji.append(Robot(wing1: (0,0), wing2: (0,1), cost: 0))
        var idx = 0
        while muji.count > idx {
            let cur = muji[idx]
            idx += 1
            let movable = findPosition(cur)
            if cur.wing1 == (n-1, n-1) || cur.wing2 == (n-1, n-1) {
                return cur.cost
            }
            for position in movable {
                var position = position
                if !visited.contains(position.toString) {
                    visited.insert(position.toString)
                    position.cost = cur.cost + 1
                    muji.append(position)
                }
                   
            }
        }
        return 0
    }
    print(bfs())
}
solution()

/*
 0 0 0 1 1
 0 0 0 1 0
 0 1 0 1 1
 1 1 0 0 1
 0 0 0 0 0
 */


```
