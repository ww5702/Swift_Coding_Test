아기 상어에 방향이 추가된 문제이다.   
백트래킹을 이용해 풀이하면서도, 45도씩 도는 8가지 방향 구현이 쉽지 않았다.   
특히 상어가 이동할 수 없을때 그 전 상황으로 전부 돌리는 작업에서 실패가 계속 나왔었다. -> (3,4)예제   

```
import Foundation
struct Fish {
    var num: Int // 물고기 번호
    var x: Int // x 위치
    var y: Int //y 위치
    var dir: Int // 방향
    var alive: Int //죽었는지 살았는지 판별을 위한 변수 - 0 죽음, 1 살아있음
    
    init(num: Int, x: Int, y: Int, dir: Int, alive: Int) {
        self.num = num
        self.x = x
        self.y = y
        self.dir = dir
        self.alive = alive
    }
}
func solution(){
    let dy = [-1, -1, 0, 1, 1, 1, 0, -1]; //상, 상좌, 좌, 좌하, 하, 하우, 우, 상우 순서
    let dx = [0, -1, -1, -1, 0, 1, 1, 1];
    // 물고기 번호, 방향, 살아있음
    var map = Array(repeating: Array(repeating: 0, count: 4), count: 4)
    var fish = [Fish](repeating: Fish(num: 0, x: 0, y: 0, dir: 0, alive: 0), count: 17)
    var result = 0
    for i in 0..<4 {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        var idx = 0
        for j in stride(from: 0, to: 8, by: 2) {
            let num = input[j]
            fish[num].num = num
            fish[num].dir = input[j+1]-1
            fish[num].y = i
            fish[num].x = idx
            fish[num].alive = 1
            map[i][idx] = num
            idx += 1
        }
    }
    //print(fish)

    // 첫번째 동작
    var (sy, sx, sd) = (0,0,fish[map[0][0]].dir)    // 상어 초기 위치
    var total = map[0][0]
    fish[map[0][0]].alive = 0
    map[0][0] = -1
    
    func dfs(_ sy: Int, _ sx: Int, _ sd: Int, _ total: Int) {
        result = max(result, total)
        
        let tempMap = map
        let tempFish = fish
        
        // 물고기 이동
        moveFish()

        
        // 상어 이동 , 어디든 최대 3칸
        for i in 1..<4 {
            let ny = sy + dy[sd] * i
            let nx = sx + dx[sd] * i
            // 맵을 벗어나지 않고, 빈칸이 아니라면 이동 가능
            if (0..<4).contains(ny) && (0..<4).contains(nx) && map[ny][nx] != 0 {
                // 먹은 총량 증가, 상어의 방향 변환, 맵에서의 상어 이동 및 먹은 자리 빈칸화, 해당 번호의 물고기 죽음
                let eatenFish = map[ny][nx]
                let nd = fish[map[ny][nx]].dir
                map[sy][sx] = 0
                map[ny][nx] = -1
                fish[eatenFish].alive = 0
                // 해당 상태에서 dfs 실행
                dfs(ny, nx, nd, total + eatenFish)
                
                // 다시 되돌리기 -> 해당 좌표를 안먹었을 경우를 계산하기 위함
                // 다시 물고기를 살리는 작업을 안해서 계속 틀렸다
                fish[eatenFish].alive = 1
                map[sy][sx] = -1
                map[ny][nx] = eatenFish
                
            }
        }
        
        // 다시 지도 물고기 정보 되돌리기
        map = tempMap
        fish = tempFish
    }
    
    func moveFish() {
        //print("물고기 이동 시작")
        for i in 1...16 {
            if fish[i].alive == 0 { continue }
            var dir = fish[i].dir
            //print(now)
            var cnt = 0
            // 가능할때까지 회전
            while (cnt < 8) {
                dir %= 8
                fish[i].dir = dir
                let newY = fish[i].y + dy[dir]
                let newX = fish[i].x + dx[dir]
                //print("이동할 좌표", newY, newX)
                
                // 벽을 만나지 않았고 상어를 만나지 않았다면
                if (0..<4).contains(newY) && (0..<4).contains(newX) && map[newY][newX] != -1{
                    // 빈칸이라면
                    if map[newY][newX] == 0 {
                        //print("빈칸이었으니 해당위치로 이동")
                        map[fish[i].y][fish[i].x] = 0   // 기존위치를 빈칸으로 교환
                        fish[i].y = newY
                        fish[i].x = newX
                        map[newY][newX] = i
                    } else {
                    // 물교기 교환
                        //print("물교기 교환")
                        let changeFish = fish[map[newY][newX]].num
                        fish[changeFish].y = fish[i].y
                        fish[changeFish].x = fish[i].x
                        map[fish[changeFish].y][fish[changeFish].x] = changeFish
                        fish[i].y = newY
                        fish[i].x = newX
                        map[newY][newX] = i
                        //print("교환된 물고기",fish[changeFish])
                        //print("이동한 물고기",fish[i])
                    }
                    break   // 한번이라도 움직일수있었다면 break
                } else {
                    //print("45도 회전")
                    dir += 1
                    cnt += 1
                }
                
            }
        }
    }
    
    dfs(sy,sx,sd,total)
    print(result)
}
solution()
/*
 7 6 2 3 15 6 9 8
 3 1 1 8 14 7 10 1
 6 1 13 6 4 3 11 4
 16 1 8 7 5 2 12 2
 */

```
