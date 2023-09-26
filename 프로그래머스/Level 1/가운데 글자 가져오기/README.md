주어진 조건에 맞춰서 출력해준다.   
```
func solution(_ s:String) -> String {
    var s = s.map{String($0)}
    var index = s.count/2
    return s.count%2 == 0 ? s[index-1...index].joined() : s[index]
}
```
