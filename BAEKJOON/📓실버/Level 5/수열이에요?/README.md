```
import Foundation
func solution(){
    let nlr = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,l,r) = (nlr[0],nlr[1],nlr[2])
    var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    let newArr = arr[0..<l-1] + arr[l-1...r-1].sorted() + arr[r...]
    //print(newArr)
    
    var isOk = true
    for i in 0..<n-1 {
        if newArr[i] > newArr[i+1] {
            isOk = false
            break
        }
    }
    
    print(isOk ? "1" : "0")
}
solution()
/*
 
 */

```
