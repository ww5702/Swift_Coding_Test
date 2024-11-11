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
미리 에라토스테네스의 채를 이용해 소수를 구하는것보다   
순간순간 소수인지 확인하는게 더 빨랐다   
처음안 사실   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let num = Int(pow(10, Double(n)))
    
    func isPrime(_ num: Int) -> Bool {
        if num < 2 { return false }
        if num == 2 { return true }
        if num % 2 == 0 { return false }
        
        for i in stride(from: 3, through: Int(sqrt(Double(num))), by: 2) {
            if num % i == 0 { return false}
        }
        
        return true
    }
    
    func dfs(_ number: Int, _ size: Int) {
        if size == n {
            if isPrime(number) {
                print(number)
            }
            return
        }
        
        for i in 1...9 {
            // 어차피 짝수 제외
            if i % 2 == 0 { continue }
            let next = number*10 + i
            if isPrime(next){
                dfs(next, size+1)
            }
        }
    }
    
    dfs(2, 1)
    dfs(3, 1)
    dfs(5, 1)
    dfs(7, 1)
}

solution()
/*
 */
  

```
