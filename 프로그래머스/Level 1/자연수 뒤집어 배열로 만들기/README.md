mapping하여 반복문을 통해 index 0의 위치에 계속해서 insert   
```
func solution(_ n:Int64) -> [Int] {
    var result: [Int] = []
    var arr = String(n).map{String($0)}
    for i in arr {
        result.insert(Int(i)!, at: 0)
    }
    return result
}
```
