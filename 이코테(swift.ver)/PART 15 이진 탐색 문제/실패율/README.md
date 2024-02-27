```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,x) = (input[0],input[1])
    let arr = readLine()!.split(separator: " ").map{Int($0)!}
    func binary(_ arr: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int{
        if start > end {return -1}
        
        let mid = (start+end)/2
        if arr[mid] == target { return mid }
        else if arr[mid] > target {
            return binary(arr, target, start, mid-1)
        } else {
            return binary(arr, target, mid+1, end)
        }
    }
    var result = binary(arr, x, 0, n-1)
    if result == -1 {
        print(-1)
    } else {
        var cnt = 1
        var index = 1
        while true {
            if arr[result-index] == x {
                cnt += 1
                index += 1
            } else {
                break
            }
        }
        index = 1
        while true {
            if arr[result+index] == x {
                cnt += 1
                index += 1
            } else {
                break
            }
        }
        print(cnt)
    }
}
solution()
                     

/*
 7 2
 1 1 2 2 2 2 3
 
 7 5
 1 2 5 5 6 6 7
 */


```
