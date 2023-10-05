제일 먼저 떠올릴 수 있는 방법은 1씩 빼다가 0이 k개만큼 나오면 break해주는것이다.   
하지만 당연하게도 효율성에서 실패판정을 받았다.   

```
import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var stones = stones
    var result = 0
    var zeroCnt = 0
    var possible = true
    while zeroCnt < k{
        zeroCnt = 0
        for i in 0..<stones.count {
            if stones[i] == 0 { zeroCnt += 1}
            else { zeroCnt = 0 }
            
            if zeroCnt == k { possible.toggle()
                             break }
            
            if stones[i] - 1 < 0 {
                stones[i] = 0
            } else {
                stones[i] -= 1
            }
        }
        if possible { result += 1}
        possible = true
    }
    return result
}
```
풀이 방식은 비슷했으나 이분탐색을 이용하면 효율을 크게 높일수있다.   
돌들의 max값과 0 둘 값의 절반부터 시작해서   
건널수 있었으면 더 큰값으로 비교해주기 위해 start(0)을 min+1로 바꿔주고   
건널수 없었으면 더 작은값일때 비교하기 위해 max값을 mid-1로 바꿔준다.   
```
import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var start = 0, end = stones.max()!
    while start <= end {
        let mid = (start+end)/2
        
        var possible = true
        var cnt = 0
        
        for stone in stones {
            if stone - mid >= 0 {
                cnt  = 0
            } else {
                cnt += 1
                
                if cnt >= k {
                    possible = false
                    break
                }
            }
        }
        
        if possible {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return end
}
```
이분탐색으로 풀이한것은 똑같은데 계속해서 시간초과가 나길래 한동안 고생했다.........   
for stone in stones를   
for i in 0..<stones.count로 바꿔주면   
같은 코드이지만 통과가 된다.   
```
import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var start = 0, end = stones.max()!
    while start <= end {
        let mid = (start+end)/2
        
        var possible = true
        var cnt = 0
        
        for i in 0..<stones.count {
            if stones[i] - mid >= 0 {
                cnt  = 0
            } else {
                cnt += 1
                
                if cnt >= k {
                    possible = false
                    break
                }
            }
        }
        
        if possible {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return end
}
```
