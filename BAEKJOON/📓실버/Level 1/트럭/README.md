```
import Foundation
func solution(){
    let nwl = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,w,l) = (nwl[0],nwl[1],nwl[2])
    var truck = readLine()!.split(separator: " ").map{Int(String($0))!}
    var q: [[Int]] = [] // [트럭무게, 진입시간]
    var idx = 0
    var time = 0
    var sum = 0
    
    while idx < truck.count || !q.isEmpty {
        
        // 다리가 지탱할 수 있는 무게보다 더 큰 무게가 올라오려 한다면
        if idx < truck.count && truck[idx] > l {
            idx += 1
            continue
        }
        time += 1
        
        // 다리 위에 있는 트럭이 지나감
        if !q.isEmpty && q[0][1] + w <= time {
            sum -= q.removeFirst()[0]
        }
        
        // 트럭 진입
        if idx < truck.count && sum + truck[idx] <= l && q.count < w {
            q.append([truck[idx], time])
            sum += truck[idx]
            idx += 1
        }
        
    }
    
    print(time)
    
}

solution()
/*
 */

```
