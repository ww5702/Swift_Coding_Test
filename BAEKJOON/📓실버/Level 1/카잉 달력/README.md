10 12라고 가정했을때   
1은 1 1 / 1 11 / 1 9 / 1 7 과 같이 반복되고   
2는 2 2 / 2 12 / 2 10 / 2 8 과 같이 반복되고   
10은 10 10 / 10 8 / 10 6 / 10 4 와 같이 반복된다.   
그리고 최대 년도는 10과 12의 곱을 최소공배수만큼 나눈수가 된다.   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        var (m,n,x,y) = (input[0],input[1],input[2],input[3])
        let gcd = m > n ? gcd(m, n) : gcd(n, m)
        let max = m * n / gcd
        var isPossible = false
        for i in 0..<max/m {
            let year = i * m + x
            let ny = year % n == 0 ? n : year % n
            
            if ny == y {
                print(year)
                isPossible = true
                break
            }
        }
        
        if !isPossible { print(-1) }
    }
    
    func gcd(_ n: Int, _ m: Int) -> Int {
        return m == 0 ? n : gcd(m, n%m)
    }
}
solution()

```
