```
import Foundation
func solution(){
    let input = readLine()!.map{String($0)}
    var cnt = 0
    var result = ""
    for i in 0..<input.count {
        let now = input[i]
        if now == "X" {
            cnt += 1
        } else {
            let Avalue = cnt / 4
            cnt %= 4
            let Bvalue = cnt / 2
            cnt %= 2
            result += String(repeating: "AAAA", count: Avalue)
            result += String(repeating: "BB", count: Bvalue)
            
            //print(result, cnt)
            if cnt != 0 {
                print(-1)
                exit(0)
            }
            
            result += "."
        }
    }
    
    let Avalue = cnt / 4
    cnt %= 4
    let Bvalue = cnt / 2
    cnt %= 2
    result += String(repeating: "AAAA", count: Avalue)
    result += String(repeating: "BB", count: Bvalue)
    
    //print(result, cnt)
    if cnt != 0 {
        print(-1)
        exit(0)
    }
    
    print(result)
}
solution()
/*
 */

```
