```
import Foundation

func solution(_ m:Int, _ n:Int, _ startX:Int, _ startY:Int, _ balls:[[Int]]) -> [Int] {
    var result: [Int] = []
    var r1 = 0
    var r2 = 0
    var arr: [Int] = []
    // (3,7) (7,7)의 길이는 (3,7),(7,13) 사이의 거리와 같다
    for i in 0..<balls.count {
        r1 = 9999
        r2 = 9999
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
            for i in 0..<4 {
                switch (i) {
                    case 1:
                    let x = abs(startX) + (abs(balls[i][0]))
                    let y = abs(startY-balls[i][1])
                    arr.append((x*x) + (y*y))
                    break
                    case 2:
                    let x = abs(balls[i][0]-startX)
                    let y = abs((n-startY)-(abs(n-balls[i][1])*2))
                    arr.append((x*x) + (y*y))
                    break
                    case 3:
                    let x = (m-startX)+abs(m-balls[i][0])
                    let y = abs(startY-balls[i][1])
                    arr.append((x*x) + (y*y))
                    break
                    case 4:
                    let x = abs(balls[i][0]-startX)
                    let y = abs(startY + balls[i][1])
                    arr.append((x*x) + (y*y))
                    break
                    default:
                    break
                }
            }
            print(arr)
            result.append(arr.min()!)
        }
    }
    
    return result
}

```
미완   
```
import Foundation

func solution(_ m:Int, _ n:Int, _ startX:Int, _ startY:Int, _ balls:[[Int]]) -> [Int] {
    var answer = [Int]()

    for ball in balls {
        let (endX, endY) = (ball[0], ball[1])
        var (width, height) = (0, 0)
        var minValue = Int.max

        if startX >= endX || startY != endY { // left
            width = startX + endX - 2 * m
            height = startY - endY
            minValue = min(minValue, width * width + height * height)
        }
        if startX <= endX || startY != endY { // right
            width = startX + endX
            height = startY - endY
            minValue = min(minValue, width * width + height * height)
        }
        if startX != endX || startY <= endY { // up
            width = startX - endX
            height = startY + endY
            minValue = min(minValue, width * width + height * height)
        }
        if startX != endX || startY >= endY { // down
            width = startX - endX
            height = startY + endY - 2 * n
            minValue = min(minValue, width * width + height * height)
        }

        answer.append(minValue)
    }

    return answer
}

```
코드가 많이 복잡하지만 동 서 남 북일때를 하나하나 비교해서 최소값을 append시켜줬다.   
