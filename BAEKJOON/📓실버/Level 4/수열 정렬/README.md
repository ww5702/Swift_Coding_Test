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
    var dictionary: [Int: [Int]] = [:]
    for i in 0..<n {
        let value = dictionary[arr[i]] ?? []
        dictionary[arr[i]] = value + [i]
    }
    //print(dictionary)
    var idx = 0
    for (_,value) in dictionary.sorted(by: {$0.key < $1.key}) {
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
밑과 같이 바로 정렬을 해줄수도 있다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let arr = readLine()!.split{$0 == " "}.map{Int($0)!}
    var k = [Int]()
    var r = [Int]()
    var s = ""
        
    for i in 0..<n {
         k.append(i)
         r.append(i)
    }

    k.sort{arr[$0] == arr[$1] ? $0 < $1 : arr[$0] < arr[$1]}
    r.sort{k[$0] < k[$1]}
        
    //    print(k)
    //    print(r)
        
        
    for i in r {
         s += "\(i) "
     }
     print(s)

}
solution()

```
