mapping하여 내림차순으로 정렬 후 joined()   
```
func solution(_ n:Int64) -> Int64 {
    var num = String(n).map{String($0)}
    num.sort(by:>)
    return Int64(num.joined())!
}
```
