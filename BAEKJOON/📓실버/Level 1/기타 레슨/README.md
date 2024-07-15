```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (input[0], input[1])
    
    var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    let sum = arr.reduce(0, +)
    var answer = 0
    
    func check(_ size: Int) -> Int {
        var cnt = 1
        var cur = size
        
        for i in 0..<n {
            if arr[i] > cur {
                cnt += 1
                cur = size
            }
            cur -= arr[i]
        }
        
        return cnt
    }
    
    var start = arr.max()!
    var end = sum
    while start <= end {
        let mid = (start+end)/2
        
        let result = check(mid)
        if result <= m {
            end = mid-1
            answer = mid
        } else {
            start = mid + 1
        }
    }
    
    print(answer)
}

solution()
/*

 */

```
