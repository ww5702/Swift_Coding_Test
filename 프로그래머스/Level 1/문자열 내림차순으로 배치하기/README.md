string을 배열로 바꾼뒤 오름차순으로 정렬 후 joined()해준다.   

```
func solution(_ s:String) -> String {
    var result = s.map{String($0)}
    return result.sorted(by:>).joined()
}
```
