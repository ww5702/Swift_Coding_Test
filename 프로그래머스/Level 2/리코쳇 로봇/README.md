```
import Foundation

func solution(_ board:[String]) -> Int {
    let newBoard = board.map { $0.map { String($0)}}
    let n = newBoard.count
    let m = newBoard[0].count
    
    var robot : (Int, Int) = (0, 0)
    var lastmove = -1
    var queue = [((Int,Int), Int)]()

    var visits = [[Bool]](repeating: [Bool](repeating: false, count: newBoard[0].count), count: newBoard.count)

    var direction = [[-1, 0], [1, 0], [0, -1], [0, 1]]

    func search(robot:(Int,Int), move: Int) {
        // 목표에 도착한다면 return
        if newBoard[robot.0][robot.1] == "G" {
            lastmove = move
            return
        }
        for i in direction {
            var newRobot = robot
            // 맵 끝에 도착하거나 장애물을 만날떄까지 반복
            while true {
                // 동서남북으로 이동
                let (x,y) = (newRobot.0 + i[0], newRobot.1 + i[1])
                // 맵을 벗어났거나 장애물을 만남
                if x < 0 || x >= n || y < 0 || y >= m {
                    break
                } else if newBoard[x][y] == "D" {
                    break
                }
                newRobot = (x,y)
            }
            print(newRobot)
            // 최종적으로 서있는 곳에 방문 표시 및 위치 저장
            if !visits[newRobot.0][newRobot.1] {
                visits[newRobot.0][newRobot.1] = true
                queue.insert((newRobot, move+1), at: 0)
            }
        }
        // 즉 동,서,남,북 으로 한번씩 움직인 값들중
        // 방문하지 않았던 곳으로 갔다면 insert 되어있다.
        print(queue)
        
        // 이동된 위치에서 하나씩 다시 동서남북 이동
        if let q = queue.last {
            queue.removeLast()
            search(robot: q.0, move: q.1)
        }
    }
    
    // 현재 내 위치 지정
    for i in 0..<board.count {
        for (j,a) in board[i].enumerated() {
            if a == "R" {
                robot = (i,j)
                break
            }
        }
    }
    
    visits[robot.0][robot.1] = true
    // 현재 위치에서 시작
    search(robot: (robot.0, robot.1), move: 0)
    return lastmove
}
```
bfs방법으로 풀었다.   
