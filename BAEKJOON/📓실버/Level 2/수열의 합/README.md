최소 l개부터 시작하여 middle을 구했을때 l...middle 부터 middle...l까지의 합이   
n과 같으면 break   
없다면 +1해주는 방식으로 풀이해보았다.   
```
import Foundation
func solution(){
    let nl = readLine()!.split(separator: " ").map({Int($0)!})
    var (n,l) = (nl[0],nl[1])
    var result: [Int] = []
    var isPossible = false
    
    while (l <= n) {
        let middle = n / l
        //print(n, l, middle)
        for i in 0..<l {
            let arr = [Int](middle-l+i+1...middle+i)
            if arr.filter({$0 >= 0}).count == l {
                var sum = arr.reduce(0, +)
                //print(arr,sum)
                if (sum == n) {
                    result = arr
                    isPossible = true
                    break
                }
            }
        }
        l += 1
        if (isPossible) { break }
    }
    if l >= n {
        print(-1)
    } else {
        print(result.map{String($0)}.joined(separator: " "))
    }
}
solution()

```
하지만 접근방식은 이런방식이 훨씬 맞았다   

```
import Foundation
func solution(){
    let nl = readLine()!.split(separator: " ").map({Int($0)!})
    var (n,l) = (nl[0],nl[1])
    var isPossible = false
    
    func minus(_ n: Int) -> Int {
        var ret: Int = 0
        for i in 0..<n {
            ret += Int(i)
        }
        return ret
    }
    for i in l...100 {
        if i > 100 {
            print("-1")
            break
        } else if ((n - minus(i)) % i == 0 && n - minus(i) >= 0) {
            for j in 0..<i {
                if j == i-1 {
                    print((n - minus(i)) / i + j)
                } else {
                    print((n - minus(i)) / i + j, terminator: " ")
                }
            }
            isPossible = true
            break
        }
    }
    if !isPossible { print("-1") }
    
}
solution()
```
