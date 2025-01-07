당연히 시간초과할것 같았는데 통과하였다.   
최대갯수가 100만이라 가능했던것같다.   

```
import Foundation
func solution(){
    var arr = Array(repeating: 0, count: 1000001)
    let t = Int(readLine()!)!
    
    for i in 1...1000000 {
        for j in 1...1000000/i {
            // 2 1 2 3 4 5
            // 2 4 6 8 10
            arr[i*j] += i
        }
    }
    
    var sum = Array(repeating: 0, count: 1000001)
    for i in 1...1000000 {
        sum[i] = sum[i-1] + arr[i]
    }
    
    for _ in 0..<t {
        let n = Int(readLine()!)!
        print(sum[n])
    }
}
solution()
/*
 1 1
 2 1 2
 3 1 3
 4 1 2 4
 5 1 5
 6 1 2 3 6
 7 1 7
 8 1 2 4 8
 9 1 3 9
 10 1 2 5 10
 */

```
