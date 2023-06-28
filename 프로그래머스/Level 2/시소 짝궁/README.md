첫 제출   
보자마자 떠오른 생각은 유클리드 호제법을 이용해 최대공약수와 최소공배수를 구해 시소와의 비율에 맞다면   
count + 1 을 해주면 되겠다였다.   
하지만 이는 O(n^2)이기에 시간초과가 발생한다.   
```
import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var siso: [Int] = [1,2,3,4]
    // 최대 공약수
    func GCD(_ min: Int, _ max: Int) -> Int {
        let rem = min % max
        
        if rem == 0 {
            return max
        } else {
            return GCD(max,rem)
        }
    }
    
    // 최소 공배수
    func LCM(_ a: Int, _ b: Int) -> Int {
        return a * b / GCD(a,b)
    }
    var count = 0 
    for i in 0..<weights.count-1 {
        for j in i+1..<weights.count {
            let value = LCM(weights[i], weights[j])
            let a = value/weights[i]
            let b = value/weights[j]
            //print(value, a, b)
            if siso.contains(a) && siso.contains(b) {
                count += 1
            }
        }
    }
    //print(count)
    return Int64(count)
}
```
