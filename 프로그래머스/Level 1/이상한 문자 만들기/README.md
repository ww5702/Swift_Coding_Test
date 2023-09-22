index를 카운팅하여 홀수일때와 짝수일때 경우마다 input   
만약 띄어쓰기를 만난다면 카운팅 초기화   

```
func solution(_ s:String) -> String {
    var word = s.map{String($0)}
    var cnt = 1
    var result = ""
    for w in word {
        if w == " " {
            cnt = 1
            result += " "
            continue
        }
        
        if cnt % 2 == 1 {
            result.append(w.uppercased())
        } else {
            result.append(w.lowercased())
        }
        
        cnt += 1
    }
    return result
}
```
