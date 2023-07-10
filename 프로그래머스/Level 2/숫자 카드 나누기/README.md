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
어차피 최대공약수로 못나눈다면 그 약수들로도 못나눈다는 결론을 내릴 수 있다면 더 빠르게 풀 수 있다.   
유클리드 호제법을 이용해 최대공약수를 구한다.   
allSatisfy를 통해 두번째 조건식을 검토해준다.   
```
import Foundation
func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    let gcdA = gcd(arrayA)
    let gcdB = gcd(arrayB)
    //print(gcdA, gcdB)
    let answerA = arrayB.allSatisfy { gcdA != 1 && $0 % gcdA != 0 } ? gcdA : 0
    let answerB = arrayA.allSatisfy { gcdB != 1 && $0 % gcdB != 0 } ? gcdB : 0
    
    return max(answerA, answerB)
}
func gcd(_ arr: [Int]) -> Int {
    return arr.reduce(arr[0], { gcd($0, $1) })
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a % b)
}
```
