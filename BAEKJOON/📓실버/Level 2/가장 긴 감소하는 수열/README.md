```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    var result: [Int] = []
    result.append(arr[0])
    for i in 1..<n {
        //print(arr[i])
        if arr[i] < result.last! {
            result.append(arr[i])
            continue
        }
        
        var start = 0
        var end = result.count
        while start <= end {
            let mid = (start+end)/2
            if result[mid] > arr[i] {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        
        result[start] = arr[i]
        //print(result)
    }
    print(result.count)
}
solution()
/*
 */

```
