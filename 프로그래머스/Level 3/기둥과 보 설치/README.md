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
