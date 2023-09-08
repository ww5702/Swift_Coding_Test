```
import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 0
    var (a,b) = (a,b)
    /*
       1       5
     1   3   5   7
    1 2 3 4 5 6 7 8
    반으로 나눴을때 한쪽은 왼쪽 한쪽은 오른쪽에 있다면
    무조건 결승에서밖에 만날 수 없다.
    둘다 왼쪽에 있다면
       1
     1   3
    1 2 3 4
    다시 여기서 반을 나눴을때 한쪽이 왼쪽 한쪽이 오른쪽에 있다면
    준결승에서 만날 수 있다.
    
    무조건 짝수가 올라갈수밖에 없도록 구현을 해도 풀이가 가능할것같다
    */
    while a != b {
        a = Int(ceil(Double(a)/2.0))
        b = Int(ceil(Double(b)/2.0))
        answer += 1
    }
    return answer
}
```
