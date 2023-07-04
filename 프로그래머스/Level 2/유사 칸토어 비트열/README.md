 첫 제출   
 이중 반복문을 사용하여 누구나 떠올릴수있는 방법으로 풀이하였다.   
 당연히 최악의 경우 시간초과가 발생하게 된다.   

```
import Foundation

func solution(_ n:Int, _ l:Int64, _ r:Int64) -> Int {
    let one = "11011"
    let zero = "00000"
    var result = "1"
    for i in 0..<n {
        var value = result.map{String($0)}
        var temp = ""
        for j in value {
            if j == "1" {
                temp.append(one)
            } else {
                temp.append(zero)
            }
        }
        result = temp
    }
    //print(result)
    var checkAnswer = result.map{String($0)}[Int(l-1)...Int(r-1)]
    var cnt = 0
    for i in checkAnswer {
        if i == "1" { cnt += 1}
    }
    //print(cnt)
    return cnt
}
// 11011
// 110/11 11011 00000 11/011 11011
```
두 번째 제출   
반복해서 11011와 00000이 반복되는 구조인데, 5개의 범위로 최대 4개의 1이 추가되는 규칙을 노려서 구현한다.   
5로 나눴을때의 몫만큼 1이 4번반복되므로 4를 곱해준다.   
그리고 11011 구간에 있는지 00000 구간에 있는지 section으로 구분해 00000을 지나친 구간이라면 4를 한번 빼준다.   
00000구간보다 앞에 있었을 경우 그 전 11011 구간까지의 4를 더해준값에서 그 뒤까지의 나머지(remainder)의 1을 다시 더해준다.   
l, r까지의 구간은 r까지의 1의 값 - l까지의 1의 값으로 구한다.   
```
import Foundation

func solution(_ n:Int, _ l:Int64, _ r:Int64) -> Int {
    let l = Int(l)
    let r = Int(r)
    let arr: [Int] = [1,1,0,1,1]
    
    func countOne(_ boundary: Int) -> Int {
        // 범위가 5이하일때 단순계산
        if boundary <= 5 { return arr[0..<boundary].reduce(0,+)}
        var base = 1
        while Int(pow(Double(5), Double(base+1))) < boundary {
            base += 1
        }
        
        let section = boundary / Int(pow(Double(5), Double(base)))
        let remainder = boundary % Int(pow(Double(5), Double(base)))
        
        // 일단 5개 단위로 4개씩은 1이 있으니 4씩 곱해둔다.
        var answer = section * Int(pow(Double(4), Double(base)))
        
        // 3이후면 그 사이에 0이 있는 구간이 한번 있으니 한번 빼준다.
        if section >= 3 {
            answer -= Int(pow(Double(4), Double(base)))
        }
        
        // 0이 있는 구간들이었거나 그 전이었을때는 앞선 1 + 뒤 나머지 1(remainder)
        if section == 2 {
            return answer
        } else {
            return answer + countOne(remainder)
        }
    }
    return countOne(r) - countOne(l-1)
}
// 11011
// 110/11 11011 00000 11/011 11011
// 3 8 18 23 (1~25)
// 3 8 18 23 28 33 43 48 
```
