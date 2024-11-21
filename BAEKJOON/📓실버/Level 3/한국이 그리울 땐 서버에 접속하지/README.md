```
import Foundation

func solution(){
    let n = Int(readLine()!)!
    let p = readLine()!.split(separator: "*").map{String($0)}
    for _ in 0..<n {
        let word = readLine()!.map{String($0)}
        let firstCnt = p[0].map{String($0)}.count
        let secondCnt = p[1].map{String($0)}.count
//        print(firstCnt,secondCnt)
//        print(word[0..<firstCnt], p[0])
//        print(word[(word.count-secondCnt)...], p[1])
        if firstCnt + secondCnt > word.count {
            print("NE")
            continue
        }
        if firstCnt > word.count || secondCnt > word.count {
            print("NE")
            continue
        }
        if (word[0..<firstCnt].joined(separator: "") == p[0] && word[(word.count-secondCnt)...].joined(separator: "") == p[1]) {
            print("DA")
        } else {
            print("NE")
        }
    }
}
solution()
/*
 
 */

```
