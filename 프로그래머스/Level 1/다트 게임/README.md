```
주어진 조건에 맞춰서 코드를 완성하는 문제이다.


func solution(_ dartResult:String) -> Int {
    var arr: [Int] = []
    var dartResult = dartResult.map{String($0)}
    print(dartResult)
    var num = 0
    for i in dartResult {
        //print(Character(i).isNumber)
        // 숫자
        if Character(i).isNumber { 
            if num == 1 && i == "0" {
                num = 10
                continue
            } else {
                num = Int(i)!
                continue
            }
        }
        //print(num)
        
        // 점수곱
        if i == "S" {
            arr.append(num)
        } else if i == "D" {
            arr.append(num * num)
        } else if i == "T"{
            arr.append(num * num * num)
        }
        
        // 특수효과
        if i == "*" {
            if arr.count == 3 {
                for a in 1...2 {
                    arr[a] *= 2
                }
            } else {
                for a in 0..<arr.count {
                    arr[a] *= 2
                }
            }
            
        } else if i == "#" {
            arr[arr.count-1] *= -1
        }
        //print(arr)
    }
    return arr.reduce(0, +)
}
```
