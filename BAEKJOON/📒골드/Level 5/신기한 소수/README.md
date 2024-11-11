에라토스테네스의 체를 이용해 소수 판별후   
해당 숫자들을 탐색해보았다.   
시간초과   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let num = Int(pow(10, Double(n)))
    
    var isPrime = Array(repeating: true, count: num+1)
    isPrime[1] = false
    
    for i in 2...Int(sqrt(Double(num))) {
        for j in 2...num/i {
            isPrime[i*j] = false
        }
    }
    for i in num/10...num-1 {
        // 소수라면
        if isPrime[i] {
            let num = String(i).map{String($0)}
            var isPossible = true
            for i in 0..<num.count-1 {
                let temp = Int(num[0...i].joined(separator: ""))!
                
                if !isPrime[temp] {
                    isPossible = false
                    break
                }
            }
            
            if isPossible {
                print(i)
            }
        }
    }
}

solution()
/*
 */
  

```
