2016년 1년으로 국한된 문제라서 11월까지의 날짜를 미리 지정해준다.   
지정한 날짜를 1월에서부터 더해주고 최종 날짜 date+b를 7로 나눴을때   
나머지 값에 따른 요일을 return해준다.   

```
func solution(_ a:Int, _ b:Int) -> String {
    var date = 0
    var plus = [31,29,31,30,31,30,31,31,30,31,30]
    var result = ["THU","FRI","SAT","SUN","MON","TUE","WED"]
    for i in 0..<a-1 {
        date += plus[i]
    }
    return result[(date+b)%7]
}
```
reduce 고차함수를 나누서 더해줄수도있다.   
```
func solution(_ a:Int, _ b:Int) -> String {
    var plus = [31,29,31,30,31,30,31,31,30,31,30]
    var result = ["THU","FRI","SAT","SUN","MON","TUE","WED"]
    return result[(plus[0..<a-1].reduce(0,+)+b)%7]
}
```
