첫 제출   
원점과의 거리를 비교해주는 함수를 하나 만들고   
stride 반복문을 통해 탐색하였다.   
하지만 당연히 k의 최대값이 1,000,000이어서 이중반복문을 이용한다면 시간초과가 나올수밖에 없다.   
```
import Foundation
var result = 0

func solution(_ k:Int, _ d:Int) -> Int64 {
    for i in stride(from: 0, through: d, by: k) {
        for j in stride(from: 0, through: d, by: k) {
            checkD(i,j,d)
        }
    }
    //print(result)
    return Int64(result)
}

func checkD(_ x: Int, _ y: Int, _ d : Int) {
    let x = pow(Double(x),2)
    let y = pow(Double(y),2)
    if Double(d) >= sqrt(x+y) { result += 1 }
}
```
