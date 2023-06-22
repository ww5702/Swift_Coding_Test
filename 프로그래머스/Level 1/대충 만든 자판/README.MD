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
