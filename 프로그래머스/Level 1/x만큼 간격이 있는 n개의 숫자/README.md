```
func solution(_ x:Int, _ n:Int) -> [Int64] {
    var x = x
    var arr: [Int64] = []
    for i in 0..<n {
        arr.append(Int64(x*(i+1)))
    }
    return arr
}
```
