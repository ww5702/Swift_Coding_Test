키패드를 배열로 생각하여 1 4 7 일때는 왼손 3 6 9일때는 오른손   
나머지일때는 거리를 비교하여 입력하였다.   
```
import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var nLeft = (4,1)
    var nRight = (4,3)
    var result = ""
    for n in numbers {
        // 1 4 7일때 왼손
        if n == 1 || n == 4 || n == 7 {
            result.append("L")
            nLeft = (n/3+1,n%3)
        } else if n == 3 || n == 6 || n == 9 {
        // 3 6 9 일때 오른손
            result.append("R")
            nRight = (n/4+1,n%4)
        } else {
        // 2 5 8 0 일때는 더 가까운 손
            // 오른손이 더 가깝다면
            let x2 = Double((n/3+1)-nLeft.0)
            let x1 = Double((n%4)-nLeft.1)
            let x = sqrt(pow(x2,2)+pow(x1,2))
            let y2 = Double((n/3+1)-nRight.0)
            let y1 = Double((n%4)-nRight.1)
            let y = sqrt(pow(y2,2)+pow(y1,2))
            print(nLeft, nRight, x, y)
            if x > y {
                result.append("R")
                nRight = (n/3+1,n%4)
            } else if x < y {
                result.append("L")
                nLeft = (n/3+1,n%4)
            } else {
                if hand == "right" {
                    result.append("R")
                    nRight = (n/3+1,n%4)
                } else {
                    result.append("L")
                    nLeft = (n/3+1,n%4)
                }
            }
        }
        print(result, nLeft, nRight)
    }
    print(result)
    return ""
}
```
다른 사람의 풀이또한 비슷했다.   
```
import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    // 0~9
    let keypad = [[3,1],[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]
    var now = [[3,0],[3,1]]
    let hand = hand == "left" ? 0 : 1
    var result = ""
    
    for n in numbers {
        // 1 4 7일때 왼손
        if [1,4,7].contains(n) {
            result.append("L")
            now[0] = keypad[n]
        } else if [3,6,9].contains(n) {
        // 3 6 9일때 오른손
            result.append("R")
            now[1] = keypad[n]
        } else {
        // 2 5 8 0 일때
            let left = abs(now[0][0]-keypad[n][0]) + abs(now[0][1]-keypad[n][1])
            let right = abs(now[1][0]-keypad[n][0]) + abs(now[1][1]-keypad[n][1])
            // 거리가 같다면
            if left == right {
                now[hand] = keypad[n]
                result.append(hand == 0 ? "L" : "R")
            } else if left < right {
                result.append("L")
                now[0] = keypad[n]
            } else {
                result.append("R")
                now[1] = keypad[n]
            }
        }
    }
    //print(result)
    return result
}
```
