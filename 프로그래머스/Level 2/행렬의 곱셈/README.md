행렬의 곱셈은 너무 오랜만이라 해석하는데 더 오래걸렸다.   
<img width="385" alt="스크린샷 2023-09-14 오후 6 32 04" src="https://github.com/ww5702/Coding_Test/assets/60501045/1eb771c3-6060-4b88-b5be-7974420c7bab">   
이와 같은 형식으로 행 열을 서로 곱해준다.   

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
만약 위와 같이 초기화를 일일히 시켜주고싶지 않다면 미리 배열의 크기를 초기화시켜주어야한다.   
```
import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var returnArr = [[Int]](repeating: [Int](repeating: 0, count: arr2[0].count), count: arr1.count)

    for i in 0..<arr1.count {
        for j in 0..<arr2[0].count {
            for k in 0..<arr1[i].count {
                returnArr[i][j] = returnArr[i][j] + arr1[i][k] * arr2[k][j]
            }
        }
    }
    return returnArr
}


```
