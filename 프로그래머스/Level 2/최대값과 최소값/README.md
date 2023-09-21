최대값과 최소값을 조건문을 통해 구분해낸다.   
```
func solution(_ s:String) -> String {
    var nums = s.components(separatedBy:" ")
    var (min,max) = (123456789,-123456789)
    for n in nums {
        min = min > Int(n)! ? Int(n)! : min
        max = max < Int(n)! ? Int(n)! : max
    }
    //print(min, max)
    var result = "\(min) \(max)"
    return result
}
```
