첫 제출   
```
import Foundation

func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    /*
    기둥은 바닥 위에 있거나, 보의 한쪽 끝 부분 위에 있거나, 다른 기둥 위
    보는 한쪽 끝 부분이 기둥 위에 있거나, 양쪽 끝 부분이 다른 보와 연결
    기둥과 보를 삭제할수는 있지만 위의 규칙이 적용되어야 한다
    build frame
    [0][1]은 x y 좌표
    [2]는 설치 또는 삭제할 구조물 / 0 = 기둥, 1 = 보
    [3]은 설치할지 삭제할지 / 0 = 삭제, 1 = 설치
    보는 오른쪽으로 기둥은 위쪽으로 설치
    */
    var gidong : [[Int]] = [[Int]]()
    var bo : [[Int]] = [[Int]]()
    //bo.append([1,1,1])
    //print(bo.firstIndex(of:[1,1,1]))
    //print(bo.contains([1,1,1]))
    for i in 0..<build_frame.count {
        var x = build_frame[i][0]
        var y = build_frame[i][1]
        let type = build_frame[i][2]
        let insertDelete = build_frame[i][3]
        // 기둥일때
        if type == 0 {
            // 설치
            if insertDelete == 1 {
                // 바닥 위에 있는가
                if y == 0 {
                    gidong.append([x,y,type])
                } else if bo.contains([x-1,y,1]) {
                // 만약 한쪽 끝에 보가 있는가
                    gidong.append([x,y,type])
                } else if gidong.contains([x,y-1,0]) {
                // 기둥 위에 있는가
                    gidong.append([x,y,type])
                }
            } else {
            // 삭제    
            // 기둥이 바닥에 있던걸 삭제하더라도 위의 보가 양쪽이
            // 보와 연결되어 있다면 가능
                if bo.contains([x-1,y+1,1]) && bo.contains([x+1,y+1,1]) {
                    gidong.remove(at: gidong.firstIndex(of:[x,y,0])!)
                } else if !bo.contains([x-1,y+1,1]) && !bo.contains([x,y+1,1]) {
            // 기둥을 삭제하더라도 위에 어차피 보가 없다면
                    gidong.remove(at: gidong.firstIndex(of:[x,y,0])!)
                }
            }
        } else {
        // 보일때   
            if insertDelete == 1 {
                // 보의 양쪽에 하나라도 기둥이 있다면
                if gidong.contains([x,y-1,0]) || gidong.contains([x+1,y-1,0]) {
                    bo.append([x,y,1])
                }
                // 보의 양쪽 끝부분에 보가 있다면
                if bo.contains([x-1,y,1]) && bo.contains([x+1,y,1]) {
                    bo.append([x,y,1])
                }
            } else {
                // 만약 옆 밑에 기둥이 있다면 없앨수있다
                if gidong.contains([x-1,y-1,0]) && gidong.contains([x+1,y-1,0]){
                    bo.remove(at: bo.firstIndex(of:[x,y,1])!)
                }
            }
            
        }
        //print("기둥",gidong)
        //print("보",bo)
    }
    var result = gidong + bo
    return result.sorted(by: {$0[0] == $1[0] ? $0[1] == $1[1] ? $0[2] < $1[2] : $0[1] < $1[1] : $0[0] < $1[0]})
}
```
구현하는 가닥은 비슷했다   
다만 맵을 넘어가는 경우도 판단해줬어야 했다   
```
import Foundation

func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    /*
    기둥은 바닥 위에 있거나, 보의 한쪽 끝 부분 위에 있거나, 다른 기둥 위
    보는 한쪽 끝 부분이 기둥 위에 있거나, 양쪽 끝 부분이 다른 보와 연결
    기둥과 보를 삭제할수는 있지만 위의 규칙이 적용되어야 한다
    build frame
    [0][1]은 x y 좌표
    [2]는 설치 또는 삭제할 구조물 / 0 = 기둥, 1 = 보
    [3]은 설치할지 삭제할지 / 0 = 삭제, 1 = 설치
    보는 오른쪽으로 기둥은 위쪽으로 설치
    */
    // 해당 위치에 기둥이나 보가 있는지 확인해주기 위한 3차원배열
    var map: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: n+1), count: n+1)
    
    /*
    기둥 검증
    바닥인가 y == 0
    기둥 위인가 map[y-1][x][0] == 1
    보의 한쪽 끝위인가 (벽을 넘지 않으며) 
    map[y][x][1] == 1 || (x-1 >= 0 && map[y][x-1][1] == 1)
    */
    func checkGidong(map: [[[Int]]], x: Int, y: Int) -> Bool {
        if y == 0 || map[y-1][x][0] == 1 || map[y][x][1] == 1 || (x-1 >= 0 && map[y][x-1][1] == 1) {
            return true
        }
    
        return false
    }
    
    
    /*
    보 검증
    한쪽끝이 기둥위인가 (벽을 넘지 않고))
    map[y-1][x][0] == 1 || (x+1 < map.count && map[y-1][x+1][0] == 1)
    양쪽 끝이 다른 보와 연결되어있는가 (벽을 넘지 않고))
    (x-1 >= 0 && x < map.count && map[y][x-1][1] == 1 && map[y][x+1][1] == 1
    */
    func checkBo(map: [[[Int]]], x: Int, y: Int) -> Bool {
        if map[y-1][x][0] == 1 || (x+1 < map.count && map[y-1][x+1][0] == 1) || (x-1 >= 0 && x < map.count && map[y][x-1][1] == 1 && map[y][x+1][1] == 1) {
        return true
        }
        return false
    }
    
    /*
    삭제 검증
    
    */
    func checkDelete (n: Int, map: [[[Int]]]) -> Bool {
        for y in 0...n {
            for x in 0...n {
                // 기둥일 때
                if map[y][x][0] == 1 && !checkGidong(map: map, x: x, y: y) {
                    return false
                }
            
                // 보일 때
                if map[y][x][1] == 1 && !checkBo(map: map, x: x, y: y) {
                    return false
                }
            }
        }
        return true
    }
    
    
    for buildData in build_frame {
        let x = buildData[0]
        let y = buildData[1]
        let type = buildData[2]
        let isInstall = buildData[3] == 1
        // 설치일때
        if isInstall {
            if type == 0 {
                if checkGidong(map: map, x: x, y: y) {
                    map[y][x][0] = 1
                }
            } else {
                if checkBo(map: map, x: x, y: y) {
                    map[y][x][1] = 1
                }
            }
        } else {
            // 일단 삭제, 삭제가 안되는것이면 다시 원상복구
            map[y][x][type] = 0
            if !checkDelete(n: n, map: map) {
                map[y][x][type] = 1
            }
        }
    }
    var result : [[Int]] = [[Int]]()
    for y in 0...n {
        for x in 0...n {
            for type in 0...1 {
                if map[y][x][type] == 1 {
                    result.append([x,y,type])
                }
            }
        } 
    }
    return result.sorted(by: {$0[0] == $1[0] ? $0[1] == $1[1] ? $0[2] < $1[2] : $0[1] < $1[1] : $0[0] < $1[0]})
}
```
