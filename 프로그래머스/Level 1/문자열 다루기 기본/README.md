주어진 조건에 맞춰서 조건문을 작성해준다.   
```
func solution(_ s:String) -> Bool {
    var word = s.map{String($0)}
    if word.count < 4 || word.count == 5 || word.count > 6 { return false }
    for w in word {
        if Int(w) == nil { return false }
    }
    return true
}
```
