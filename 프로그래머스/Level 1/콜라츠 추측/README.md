조건에 맞춰서 반복문을 구성해주면 쉽게 해결할 수 있다.   

```
func solution(_ num:Int) -> Int {
    var num = num
    var count = 0
    while true {
        // 만약 1이 된다면 break
        if num == 1 { break } 
        
        // 횟수 증가
        count += 1
        if num % 2 == 0 { 
            num/=2 
        }
        else if num % 2 == 1 { 
            num = (num*3)+1 
        }
        
        // 만약 500번 반복해도 1이 되지 않는다면 -1을 return
        if count == 500 { return -1 }
    }
    return count
}
```
