일단 규칙을 구해봐야한다.   
1회 = 1 = 1   
2회 = 11 = 2   
3회 = 121 = 4   
4회 = 1221 = 6   
5회 = 12321 = 9   
6회 = 123321 = 12   
7회 = 1234321 = 16   
8회 = 12344321 = 20   
9회 = 25   
10회 = 30   
11회 = 36   
12회 = 42   
13회 = 49   
도착할때 무조건 1광년을 움직여야한다고하니   
등차수열로 올라갔다가 내려오는 형태가 된다.   
1씩 2번, 2씩 2번 이렇게 증가하는 규칙을 찾을 수 있다.   

 만약 10이라고 한다면
 123211이니까
 9가 넘어가면 6회
 12부터는 7회 이 방식
 
 10회 이동할때 최대 거리
 5 * 6
 12회면
 6 * 7
 
 11회면 (11/2) + 1 제곱
 13회면 (13/2) + 1 제곱
```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let diff = input[1] - input[0]
        var n = 0
        
        while true {
            if diff <= n * (n+1) {
                print(n*2)
                break
            } else if diff <= (n+1) * (n+1) {
                print((2*n)+1)
                break
            } else {
                n += 1
            }
        }
        
    }
}
solution()
```
