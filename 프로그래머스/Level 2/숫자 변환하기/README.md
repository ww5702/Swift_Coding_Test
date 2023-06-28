첫번째 제출   
그저 단순하게 x2 x3보다 n이 크다면 n을 더하고,   
몫이 2나 3으로 나눠진다면 2나 3을 곱했다.   
```
import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var (x,y,n) = (x,y,n)
    var result = 0
    while true {
        if x >= y { 
            result = -1
            break
        }
        
        if (x+n) <= y && (x+n) > (x*2) && (x+n) > (x*3) {
            x += n
            result += 1
        } else if (y/x)%3 == 0 {
            x *= 3
            result += 1
        } else if (y/x)%2 == 0 {
            x *= 2
            result += 1
        } else {
            x += n
            result += 1
        }
        if x == y { break }
        
    }
    return result
}
```
