브루트포스로 구했다.   
이중반복문을 이용해 해당 범위까지의 합을 구해준다.   
그리고 다른배열도 똑같이 구해준뒤, t-합을 해줬을때 0이 아니라면   
해당값이 존재하므로 해당값만큼 정답에 더해준다.   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    let n = Int(readLine()!)!
    let arrA = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    let m = Int(readLine()!)!
    let arrB = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    
    var dict: [Int:Int] = [:]
    
    for i in 0..<n {
        for j in i..<n {
            let sum = arrA[i...j].reduce(0, +)
            let value = dict[sum] ?? 0
            dict[sum] = value + 1
        }
    }
    //print(dict)
    var result = 0
    
    for i in 0..<m {
        for j in i..<m {
            let sum = arrB[i...j].reduce(0, +)
            let value = dict[t-sum] ?? 0
            if value == 0 {continue}
            result += value
        }
    }
    
    print(result)
}
solution()
/*

 
 */

```
