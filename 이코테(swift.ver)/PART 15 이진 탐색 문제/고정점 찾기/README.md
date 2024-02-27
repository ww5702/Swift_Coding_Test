```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    
    func binary(_ start: Int, _ end: Int) -> Int {
        if start > end { return -1 }
        let mid = (start+end)/2
        if arr[mid] == mid { return mid }
        else if arr[mid] > mid {
            return binary(start, mid-1)
        } else {
            return binary(mid+1, end)
        }
    }
    
    print(binary(0, n-1))
}
solution()
                     

/*
 5
 -15 -6 1 3 7
 
 7
 -15 -4 2 8 9 13 15
 
 7
 -15 -4 3 8 9 13 15
 */


```
