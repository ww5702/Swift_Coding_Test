```
import Foundation

func solution(_ m:Int, _ n:Int, _ startX:Int, _ startY:Int, _ balls:[[Int]]) -> [Int] {
    var result: [Int] = []
    var r1 = 0
    var r2 = 0
    // (3,7) (7,7)의 길이는 (3,7),(7,13) 사이의 거리와 같다
    for i in 0..<balls.count {
        if startY == balls[i][1] {
            if n - startY < startY {
                let y = n + (n-balls[i][1])
                r1 = (abs(balls[i][0] - startX) * abs(balls[i][0] - startX)) + ((y-startY) * (y-startY))
            } else {
                let y = (balls[i][1] - n) + balls[i][1]
                r2 = (abs(balls[i][0] - startX) * abs(balls[i][0] - startX)) + ((y-startY) * (y-startY))
            }
            print(r1,r2)
            if r1 > r2{
                result.append(r2)
            } else {
                result.append(r1)
            } 
        } else if startX == balls[i][0] {
            if m - startX < startX {
                let x = m + (m-balls[i][0])
                r1 = (abs(balls[i][1] - startY) * abs(balls[i][1] - startY)) + ((x-startX) * (x-startX))
            } else {
                let x = (balls[i][0] - n) + balls[i][0]
                r2 = (abs(balls[i][1] - startY) * abs(balls[i][1] - startY)) + ((x-startX) * (x-startX))
            }
            if r1 > r2{
                result.append(r2)
            } else {
                result.append(r1)
            } 
        } else {
            print("asdf")
        }
    }
    print(result)
    
    return []
}

```
미완   
