```
import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    // 배열 2개를 zip하여 dictionary로 초기화
    let score: [String: Int] = Dictionary(uniqueKeysWithValues: zip(name, yearning))
    return photo.map { $0.reduce(0) { $0 + (score[$1] ?? 0) } 
                     }
}
```
배열 2개를 uniqueKeysWithValues로 초기화하는 법을 배운다.   
