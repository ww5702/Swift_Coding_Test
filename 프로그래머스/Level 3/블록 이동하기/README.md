구현 + bfs 문제이다.   
보통 길찾기 문제와 다르게 몸통이 있다.   
따라서 회전할때 왼쪽날개를 기준으로, 오른쪽 날개를 기준으로 회전해주는 경우의 수를 전부 생각해줘야 한다.   
구현도 엄청 오래 걸렸지만   
문제는 core dump 즉 어딘가 index를 넘어섰을때가 문제였다.   
어디가 틀렸는지 찾기가 너무 어려운 문제였다.   

```
import Foundation
/*
2x1 크기의 로봇
n,n까지 가야한다.
2칸의 몸통중 한칸이라도 nxn에 도착하면 끝
회전을 할때 벽에 닿는다면 회전 불가
1칸 이동하거나 회전하는데 걸리는 시간은 1초

큐 생성
현재 좌표 넣기
큐에 남은 요소가 없을 떄까지 반복문을 돌면서 첫번째 요소 dequeue
윗줄에서 얻은 요소에서 이동할 수 있는 좌표들을 enqueue
(n,n) 만나면 break

일방적인 길찾기 문제와는 달리
로봇은 2칸으로 구성되어있다
이동하는 방향은
1. 위로
2. 아래로
3. 왼쪽
4. 오른쪽
5. 회전
5-1 로봇이 가로모양일때
5-1-1 왼쪽 날개를 회전축으로 (시계/반시계)
5-1-2 오른쪽 날개를 회전축으로 (시계/반시계)
5-2 로봇이 세로모양일때
5-2-1 왼쪽 날개를 회전축으로 (시계/반시계)
5-2-2 오른쪽 날개를 회전축으로 (시계/반시계)
이 12가지를 전부 구현해야한다.

*/
// 로봇의 생김새를 표현한 구조체
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
    var isHorizon: Bool {
        return wing1.0 == wing2.0
    }
    var toString: String {
        return "\(leftPosition.0),\(leftPosition.1),\(rightPosition.0),\(rightPosition.1)"
    }
    
}
// 현재 위치에서 움질일 수 있는 포지션 전체를 반환해주는 함수
func findMovablePosition(board: [[Int]], cur: Robot) -> [Robot] {
    func canMove(_ now: (Int,Int)) -> Bool {
        return board[now.0][now.1] == 0 ? true : false
    }
    //print("현재 위치",cur)
    var movablePosition = [Robot]()
    let n = board.count
    
    let curLeft = cur.leftPosition
    let curRight = cur.rightPosition
    let curTop = cur.topPosition
    let curBottom = cur.bottomPosition
    
    // Left
    // 지도를 넘어가지않으면서 
    // 왼쪽과 오른쪽에 위치한 날개가 왼쪽으로 갈수있는가
    if curLeft.1 >= 1 && canMove((curLeft.0, curLeft.1-1)) && canMove((curRight.0, curRight.1-1)) {
        movablePosition.append(Robot(wing1: (curLeft.0,curLeft.1-1), wing2:(curRight.0, curRight.1-1)))
    }
    
    // Right
    if curRight.1 < n-1 && canMove((curLeft.0, curLeft.1+1)) && canMove((curRight.0, curRight.1+1)) {
        movablePosition.append(Robot(wing1: (curLeft.0,curLeft.1+1), wing2:(curRight.0, curRight.1+1)))
    }
    
    // Up
    if curTop.0 >= 1 && canMove((curTop.0-1, curTop.1)) && canMove((curBottom.0-1, curBottom.1)) {
        movablePosition.append(Robot(wing1: (curTop.0-1,curTop.1), wing2:(curBottom.0-1, curBottom.1)))
    }
    
    // Down
    if curBottom.0 < n-1 && canMove((curTop.0+1, curTop.1)) && canMove((curBottom.0+1, curBottom.1)) {
        movablePosition.append(Robot(wing1: (curTop.0+1,curTop.1), wing2:(curBottom.0+1, curBottom.1)))
    }
    
    // Rotate
    // 로봇이 가로방향인지 세로방향인지
    if cur.isHorizon {
        // 왼쪽 날개를 기준으로
        // 시계 방향
        // (0,1)의 날개라면 회전시 (1,0)이 된다
        if curLeft.0 < n-1 && canMove((curRight.0+1, curRight.1)) && canMove((curLeft.0+1, curLeft.1)) {
            movablePosition.append(Robot(wing1: curLeft, wing2 : (curLeft.0+1, curLeft.1)))
        }
        
        // 반시계 방향
        // (1,1)의 날개라면 회전시 (0,0)이 된다
        if curLeft.0 >= 1 && canMove((curRight.0-1, curRight.1)) && canMove((curLeft.0-1, curLeft.1)) {
            movablePosition.append(Robot(wing1:curLeft, wing2: (curLeft.0-1, curLeft.1)))
        }
        
        // 오른쪽날개를 기준으로
        // 시계 방향
        // (1,0)의 날개는 (0,1)이 된다.
        if curRight.0 >= 1 && canMove((curLeft.0-1, curLeft.1)) && canMove((curRight.0-1, curRight.1)) {
            movablePosition.append(Robot(wing1: (curRight.0-1, curRight.1), wing2:curRight))
        }
        
        // 반시계 방향
        // (0,0)의 날개는 (1,1)이 된다.
        if curRight.0 < n-1 && canMove((curLeft.0+1, curLeft.1)) && canMove((curRight.0+1, curRight.1)) {
            movablePosition.append(Robot(wing1: (curRight.0+1, curRight.1), wing2:curRight))
        }
        
    }else {
    // 세로방향    
        // 위쪽 날개를 회전축으로
        // 시계방향
        // (1,1)은 (0,0)이 된다.
        if curTop.1 >= 1 && canMove((curTop.0, curTop.1-1)) && canMove((curBottom.0, curBottom.1-1)) {
            //movablePosition.append(Robot(wing1: (curTop.0,curTop.1-1), wing2 : curTop))
            movablePosition.append(Robot(wing1: curTop, wing2: (curTop.0, curTop.1-1)))
        
        }
        
        // 반시계 방향
        // (1,1)은 (0,2)가 된다
        if curTop.1 < n-1 && canMove((curTop.0, curTop.1+1)) && canMove((curBottom.0, curBottom.1+1)) {
            movablePosition.append(Robot(wing1: curTop, wing2 : (curTop.0, curTop.1+1)))
        }
        
        // 밑쪽 날개를 회전축으로
        // 시계 방향
        // (1,1)은 (1,2)가 된다
        if curBottom.1 < n-1 && canMove((curTop.0, curTop.1+1)) && canMove((curBottom.0, curBottom.1+1)) {
            //movablePosition.append(Robot(wing1: curBottom, wing2 : (curBottom.0,curBottom.1+1)))
            movablePosition.append(Robot(wing1: (curBottom.0, curBottom.1+1), wing2: curBottom))

        }
        
        // 반시계 방향
        // (1,1)은 (0,1)이 된다
        if curBottom.1 >= 1 && canMove((curTop.0, curTop.1-1)) && canMove((curBottom.0, curBottom.1-1)) {
            movablePosition.append(Robot(wing1: (curBottom.0, curBottom.1-1), wing2 : curBottom))
        
        }
    }
    
    return movablePosition
}
func solution(_ board:[[Int]]) -> Int {
    var size = board.count
    var visited = Set<String>()
    var Q = [Robot]()
    Q.append(Robot(wing1:(0,0),wing2:(0,1),cost:0))
    while !Q.isEmpty {
        let cur = Q.removeFirst()
        let movablePosition = findMovablePosition(board: board, cur: cur)
        // (n,n)에 도달하는 순간 return
        if cur.wing1 == (size-1,size-1) || cur.wing2 == (size-1,size-1) {
            return cur.cost
        }
        for position in movablePosition {
            var position = position
            // 방문한적 없던 곳이라면 현재시간의 +1
            // 해당 장소에서 다시 이동해야 하기에 q에 추가
            if !visited.contains(position.toString) {
                position.cost = cur.cost+1
                Q.append(position)
                visited.insert(position.toString)
            }
        }
        
    }
    return 0
}
```
