```
import Foundation
func solution(){
    let input = readLine()!.map{String($0)}
    var list = [String]()
    for i in 0..<input.count-2 {
        for j in i+1..<input.count-1 {
            for k in j+1..<input.count {
                let a = input[0..<j].reversed().joined(separator: "")
                let b = input[j..<k].reversed().joined(separator: "")
                let c = input[k...input.count-1].reversed().joined(separator: "")
                list.append(a+b+c)
            }
        }
    }
    print(list.sorted(by: <)[0])
}
solution()
/*
 */

```
