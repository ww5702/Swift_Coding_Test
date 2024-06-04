```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    var arrA = readLine()!.split(separator: " ").map{Int($0)!}
    var arrB = readLine()!.split(separator: " ").map{Int($0)!}
    var newArr = arrA + arrB
    print(newArr.sorted().map{String($0)}.joined(separator: " "))
}
solution()

```
