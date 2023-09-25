몫만큼 수박을 추가해주고 홀수라면 '수'를 따로 추가해준다.   

```
func solution(_ n:Int) -> String {
    let word = "수박"
    var count = n/2
    var result = ""
    for i in 0..<count {
        result += word
    }
    if n % 2 != 0 {
        result += "수"
    }
    return result
}
```
이와 같이 줄일수도 있다.   
```
func solution(_ n:Int) -> String {
    return "\(String(repeating: "수박", count: n / 2))\(n % 2 == 0 ? "" : "수")"
}
```
