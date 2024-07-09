```
import Foundation
func solution() {
    var arr = Array(repeating: true, count: 1000001)
    isPrime(1000000)
    
    while true {
        let n = Int(readLine()!)!
        if n == 0 { break }
        var (a,b) = (0,0)
        
        for i in stride(from: n-1, through: n/2, by: -1) {
            if arr[i] && arr[n-i] {
                //print(i, n-i)
                b = max(i, n-i)
                a = min(i, n-i)
                break
            }
            
        }
        
        if a != 0 && b != 0 {
            print("\(n) = \(a) + \(b)")
        } else {
            print("Goldbach's conjecture is wrong.")
        }
        
    }
    
    func isPrime(_ num: Int) {
        arr[0] = false
        arr[1] = false
        for i in 2...Int(sqrt(Double(num))) {
            for j in 2...num/i {
                arr[i*j] = false
            }
        }
    }
}

solution()
/*

 */

```
