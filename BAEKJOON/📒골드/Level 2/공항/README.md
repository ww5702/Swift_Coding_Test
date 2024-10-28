dict가 시간이 제일 적게 걸릴것같아 풀이했지만 28%에서 시간초과   

```
import Foundation
func solution(){
    let g = Int(readLine()!)!
    var dict: [Int:Int] = [:]
    let p = Int(readLine()!)!
    for _ in 0..<p {
        let num = Int(readLine()!)!
        //print(num)
        let temp = dict.count
        for i in stride(from: num, through: 1, by: -1) {
            if dict[i] == nil {
                //print("추가",i)
                dict[i] = 1
                break
            }
            
        }
        if dict.count <= temp { break }
    }
    //print(dict)
    print(dict.count)
}

solution()
/*
 */


```
