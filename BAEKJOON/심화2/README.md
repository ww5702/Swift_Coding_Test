## 25192 인사성 밝은 곰곰이
set 함수를 이용해 중복을 제거해주면서 정답을 추가해준다.
```
import Foundation
func solution() {
    let N = Int(readLine()!)!
    var list = Set<String>()
    var answer = 0
    for _ in 0..<N {
        let value = readLine()!
        if value == "ENTER" {
            answer += list.count
            list.removeAll()
        } else {
            list.insert(value)
        }
        //print(list, answer)
    }
    answer += list.count
    print(answer)
}
solution()

```
## 26069 붙임성 좋은 총총이
set 함수를 이용해 무지개춤을 추는 사람을 특정해준다.   

```
import Foundation
func solution() {
    let N = Int(readLine()!)!
    var list = Set<String>()
    list.insert("ChongChong")
    for _ in 0..<N {
        let value = readLine()!.split(separator: " ").map{String($0)}
        if list.contains(value[0]) || list.contains(value[1]) {
            list.insert(value[0])
            list.insert(value[1])
        }
    }
    print(list.count)
}

solution()

```
## 20920 영단어 암기는 괴로워
dictionary를 이용해 빈도수를 계산해준다.   
sorted를 사용해 만약 빈도수도 같고 길이도 같다면 사전순으로,   
빈도수만 같다면 길이순으로   
빈도수도 다르다면 빈도수가 큰 순으로 정렬한다.   
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (N,M) = (input[0],input[1])
    var dict: [String:Int] = [:]
    for _ in 0..<N {
        let word = readLine()!
        if word.count < M { continue }
        let value = dict[word] ?? 0
        dict[word] = value + 1
    }
    //print(dict)
    let sortedList = dict.sorted {
        if $0.value == $1.value {
            if $0.key.count == $1.key.count {
                return $0.key < $1.key
            }
            return $0.key.count > $1.key.count
        }
        return $0.value > $1.value
    }
    sortedList.forEach{print($0.key)}
}

solution()

```


