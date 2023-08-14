더 간결하게 풀 수 있는 방법을 생각해보자   
```
import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var result = 0
    for i in 0..<a.count {
        let value = a[i]*b[i]
        result += value
    }
    return result
}
```

찾아보니 zip으로 두 배열을 합치는 방법이 있었다.   
zip한 배열을 각각의 원소마다 *로 합치고 각 원소들을 초기값 0으로 +해준다.   
```
import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {

    return zip(a, b).map(*).reduce(0, +)
}
```
