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
더욱 줄일수도 있다.   
```
func solution(_ x:Int) -> Bool {
    var sum = 0
    for n in String(x) {
        sum += Int(n)!
    }
    //print(sum)
    return x % sum == 0

```
한줄로도 줄일수있다.   
x의 초기값 0부터 시작해서 전체를 합한 값을 나눈다   
```
func solution(_ x:Int) -> Bool {
    return x % String(x).reduce(0, {$0+Int(String($1))!}) == 0
}
```
