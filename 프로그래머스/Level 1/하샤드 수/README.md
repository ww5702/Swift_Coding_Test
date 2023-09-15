글자를 한 글자씩 나눈 뒤 각자리수 합을 더한후 조건에 맞게 출력   
```
func solution(_ x:Int) -> Bool {
    var num = String(x).map{String($0)}
    var sum = 0
    for n in num {
        sum += Int(n)!
    }
    //print(sum)
    return x % sum == 0 ? true : false
}
```
