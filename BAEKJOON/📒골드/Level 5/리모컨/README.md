```
import Foundation
func solution(){
    var n = Int(String(readLine()!))!
    let m = Int(String(readLine()!))!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    var minCnt = abs(n-100)
    for i in 0...1000000 {
        // 500,000까지지만 뒤에서 오는 경우도 있으므로 확인
        let len = check(i)
        if len > 0 {
            // 5467 이고, i가 2000일때 len은 4이다
            // press는 5267이고 4번 누르면 200이 된다.
            let press = abs(n-i)
            minCnt = min(minCnt, press + len)
        }
    }
    print(minCnt)
    
    func check(_ i: Int) -> Int{
        var n = i
        
        if n == 0 {
            if arr.contains(0) {
                return 0
            } else {
                return 1
            }
        }
        
        var len = 0
        while n > 0 {
            if arr.contains(n % 10) { return 0 }
            n /= 10
            len += 1
        }
        return len
    }
    
}
solution()

```
