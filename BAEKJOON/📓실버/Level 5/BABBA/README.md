```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var dict: [String: Int] = [:]
    dict["A"] = 1
    dict["B"] = 0
    for _ in 0..<n {
        var (aCnt, bCnt) = (0,0)
        var a = dict["A"]!
        var b = dict["B"]!
        
        aCnt = b
        bCnt = a+b
        dict["A"] = aCnt
        dict["B"] = bCnt
    }
    //print(dict)
    print(dict["A"]!, dict["B"]!)
}
solution()
/*
 a
 b
 ba
 bab
 
 */

```
