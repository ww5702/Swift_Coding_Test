w,h가 1억개라는것은 반복문을 사용하지도 못한다는 뜻을 의미한다.   
즉 수학적으로 접근하라는 것을 의미한다.   
w가 2 h가 3일때 4칸이 쓸수없는 사각형인데   
이는 2 + 3 - 1 의 공식을 사용하게 된다.   
여기서 1은 w와 h의 최소공약수를 사용해 구할 수 있다.   
따라서 유클리드호제법을 사용해 최소공약수를 구하고 값을 반환해준다.   
```
import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    func gcd(_ a : Int, _ b : Int) -> Int {
        return b == 0 ? a : gcd(b, a%b)
    }
    var num = gcd(w,h)
    
    return Int64((w*h)-(w+h-num))
}
```
