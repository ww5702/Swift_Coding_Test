문제를 이해하는데 더 오래 걸렸다.   
따라서 문제를 해석해주는 글만 찾아보았다.   
```
문제에서 접두사X 집합이란 집합의 어떤 한 단어가 다른 단어의 접두어가 되지 않는 집합입니다.
접두사X 집합인 부분집합의 최대 크기는 곧 전체 집합에서 다른 단어의 접두어가 되는 단어만 제외한 집합이 됩니다.
또, A 단어가 B 단어의 접두어가 되기 위해서는 A 단어의 길이가 B 단어의 길이보다 짧거나 같아야 합니다.
따라서 단어 배열을 우선 단어의 길이가 짧은 순으로 정렬해주고, 
자신보다 길이가 길거나 같은 단어들과 비교하며 접두어가 될 수 있는지 확인하고 
접두어가 될 때만 집합에서 제외(개수 -1)하면 됩니다.
```
이란다.   
즉 쉽게 말해서 글자순서로 정렬해주고,   
해당글자를 기준으로 같거나 더 큰 집합들을 확인했을때   
접두사로 시작한다면 해당 집합을 빼준다는 의미이다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var arr = [String]()
    for _ in 0..<n {
        let input = String(readLine()!)
        arr.append(input)
    }
    arr.sort(by: {
        $0.count == $1.count ? $0 < $1 : $0.count < $1.count
    })
    var result = n
    for i in 0..<n {
        var now = arr[i].map{String($0)}
        //print(now)
        for j in i+1..<n {
            //print(arr[j].prefix(now.count))
            let value = arr[j].prefix(now.count)
            if (arr[i] == value) {
                result -= 1
                break
            }
        }
    }
    print(result)
}
solution()


```
