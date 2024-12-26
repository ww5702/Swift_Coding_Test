```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for i in 0..<t {
        print("Class \(i+1)")
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let arr = input[1...].sorted(by:>)
        var value = -1
        for j in 0..<arr.count-1 {
            value = max(value, arr[j] - arr[j+1])
        }
        
        print("Max \(arr.first!), Min \(arr.last!), Largest gap \(value)")
    }
}
solution()
/*
2 3 5 7
 4 8 9
 
 */

```
