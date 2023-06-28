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
두 번째 제출   
set 함수를 이용해 count가 증가할때마다 만들수있는 모든 경우의 수를 저장한다.   
저장해주고 n을 더하거나 2를 곱하거나 3을 곱하다가 y가 포함될때 return count   
```
import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var set: Set<Int> = [x]
    var result: Int = 0
    
    while !set.isEmpty {
        if set.contains(y) {
            return result
        }
        var nextSet: Set<Int> = []
        // set함수를 이용해 n번만에 갈 수 있는 모든 경우의 수를 저장한다.
        for i in set {
            if i + n <= y {
                nextSet.insert(i+n)
            } 
            if i * 2 <= y {
                nextSet.insert(i*2)
            }
            if i * 3 <= y {
                nextSet.insert(i*3)
            }
        }
        set = nextSet
        print(set)
        result += 1
    }
    return -1
}
```
