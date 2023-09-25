string의 맨앞글자가 -이라면 음수로 해당값을 return   
양수라면 값 그대로를 int로 바꿔서 joined하여 return   

```
func solution(_ s:String) -> Int {
    var word = s.map{String($0)}
    if word[0] == "-" {
        return -1*Int(word[1...].joined())!
    } else {
        return Int(word.joined())!
    }
}
```
