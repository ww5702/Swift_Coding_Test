```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    var (n,a,b) = (input[0],input[1],input[2])
    var round = 0
    
    while a != b {
           a = Int(ceil(Double(a)/2.0))
           b = Int(ceil(Double(b)/2.0))
           round += 1
       }
    print(round)
}
solution()

```
