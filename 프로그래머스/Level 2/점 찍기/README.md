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
두번째 제출   
반복문을 하나루 줄였다.   
최대 길이인 d의 제곱과 주어진 한 좌표 점의 제곱의 차를 구하고 그 값의 제곱근을 구한다   
그걸 주어진 배수인 k로 나눈다.그렇다면 반복문을 돌며 주어진 하나의 축 좌표에서 찍어질 수 있는 반대 축 좌표의 점 갯수를 단번에 구할 수 있다.   
0이 있음을 생각해 +1을 해준다.   
```
import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    var result: Int64 = 0
    var dPow = d * d
    for i in stride(from: 0, through: d, by: k) {
        let xPow = i * i
        let margin = Int64(sqrt(Double(dPow - xPow))) / Int64(k) + 1
        //print(margin)
        result += margin
    }
    //print(result)
    return result
}
```
