기본적으로 유클리드호제법을 이용한다.   
유클리드 호제법을 이용하면 두 수의 최대공약수를 구할 수 있다.   
최소공배수는   
8과 24가 있다 가정할때   
두 수의 최대공약수는 8, 최소공배수는 24이다.   
즉 8 x 24 = 최대공약수 x 최소공배수 를 의미한다.   
다시말하면 최소공배수 = a x b / 최대공약수 이다.   
```
import Foundation
/*
최소공배수는 axb = 최대공약수 * 최소공배수이다.
*/
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return gcd(b, a%b)
    }
}
func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a,b)
}
func solution(_ arr:[Int]) -> Int {
    var result = lcm(arr[0], arr[1])
    for a in 2..<arr.count {
        result = lcm(result, arr[a])
    }
    return result
}
```
