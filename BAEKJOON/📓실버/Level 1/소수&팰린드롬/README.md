소수인지 확인해주고, 소수라면 팰린드롬인지 확인해준다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var isPrime = Array(repeating: true, count: 2000001)
    isPrime[0] = false
    isPrime[1] = false
    
    
    func checkIsPrime() {
        if n >= 4 {
            for i in 2...Int(sqrt(Double(2000000))) {
                for j in 2...2000000/i {
                    isPrime[i*j] = false
                }
                
            }
        }
    }
    checkIsPrime()
    var num = n
    
    while true {
        num += 1
        if !isPrime[num] { continue }
        
        let arr = String(num).map{String($0)}
        var isPossible = true
        
        for i in 0..<arr.count/2 {
            if arr[i] != arr[arr.count-i-1] {
                isPossible = false
                break
            }
        }
        
        if isPossible {
            print(num)
            break
        }
        
    }
}

solution()
/*
 */

```
