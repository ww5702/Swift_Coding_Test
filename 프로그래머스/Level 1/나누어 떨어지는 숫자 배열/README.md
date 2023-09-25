고차함수를 이용해 divisor과 나눠떨어지는 숫자들을 모아 오름차순으로 정렬한다.   

```
func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var newarr = arr.filter{$0 % divisor == 0}.sorted(by: <)
    return newarr.count >= 1 ? newarr : [-1]
}
```
이렇게 한줄로도 풀이가 가능하나 가독성이 너무 떨어져 위와 같이 풀이했다.   
```
func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    return arr.filter{$0 % divisor == 0}.sorted(by: <).count >= 1 ? arr.filter{$0 % divisor == 0}.sorted(by: <) : [-1]
}
```
