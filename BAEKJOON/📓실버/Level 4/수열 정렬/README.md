문제를 이해하는데 더 오래 걸린문제이다.   
쉽게 말해서   
4 1 6 1 3 6 1 4 가 존재할때   
작은 순서대로 index를 매겨주라는 뜻이다.   
1이 제일 작으므로 idx 1,3,6이 0 1 2 가 들어간다.   
그 다음 작은 수인 3이 3이 들어간다.   
위의 과정을 반복하면   
4 0 6 1 3 7 2 5 가 된다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map{Int($0)!}
    var result = Array(repeating: 0, count: n)
    for i in 0..<arr.count {
        result[arr[i]-1] = arr[i]
    }
    var dictionary: [Int: [Int]] = [:]
    for i in 0..<arr.count {
        let value = dictionary[arr[i]] ?? []
        dictionary[arr[i]] = value + [i]
    }
    let list = dictionary.sorted(by: {$0.key < $1.key})
    var idx = 0
    for (_,value) in list {
        for v in value {
            result[v] = idx
            idx += 1
        }
    }
    //print(result)
    print(result.map{String($0)}.joined(separator: " "))
}
solution()

```
