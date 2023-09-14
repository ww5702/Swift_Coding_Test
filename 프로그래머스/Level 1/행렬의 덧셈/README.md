첫 반복문때 arr.append([])를 해주지 않아 오류가 발생했었다.   
각행을 빈값으로 초기화 시켜줘야하기 때문   

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
zip을 이용해 한줄로도 풀이할 수 있었다.   
.........   

```
return zip(arr1, arr2).map{zip($0,$1).map{$0+$1}}
```
