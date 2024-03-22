 모든 상어가 자신의 위치에 자신의 냄새 뿌리기   
 1초마다 동시에 상하좌우로 이동 후 냄새 뿌리기 -> k번 이동하면 사라짐   
    
 먼저 이동 방향은 아무 냄새가 없는 칸의 방향으로 잡는다   
 그런 칸이 없다면 자신의 냄새가 있는 칸으로 방향을 잡는다   
 가능한 칸이 여러개일수 있는데 이때 우선순위를 따른다   
 위의 우선순위는 자신의 냄새가 있는 칸이 여러개더라도 우선순위를 따른다.   
 같은 상어라도 현재 상어가 보고 있는 방향에 따라 또 다르다   
    
 모든 상어 이동 후 한칸에 여러 상어가 있으면    
 가장 작은 번호 상어를 제외하고 모두 쫓겨남   
   
위의 구조로 작동하는 문제이다.   
따라서 Shark 구조체에 원하는 정보들을 전부 삽입해주고   
map에는 상어가 이동하는 기본 지도가   
smellMap에는 상어가 이동하면서 남기는 냄새를 담아준다.   
1번빼고 다 죽을때까지 or 1000번 이상 넘어갈때까지 반복한다.   
   
먼저 상어가 이동한다.   
이동하면서 빈칸이 있다면 해당 빈칸으로 해당 상어의 방향의 우선순위를 따라 저장한다.   
만약 빈칸이 없다면 해당 상어의 방향을 기준으로 우선순위를 삼아 자신의 냄새를 찾아 있다면 저장한다.   
   
이제 모든 상어들이 이동한 check 배열을 순환하면서 map을 갱신해준다.   
어차피 1번부터 이동했기에 1번이 갔던 좌표를 누군가가 또 왔다면   
해당 상어는 죽게됨으로 이 부분은 신경을 쓰지 않아도 된다.   
   
이동이 끝난뒤 원래 있던 자리에 냄새를 -1 해준다.   
냄새가 0이 된다면 0으로 바꿔준다.   
그리고 이동할 장소의 냄새를 (num,k)로 바꿔준다.   
   
```
import Foundation
struct Shark {
    var y: Int
    var x: Int
    var alive: Int
    var dir: Int
    var up: [(Int,Int)]
    var down: [(Int,Int)]
    var left: [(Int,Int)]
    var right: [(Int,Int)]
    
    init(y: Int, x: Int, alive: Int, dir: Int, up: [(Int, Int)], down: [(Int, Int)], left: [(Int, Int)], right: [(Int, Int)]) {
        self.y = y
        self.x = x
        self.alive = alive
        self.dir = dir
        self.up = up
        self.down = down
        self.left = left
        self.right = right
    }
}
func solution(){
    
    let nmk = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m,smell) = (nmk[0],nmk[1],nmk[2])
    var map = Array(repeating: Array(repeating: 0, count: n), count: n)
    // 0번째 상어 냄새가 1번째 남았다는 의미
    var smellMap = Array(repeating: Array(repeating: (0,0), count: n), count: n)
    var sharkList = [Shark](repeating: Shark(y: 0, x: 0, alive: 0, dir: 0, up: [], down: [], left: [], right: []), count: m+1)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        for j in 0..<n {
            map[i][j] = input[j]
            if input[j] != 0 {
                let num = input[j]
                sharkList[num].y = i
                sharkList[num].x = j
                sharkList[num].alive = 1
            }
        }
    }
    // 초기 방향 설정 및 냄새 초기 설정
    let firstDir = readLine()!.split(separator: " ").map{Int($0)!}
    for i in 0..<m {
        sharkList[i+1].dir = firstDir[i]-1
        let y = sharkList[i+1].y
        let x = sharkList[i+1].x
        smellMap[y][x] = (i+1,smell)
    }
    let direction = [(-1,0),(1,0),(0,-1),(0,1)]
    for i in 0..<m {
        let s = i+1
        for j in 0..<4 {
            let input = readLine()!.split(separator: " ").map{Int($0)!}
            if j == 0 {
                for k in 0..<4 {
                    sharkList[s].up.append(direction[input[k]-1])
                }
            } else if j == 1 {
                for k in 0..<4 {
                    sharkList[s].down.append(direction[input[k]-1])
                }
            } else if j == 2 {
                for k in 0..<4 {
                    sharkList[s].left.append(direction[input[k]-1])
                }
            } else {
                for k in 0..<4 {
                    sharkList[s].right.append(direction[input[k]-1])
                }
            }
        }
    }
    
//    for i in 0..<n {
//        print(map[i])
//    }
//    for i in 0..<n {
//        print(smellMap[i])
//    }
//    for i in 0..<m {
//        print(sharkList[i+1])
//    }
    
    var time = 0
    var a = 0
    while true {
        // 1번빼고 다 죽었다면 break
        if (isEnd()) { break }
        if (time >= 1000) {
            time = -1
            break
        }
        
        sharkMove()
        minusSmell()
        smellShark()
//        for i in 0..<n {
//            print(map[i])
//        }
//        for i in 0..<n {
//            print(smellMap[i])
//        }
//        for i in 0..<m {
//            print(sharkList[i+1])
//        }
        time += 1
    }
    print(time)
    func isEnd() -> Bool{
        for i in 1..<m {
            if sharkList[i+1].alive == 1 {
                return false
            }
        }
        return true
    }
    
    func sharkMove() {
        var check: [(Int,(Int,Int))] = []
        // 상어 이동
        for i in 0..<m {
            let num = i+1
            if sharkList[num].alive == 0 { continue }   // 죽은 상어는 이동 불가
            var dir = sharkList[num].dir
            var y = sharkList[num].y
            var x = sharkList[num].x
            var move: [(Int,Int)] = []
            if dir == 0 {
                move = sharkList[num].up
            } else if dir == 1 {
                move = sharkList[num].down
            } else if dir == 2 {
                move = sharkList[num].left
            } else {
                move = sharkList[num].right
            }
            //print(num, y,x, move)
            // 해당 move 좌표로 이동
            for i in 0..<4 {
                let dy = y + move[i].0
                let dx = x + move[i].1
                
                // 해당 좌표가 벽을 넘지 않았고 냄새가 남지 않았다면
                if (0..<n).contains(dy) && (0..<n).contains(dx) && smellMap[dy][dx].0 == 0{
                    // 해당 좌표로 이동 하기 전에 냄새 한칸씩 줄이고 다 없어졌다면 0으로 만들기
                    //print(dy,dx)
                    
                    sharkList[num].y = dy
                    sharkList[num].x = dx
                    if move[i].0 == -1 && move[i].1 == 0 {
                        sharkList[num].dir = 0
                    } else if move[i].0 == 1 && move[i].1 == 0 {
                        sharkList[num].dir = 1
                    } else if move[i].0 == 0 && move[i].1 == -1 {
                        sharkList[num].dir = 2
                    } else {
                        sharkList[num].dir = 3
                    }
                    // 해당 좌표에 번호가 작은 상어가 남아있다면 죽음
//                    if map[dy][dx] != 0 && map[dy][dx] < num {
//                        sharkList[num].alive = 0
//                        map[y][x] = 0
//                        break
//                    }
                    check.append((num,(dy,dx)))
                    map[y][x] = 0
                    break
                }
            }
            // 이동을 못하였다면 내 냄새가 있는 곳으로 이동
            if sharkList[num].y == y && sharkList[num].x == x {
                //print("여기에요")
                for i in 0..<4 {
                    let dy = y + move[i].0
                    let dx = x + move[i].1
                    // 내 냄새가 있다면
                    if (0..<n).contains(dy) && (0..<n).contains(dx) && smellMap[dy][dx].0 == num {
                        //print("내 냄새가 있따",dy,dx)
                        sharkList[num].y = dy
                        sharkList[num].x = dx
                        if move[i].0 == -1 && move[i].1 == 0 {
                            sharkList[num].dir = 0
                        } else if move[i].0 == 1 && move[i].1 == 0 {
                            sharkList[num].dir = 1
                        } else if move[i].0 == 0 && move[i].1 == -1 {
                            sharkList[num].dir = 2
                        } else {
                            sharkList[num].dir = 3
                        }
                        // 해당 좌표에 번호가 작은 상어가 남아있다면 죽음
//                        if map[dy][dx] != 0 && map[dy][dx] < num {
//                            sharkList[num].alive = 0
//                            map[y][x] = 0
//                            break
//                        }
                        check.append((num,(dy,dx)))
                        map[y][x] = 0
                        break
                    }
                }
            }
        }
        //print(check)
//         해당 좌표에 번호가 작은 상어가 남아있다면 죽음
        for i in 0..<check.count {
            let n = check[i]
            let cury = n.1.0
            let curx = n.1.1
            if map[cury][curx] == 0 {
                map[cury][curx] = n.0
            } else if map[cury][curx] != 0 && map[cury][curx] < n.0 {
                sharkList[n.0].alive = 0
            }
        }
    }
    
    func minusSmell() {
        for i in 0..<n {
            for j in 0..<n {
                if smellMap[i][j].1 != 0 {
                    if smellMap[i][j].1 - 1 != 0 {
                        smellMap[i][j].1 -= 1
                    } else {
                        smellMap[i][j].1 -= 1
                        smellMap[i][j].0 = 0
                    }
                }
            }
        }
        
    }
    func smellShark() {
        for i in 1...m {
            if sharkList[i].alive == 0 { continue }
            smellMap[sharkList[i].y][sharkList[i].x] = (i,smell)
        }
    }
}
solution()
/*
 
 */

```
