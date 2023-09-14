첫 글자가 숫자라면 나머지는 소문자로 append   
아니라면 대문자로 append   
만약 띄어쓰기가 나온다면 다음글자는 다시 첫번째 글자로 인식하고 검사   

```
func solution(_ s:String) -> String {
    var words = s.map{String($0)}
    var firstWord = true
    var result = ""
    for i in s {
        if firstWord {
            if i.isNumber == true {
                result += String(i)
                firstWord = false
            } else {
                result += String(i).uppercased()
                firstWord = false
            }
        } else {
            result += String(i).lowercased()
        }
        
        if i == " " { firstWord = true }
        //print(result)
    }
    return result
}
```
