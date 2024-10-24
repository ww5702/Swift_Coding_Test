시간초과   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n1 = Int(readLine()!)!
        let note1 = readLine()!.split(separator: " ").map{Int(String($0))!}
        var dict: [Int:Int] = [:]
        for n in note1 {
            dict[n] = 1
        }
        //print(dict)
        
        let n2 = Int(readLine()!)!
        let note2 = readLine()!.split(separator: " ").map{Int(String($0))!}
        
        for i in 0..<n2 {
            print(dict[note2[i]] ?? 0)
        }
    }
}

solution()
/*
 */

```
