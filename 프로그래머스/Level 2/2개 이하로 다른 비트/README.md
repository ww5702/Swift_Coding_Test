첫 제출   
아무 생각없이 최대 비트의 수가 8개라고 생각하여 풀이하였다.   
```
import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    var result: [Int64] = []
    for i in numbers {
        // 2진법 바꾸기
        var num = String(Int(i),radix:2)
        var complete_num = num.map{String($0)}
        var total = Array(repeating:"0",count:8-complete_num.count)
        total += complete_num
        //print(total)
        
        var cnt_num = Int(i)+1
        while true {
            var check_num = String(Int(cnt_num),radix:2)
            var complete_check_num = check_num.map{String($0)}
            var complete_total = Array(repeating:"0",count:8-complete_check_num.count)
        complete_total += complete_check_num
            
            var cnt = 0
            for i in 0..<8 {
                if total[i] != complete_total[i] {
                    cnt += 1
                }
            }
            if cnt <= 2 { break }
            cnt_num += 1
        }
        result.append(Int64(cnt_num))
        
    }
    return result
    
}
```
