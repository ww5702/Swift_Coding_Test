첫 반복문때 arr.append([])를 해주지 않아 오류가 발생했었다.   

```
func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    print(arr1+arr2)
    var arr: [[Int]] = []
    for i in 0..<arr1.count {
        arr.append([])
        for j in 0..<arr1[i].count {
            arr[i].append(arr1[i][j] + arr2[i][j])
        }
    }
    return arr
}
```
