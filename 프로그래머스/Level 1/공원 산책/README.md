```

import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    var route = [[String]]()
    var start = [0,0]
    var dict = ["E": 1, "S" : 1, "W" : -1, "N" : -1]
    
    for i in 0..<park.count {
        let arr = Array(park[i]).map{String($0)}
        // x좌표들중에 S가 있다면 x좌표 i로 
        if arr.contains("S") {
            start[0] = i
            for j in 0..<arr.count {
                if arr[j] == "S" {
                    // y좌표 정확하게 확인해주는 문장
                    start[1] = j
                }
            }
        }
        // 한글자씩 2차원배열에 저장
        route.append(arr)
    }
    //print(start)
    //print(route)
    for i in 0..<routes.count {
        var arr = routes[i].split(separator:" ").map{String($0)}
        var move = dict[arr[0]]! * Int(arr[1])!
        var check = [String]()
        if arr[0] == "E" || arr[0] == "W" {
            var moved = start[1] + move
            // 움직였을 때 맵 밖으로 나갔는지
            if moved < 0 || moved > route[0].count-1 {
                continue
            }
            if arr[0] == "E" {
                for j in start[1]...moved {
                    check.append(route[start[0]][j])
                }
            } else {
                for j in moved...start[1] {
                    check.append(route[start[0]][j])
                }
            }
            // 장애물 있는지 확인
            if check.contains("X") {            
                continue
            } else {
                start = [start[0], moved]
            }
        }
        if arr[0] == "S" || arr[0] == "N" {
            var moved = start[0] + move
            // 맵을 나갔는지 확인
            if moved < 0 || moved > route.count-1 {    
                continue
            }
            if arr[0] == "S" {
                for j in start[0]...moved {
                    check.append(route[j][start[1]])
                }
            } else {
                for j in moved...start[0] {
                    check.append(route[j][start[1]])
                }
            }
            // 장애물 있는지 확인
            if check.contains("X") {            
                continue
            } else {
                start = [moved, start[1]]
            }
        }
    }
    return start
}

```
범위들이 전부 50보다 이하라 완전탐색으로 풀었다.   
너무 난잡한거 같은데 더 쉽게 풀 수 있는 방법을 찾아야 하나싶다.   
