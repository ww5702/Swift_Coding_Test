유클리드 호제법을 사용할수있고, 최소공배수를 구하는 공식을 알고 있다면 쉽게 풀이할 수 있는 문제   

```
func solution(_ n:Int, _ m:Int) -> [Int] {
    // b가 a보다 커야한다. 최대공약수
    func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a%b)
    }
    // 최소 공배수
    // a x b = a,b의 최대공약수 x a,b의 최소공배수
    let num = gcd(m,n)
    let num2 = n*m/num
    return [num,num2]
}
```
