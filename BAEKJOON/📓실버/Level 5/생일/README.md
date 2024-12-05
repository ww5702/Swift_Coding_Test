```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var dict: [(String,Int,Int,Int)] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{String($0)}
        dict.append((input[0], Int(input[1])!, Int(input[2])!, Int(input[3])!))
    }
    
    dict.sort(by: {$0.3 == $1.3 ? $0.2 == $1.2 ? $0.1 < $1.1 : $0.2 < $1.2 : $0.3 < $1.3})
    print(dict.last!.0)
    print(dict.first!.0)
    
    
}
solution()
/*
 */

```
