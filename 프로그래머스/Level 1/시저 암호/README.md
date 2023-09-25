UnicodeScalar값을 이용하면 A = 65, Z = 90, a = 97, z = 122값을 구할 수 있다.   
경우에 따라 값들을 조절하여 다시 알파벳으로 변형시켜준다.   
띄어쓰기일떄는 띄어쓰기만 추가해주고 반복문을 다음 index로 넘겨준다.   

```
func solution(_ s:String, _ n:Int) -> String {
    var word = s.map{String($0)}
    var result = ""
    for w in word {
        // 만약 띄어쓰기일때
        if w == " " { 
            result += " "
            continue 
        }
        var value = Int(UnicodeScalar(w)!.value)
        // 대문자일때
        if value <= 90 {
            value += n
            if value > 90 {
                value -= 26
            }
            result += String(UnicodeScalar(value)!)
        } else if value <= 122 {
        // 소문자일때
            value += n
            if value > 122 {
                value -= 26
            }
            result += String(UnicodeScalar(value)!)
        }
    }
    //print(result)
    return result
}
```
