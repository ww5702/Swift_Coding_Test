초기 제출   
```
import Foundation

// 원의 방정식인 a^2 + b^2 = r^2를 이용한다
// x좌표를 넣은 큰 원의 방정식 - x좌표를 넣은 작은 원의 방정식이 
// 각 x좌표마다 들어가있는 정수의 개수이다.
// 거기에 (r2-r1)+1 을 해주고 곱하기 4를 한다
func solution(_ r1:Int, _ r2:Int) -> Int64 {
    var big = 0.0
    var small = 0.0
    var count = 0
    let bigr: Double = Double(r2)*Double(r2)
    let smallr:Double = Double(r1)*Double(r1)
    for i in 1..<r2 {
        if i < r1 {
            big = bigr-(Double(i)*Double(i))
            small = smallr-(Double(i)*Double(i))
            //print(big, small)
            //print(round(sqrt(big)), round(sqrt(small)))
            if  sqrt(small) - Double(Int(sqrt(small)) == 0.0 {
                count += Int(round(sqrt(big)))-Int(round(sqrt(small)))-1
            } else {
                count += Int(round(sqrt(big))-round(sqrt(small)))
            }
        } else {
            big = bigr-(Double(i)*Double(i))
            count += Int(round(sqrt(big)))
        }
    }
    count += (r2-r1)+1
    count *= 4
    //print(count)
    return Int64(count)
    
}
```
계속해서 에러인    
Swift signal: illegal instruction core dumped   
가 나타났는데 보통 index out of range라 하고 찾아보니 i가 r1보다 클때의 경우를 따로 구해줬어야 했다.   
수정 후 제출   
```
import Foundation

// 원의 방정식인 a^2 + b^2 = r^2를 이용한다
// x좌표를 넣은 큰 원의 방정식 - x좌표를 넣은 작은 원의 방정식이 
// 각 x좌표마다 들어가있는 정수의 개수이다.
// 거기에 (r2-r1)+1 을 해주고 곱하기 4를 한다
func solution(_ r1:Int, _ r2:Int) -> Int64 {
    
    func getmaxY(_ x: Int, _ r: Int, _ rName: String) -> Int {
        let max: Double = sqrt((Double(r)*Double(r)) - (Double(x)*Double(x)))
        let maxToInt: Int = Int(max)
        if rName == "r1" && max - Double(maxToInt) == 0.0 {
            return maxToInt - 1
        } else {
            return maxToInt
        }
    }
    
    var answer = 0
    for i in 1..<r2 {
        if i < r1 {
            answer += getmaxY(i, r2, "r2") - getmaxY(i, r1, "r1")
        } else {
            answer += getmaxY(i, r2, "r2")
        }
    }
    answer *= 4
    answer += (r2-r1+1) * 4
    return Int64(answer)
    
    
    
}
```
