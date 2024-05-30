```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0], input[1])
    var dict: [String : String] = [:]
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{String($0)}
        dict.updateValue(input[1], forKey: input[0])
    }
    //print(dict)
    for _ in 0..<m {
        let value = readLine()!
        print(dict[value]!)
    }
}
solution()

```
