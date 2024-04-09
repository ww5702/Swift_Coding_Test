에라토스테네스의 체를 이용해 B까지의 소수를 구하고,   
증가하는 숫자의 소수를 소인수분해를 하여 구한다.   
해당 개수가 true라면 소수   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (A,B) = (input[0],input[1])
    var numArray = Array(repeating: true, count: B+1)
    var result = 0
    func isPrime(_ n: Int) {
        numArray[0] = false
        numArray[1] = false
        
        if n >= 4 {
            for i in 2...Int(sqrt(Double(n))) {
                for j in 2...n/i {
                    numArray[i*j] = false
                }
            }
        }
    }
    isPrime(B)
    var list: [Int] = []
    for i in 2...B {
        if numArray[i] { list.append(i)}
    }
    //print(list)
    
    for i in A...B {
        //print("넘버 ", i)
        var num = i
        var arr: [Int] = []
        for l in list {
            if num < l { continue }
            while num%l == 0 {
                arr.append(l)
                num /= l
            }
        }
        //print(arr.count)
        if (numArray[arr.count]) {
            result += 1
        }
    }
    print(result)
}
solution()

```
