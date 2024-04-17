예제 7이 내 예상대로라면 1이 출력되야하는데 -1이 답이라 풀리지않았다.   
```
import Foundation
func solution(){
    var input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var map = Array(repeating: Array(repeating: "", count: m), count: n)
    var dis = Array(repeating: Array(repeating: 101, count: m), count: n)
    var red = (0,0)
    var blue = (0,0)
    var goal = (0,0)
    for i in 0..<n {
        let input = Array(readLine()!).map{String($0)}
        for j in 0..<m {
            map[i][j] = input[j]
            if input[j] == "R" {
                red = (i,j)
            } else if input[j] == "B" {
                blue = (i,j)
            } else if input[j] == "O" {
                goal = (i,j)
            }
        }
    }
    dis[red.0][red.1] = 0
    
    print(map)
    print(goal)
    
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    func bfs() {
        var redQ: [(Int,Int)] = []
        var blueQ: [(Int,Int)] = []
        var idx = 0
        redQ.append((red.0, red.1))
        blueQ.append((blue.0, blue.1))
        
        while (redQ.count > idx && blueQ.count > idx) {
            var nowRed = redQ[idx]
            var nowBlue = blueQ[idx]
            print(nowRed, nowBlue)
            if (goal.0 == nowRed.0 && goal.1 == nowRed.1) {
                print("만남")
                print(dis[goal.0][goal.1])
                break
            }
            if (idx > 10) {
                print(-1)
                break
            }
            idx += 1
            for i in 0..<4 {
                let nR = move(nowRed.0, nowRed.1, i, "R")
                map[nR.0][nR.1] = "R"
                if (nR.0 != nowRed.0 || nR.1 != nowRed.1) {
                    map[nowRed.0][nowRed.1] = "."
                }
                
                let nB = move(nowBlue.0, nowBlue.1, i, "B")
                map[nB.0][nB.1] = "B"
                if (nB.0 != nowBlue.0 || nB.1 != nowBlue.1) {
                    map[nowBlue.0][nowBlue.1] = "."
                }
                print("이동",nR, nB)
                for i in 0..<n {
                    print(map[i])
                }
                let newRedY = nR.0
                let newRedX = nR.1
                let newBlueY = nB.0
                let newBlueX = nB.1
                
                // 파란색이 구멍에 빠지지 않았다면
                if (newBlueY != goal.0 || newBlueX != goal.1) {
                    // 둘이 같은 칸이 아니라면
                    if (newRedY != newBlueY || newRedX != newBlueX) {
                        if dis[newRedY][newRedX] > dis[nowRed.0][nowRed.1] + 1 {
                            dis[newRedY][newRedX] = dis[nowRed.0][nowRed.1] + 1
                            redQ.append((newRedY, newRedX))
                            blueQ.append((newBlueY, newBlueX))
                        }
                    }
                }
                
                
            }
            
        }
        
    }
    
    func move(_ y: Int, _ x: Int, _ dir: Int, _ Color: String) -> (Int,Int) {
        var y = y
        var x = x
        var check = ""
        if Color == "R" {
            check = "B"
        } else {
            check = "R"
        }
        print(Color, check)
        while true {
            let newY = y + dy[dir]
            let newX = x + dx[dir]
            print(newY,newX)
            if map[newY][newX] == "O" {
                return (newY, newX)
            }
            if map[newY][newX] == check {
                print("구슬 만나서 못움직임")
                return (newY-dy[dir], newX-dx[dir])
                
            }
            if map[newY][newX] == "#" || map[newY][newX] == check {
                print("벽만남")
                return (newY-dy[dir], newX-dx[dir])
            }
            y = newY
            x = newX
        }
    }
    bfs()
    for i in 0..<n {
        print(dis[i])
    }
}
solution()


```
