이분탐색을 이용해 풀이해준다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Double($0)!}
    let (n,y,x,z) = (input[0],input[1],input[2],input[3])
    let min = [y, x, z].min()!
    var start = 0.0, end = min
    var mid: Double = (start + end) / 2
    
    while start <= end {
        mid = (start + end) / 2
        let sum = Double(Int(y / mid) * Int(x / mid) * Int(z / mid))
        
        if sum >= n {
            if start == mid { break }
            start = mid
        } else {
            if end == mid { break }
            end = mid
        }
    }
    print(mid)
}
solution()



```
