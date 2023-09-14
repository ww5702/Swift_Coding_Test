행렬의 곱셈은 너무 오랜만이라 해석하는데 더 오래걸렸다.   

```
import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var arr: [[Int]] = []
    for i in 0..<arr1.count {
        arr.append([])
        for j in 0..<arr2[0].count {
            var temp = 0
            for k in 0..<arr2.count {
                temp += arr1[i][k] * arr2[k][j]
            }
            arr[i].append(temp)
        }
    }
    return arr
}
```
