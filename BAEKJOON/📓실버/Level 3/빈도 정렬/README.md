```
import Foundation
func solution(){
    var dict: [Int:(Int,Int)] = [:]
    var d: [Int:Int] = [:]
    let nc = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,c) = (nc[0],nc[1])
    var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    for i in 0..<n {
        let input = arr[i]
        let value = dict[input]?.0 ?? 0
        if value == 0 {
            dict[input] = (value+1,i)
        } else {
            dict[input] = (value+1,dict[input]!.1)
        }
    }
    //print(dict)
    for (num,(cnt,idx)) in dict.sorted(by: {$0.value.0 == $1.value.0 ? $0.value.1 < $1.value.1 : $0.value.0 > $1.value.0}) {
        for _ in 0..<cnt {
            print(num,terminator: " ")
        }
    }
}
solution()
/*
 */

```
