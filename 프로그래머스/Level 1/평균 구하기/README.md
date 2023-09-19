고차함수를 사용할 줄 안다면 쉽게 풀이할 수 있는 문제이다.   

```
func solution(_ arr:[Int]) -> Double {
    return Double(arr.reduce(0,+))/Double(arr.count)
}
```
