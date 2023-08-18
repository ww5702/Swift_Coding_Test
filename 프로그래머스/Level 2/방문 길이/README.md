그저 2차원배열로 방문 처리를 시도했다면 해당 좌표를 동 서 남 북 4가지 길중에서   
어떤 길로 밟았는지 판단할 수 가 없다.   
따라서 Set 배열을 사용해 이전길 + 이후길 / 이후길 + 이전길 2가지 길을 insert해준다.   
1,0에서 아래로 0,0을 가거나 0,0에서 위로 1,0을 가는 두가지 방법을 이미 사용했다는 뜻   
Set에는 0 0 0 1 / 0 1 0 0 두개가 들어간다.   
```
import Foundation

func solution(_ dirs:String) -> Int {
    // 현위치
    var position = [0,0]
    var visited: Set<[Int]> = []
    
    for d in dirs {
        var (dx, dy) = (0,0)
        
        // 이동경로에 따른 좌표
        switch d {
            case "U": 
            (dx, dy) = (0, 1)
            case "D": 
            (dx, dy) = (0, -1)
            case "L": 
            (dx, dy) = (-1, 0)
            case "R": 
            (dx, dy) = (1, 0)
            default: 
            break
        }
        // 이동한 위치의 next
        let next = [position[0]+dx, position[1]+dy]
        // 만약 이동했을때 좌표평면을 벗어났다면 continue
        if abs(next[0]) > 5 || abs(next[1]) > 5 { continue }
        
        // 만약 0,0 에서 0,1로 이동했을때
        // 0 0 0 1 or 0 1 0 0 이 Set배열에 없다면 해당 길을
        // 아직 밟은 적이 없다고 판단 후 insert
        if !visited.contains(position+next) && !visited.contains(next+position) {
            visited.insert(position+next)
        }
        //print(visited)
        // 현 위치 변경
        position = next
    }
    return visited.count
}
```
