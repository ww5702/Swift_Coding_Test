첫 제출   
말 그대로 조건들을 구현해보았다.   
하지만 500,000개의 배열이 2개이므로 당연히 시간초과   
```
import Foundation

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    var maxNum = 0
    var i = 1
    while i != arrayA.max()! {
        var oneBool = true
        // 1번의 절반 조건
        for j in arrayA {
            if j % i != 0 { 
                oneBool = false
                break 
            }
        }
        
        // 1번의 나머지 절반 보건
        for j in arrayB {
            if j % i == 0 { 
                oneBool = false
                break 
            }
        }
        // 만약 둘다 통과
        if oneBool == true {
            maxNum = maxNum > i ? maxNum : i
        }
        
        i += 1
    }
    
    i = 1
    // 두번째 조건
    while i != arrayB.max()! {
        var twoBool = true
        // 1번의 절반 조건
        for j in arrayA {
            if j % i == 0 { 
                twoBool = false
                break 
            }
        }
        
        // 1번의 나머지 절반 보건
        for j in arrayB {
            if j % i != 0 { 
                twoBool = false
                break 
            }
        }
        // 만약 둘다 통과
        if twoBool == true {
            maxNum = maxNum > i ? maxNum : i
        }
        
        i += 1
    }
    //print(maxNum)
    return maxNum
}
```
