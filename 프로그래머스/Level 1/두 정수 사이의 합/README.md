주어진 조건에 맞춰서 풀이하면 된다.   
만약 수가 더 커져서 시간초과가 나온다면   
1~10까지의 합은 11 x 5인것처럼   
앞에서부터 , 뒤에서부터 값을 더하면서 중간에서 몫만큼 곱해준다면 시간을 더 절약할 수 있을것이다.   

```
func solution(_ a:Int, _ b:Int) -> Int64 {
    if a == b { return Int64(a) }
    var min = a > b ? b : a
    var max = a < b ? b : a
    var sum = 0
    for num in min...max {
        sum += num
    }
    return Int64(sum)
}
```
