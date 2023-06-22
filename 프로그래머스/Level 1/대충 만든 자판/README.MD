첫 제출
```
import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var result: [Int] = []
    var countKeymap = Array(repeating: 0, count: keymap.count)
    for i in 0..<targets.count {
        let input = Array(targets[i].map{String($0)})
        for i in 0..<input.count {
            let keymap = Array(keymap[i].map{String($0)})
            if let x = keymap.firstIndex(of: input[i]) {
                countKeymap[i] = Int(x)
            }
        }
        countKeymap.sort(by:<)
        result.append(countKeymap[0])
        countKeymap.removeAll()
    }
    print(result)
    return []
}
```
고친 후 제출
```
import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var dict = [String:Int]()
    let keymap = keymap.map{$0.map{String($0)}}
    var result = [Int]()
    // 전체를 돌면서 제일 앞에 있는 단어의 index값을 input
    for k in keymap {
        for i in k {
            if dict[i] == nil {
                dict[i] = k.firstIndex(of: i)!
            } else {
                dict[i] = min(dict[i]!, k.firstIndex(of: i)!)
            }
        }
    }
    
    for target in targets {
        var sum = 0
        for t in target.map{String($0)} {
            if dict[t] == nil {
                sum -= 1
                break
            } else {
                sum += (dict[t]!+1)
            }
        }
        result.append(sum)
    }

    return result
}
```
let keymap = keymap.map{$0.map{String($0)}}   
한번에 map했던 값들을 배열로 저장까지 할 수 있다.   
