일단 문제가 쓰레기다   
해석하기 나름인 문제는 안푸는게 정답이다.   
일단 1번 이동일때 로봇이 이동하지만 내구도는 닳지 않는다.   
2번 이동할때는 내구도가 무조건 닳는다.   
3번 0,0의 내구도가 1이상이면 무조건 넣는다 로봇이 있건 없건 중요하지않다.   
내구도가 0인게 k개 이상일때 break한다.   
시작하자마자 끝나면 정답은 1이다   

```
import Foundation
func solution(){
    let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,k) = (nk[0],nk[1])
    var board = Array(repeating: Array(repeating: 0, count: n), count: 2)
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var isRobot = Array(repeating: Array(repeating: false, count: n), count: 2)
    for i in 0..<n {
        board[0][i] = input[i]
    }
    for i in 0..<n {
        board[1][i] = input[2*n-i-1]
    }
    for i in 0..<2 {
        print(board[i])
    }
    
    var robot: [(Int,Int)] = []
    var time = 0
    
    func containerMove() {
        let temp = board[0][n-1]
        for i in (1..<n).reversed() {
            board[0][i] = board[0][i-1]
        }
        let temp2 = board[1][0]
        
        for i in 0..<n-1 {
            board[1][i] = board[1][i+1]
        }
        board[1][n-1] = temp
        board[0][0] = temp2
        
        for i in 0..<2 {
            print(board[i])
        }
    }
    
    func robotMove() {
        var tempArr: [(Int,Int)] = []
        for i in 0..<robot.count {
            let now = robot[i]
            isRobot[now.0][now.1] = false
            if now.0 == 0 {
                var newX = now.1+1
                var newY = 0
                if newX == n {
                    newY = 1
                    newX = n-1
                }
                
                // 내리는 위치라면 내린다.
                if newX != n-1 {
                    tempArr.append((newY,newX))
                }
                
            } else if now.0 == 1 {
                var newX = now.1-1
                var newY = 1
                if newX == -1 {
                    newY = 0
                    newX = 0
                }
                tempArr.append((newY,newX))
            }
        }
        robot = tempArr
        
        for i in 0..<robot.count {
            let now = robot[i]
            isRobot[now.0][now.1] = true
        }
        print(robot)
        print(isRobot)
    }
    
    func mainMove() {
        var tempArr: [(Int,Int)] = []
        for i in 0..<robot.count {
            let now = robot[i]
            if now.0 == 0 {
                var newX = now.1+1
                var newY = 0
                if newX == n {
                    newY = 1
                    newX = n-1
                }
                
                if !isRobot[newY][newX] && board[newY][newX] >= 1 {
                    isRobot[now.0][now.1] = false
                    isRobot[newY][newX] = true
                    // 내리는 위치라면 내린다.
                    if newY != 0 && newX != n-1 {
                        tempArr.append((newY,newX))
                    }
                    
                    board[newY][newX] -= 1
                }
                
            } else if now.0 == 1 {
                var newX = now.1-1
                var newY = 1
                if newX == -1 {
                    newY = 0
                    newX = 0
                }
                
                if !isRobot[newY][newX] && board[newY][newX] >= 1 {
                    isRobot[now.0][now.1] = false
                    isRobot[newY][newX] = true
                    tempArr.append((newY,newX))
                    board[newY][newX] -= 1
                }
            }
        }
        robot = tempArr
        print("main",robot)
        print(isRobot)
    }
    
    func isEnd() -> Bool {
        var cnt = 0
        for i in 0..<2 {
            for j in 0..<n {
                if board[i][j] <= 0 { cnt += 1}
            }
        }
        
        return cnt >= k ? true : false
    }
    
    func addRobot() {
        if board[0][0] >= 0 {
            robot.append((0,0))
            isRobot[0][0] = true
        }
        board[0][0] -= 1
    }
    
    
    while true {
        // 벨트 회전 && 로봇과 함께
        time += 1
        containerMove()
        robotMove()
        if isEnd() {
            print(time)
            break
        }
        
        // 2단계
        time += 1
        mainMove()
        for i in 0..<2 {
            print(board[i])
        }
        
        if isEnd() {
            print(time)
            break
        }
        
        // 3단계
        time += 1
        addRobot()
        if isEnd() {
            print(time)
            break
        }
        
        time += 1
    }
}

solution()
/*
 
 */

```
(추가)   
몇번째 단계에 끝나냐는 몇번째 순환중이냐고 물어보는것이다ㅎ   

```
import Foundation

struct Belt {
    var robot: Bool // 로봇이 있는지
    var duration: Int // 내구도
}

func solution(){
    let input = readLine()!.components(separatedBy:" ").map{Int($0)!}
    let N = input[0], K = input[1] // 벨트 칸 수, 내구도 0의 수용치
    let arr = readLine()!.components(separatedBy: " ").map{Int($0)!}
    var belts = [Belt]()
    for (i, x) in arr.enumerated() {
        belts.append(Belt(robot: false, duration: x))
    }
    var result = 0

    while true {
        result += 1
        // 1
        belts.insert(belts.removeLast(), at: 0) // 맨 마지막 벨트를 앞으로
        if belts[N-1].robot == true { belts[N-1].robot = false }
        // 2
        for i in stride(from: N-2, to: -1, by: -1) { // 로봇의 이동
            if belts[i].robot == true, belts[i+1].robot == false, belts[i+1].duration > 0 {
                belts[i].robot = false
                belts[i+1].robot = true
                belts[i+1].duration -= 1
                if i+1 == N-1 { belts[i+1].robot = false } // N인덱스에 로봇이 위치하면 바로 내려준다.
            }
        }
        // 3
        if belts[0].robot == false && belts[0].duration > 0 {
            belts[0].duration -= 1
            belts[0].robot = true
        }
        // 4
        let zeroCount = belts.filter{$0.duration == 0}.count
        if zeroCount >= K {
            break
        }
    }
    print(result)
}

solution()
/*
 
 */

```
