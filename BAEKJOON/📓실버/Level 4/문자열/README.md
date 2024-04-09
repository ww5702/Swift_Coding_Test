```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map({String($0)})
    var A = Array(input[0]).map{String($0)}
    var B = Array(input[1]).map{String($0)}
    //print(A,B)
    var cnt = B.count
    for i in 0...B.count-A.count {
        //print(i)
        var temp = 0
        for j in 0..<A.count {
            //print(B[i+j])
            if (A[j] != B[i+j]) {
                temp += 1
            }
        }
        cnt = min(cnt,temp)
    }
    print(cnt)
}
solution()

```
