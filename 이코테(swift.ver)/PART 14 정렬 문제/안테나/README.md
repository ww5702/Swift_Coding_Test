아무리 크기가 커도 중간쯤이 될거같아서   
짝수면 -1인 Index를   
홀수면 가운데를 뽑아서 출력해주었다.   
다들 비슷하게 풀이한것같았다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var houses = readLine()!.split(separator: " ").map{Int($0)!}
    houses.sort(by: <)
    var mid = 0
    if n % 2 == 0 {
        mid = (n/2)-1
    } else {
        mid = n/2
    }
    print(houses[mid])
}
solution()
                     

/*
 5
 1 3 5 7 9
 */
```
