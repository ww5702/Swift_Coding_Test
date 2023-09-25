동적 계획법을 이용해 풀이하였다.   
1칸까지 가는 경우 (1)   
2칸까지 가는 경우 (1,1) (2)   
3칸까지 가는 경우 (1,1,1) (1,2) (2,1)   
4칸까지 가는 경우 (1,1,1,1) (1,1,2) (1,2,1) (2,1,1) (2,2)   
즉 n-1 까지 가는 경우 + n-2까지 가는 경우를 합치면 n까지 가는 규칙이 발생한다.   

```
func solution(_ n:Int) -> Int {
    var cache: [Int:Int] = [:]
    cache[0] = 0
    cache[1] = 1
    cache[2] = 2
    
    func jump(_ n: Int) -> Int {
        if cache.keys.contains(n) {
            return cache[n]!
        }
        cache[n] = (jump(n-1) + jump(n-2)) % 1234567
        return cache[n]!
    }
    return jump(n)
}
```
