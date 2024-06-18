괜히 배열 remove안하려고 얘쓰다가 시간만 보냈다.   
어차피 n이 50이라 remove해도 시간초과 발생 x   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var crain = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: >)
    let m = Int(readLine()!)!
    var box = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by:>)
    var crainIdx = 0
    var time = 0
    var isPossible = true
    //print(crain)
    //print(box)
    
    while !crain.isEmpty && crain[crain.endIndex - 1] < box[box.endIndex - 1] {
        crain.removeLast()
    }
    
    if crain.count == 0 || crain[0] < box[0] {
        print(-1)
    } else {
        while !box.isEmpty {
            var c = crain
            for i in 0..<crain.count {
                var idx = 0
                while idx < box.count && crain[i] < box[idx] {
                    idx += 1
                }
                if idx < box.count {
                    box.remove(at: idx)
                }
            }
            time += 1
        }
        print(time)
    }
    
    
}

solution()
/*
 */

```
