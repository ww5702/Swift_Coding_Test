```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var stages = readLine()!.split(separator: " ").map{Int($0)!}
    var failPercent = [Int:Double]()
    var total = Double(stages.count)
    var count = Array(repeating: 0, count: n+2)
    
    for stage in stages {
        count[stage] += 1
    }
    // 0 1 3 2 1 0 1
    //print(count)
    for i in 1..<n+1 {
        if count[i] == 0 {
            failPercent[i] = 0.0
        } else {
            total = total - Double(count[i])
            failPercent[i] = Double(count[i]) / (total+Double(count[i]))
        }
    }
    let sortedArr = failPercent.sorted(by: {$0.value == $1.value ? $0.key < $1.key : $0.value > $1.value}).map{$0.key}
    print(sortedArr)
}
solution()
                     

/*
5
2 1 2 6 2 4 3 3
 */


```
