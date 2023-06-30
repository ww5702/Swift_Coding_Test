첫 제출   
각 단위마다 나머지가 1 10 100 등의 절대값의 반값보다 낮거나 높을경우   
내려가거나 올라가고 해당 값만큼 result에 더해줬다.   
하지만 해당 경우는 999에서 1이 증가해 1000이 되버리면 자리수가 증가하게 되는 오류가 발생하게 된다.   

```
import Foundation

func solution(_ storey:Int) -> Int {
    let storeyCount = String(storey).count
    let max = pow(10.0, Int(storeyCount))
    var storey = storey
    var result = 0
    
    for i in 0..<storeyCount {
        let now = pow(10.0, Double(Int(i)+1))
        let check = storey % Int(now)
        //print(now, check)
        // 만약 내려가는게 빠르다면
        if check <= (Int(now)/2) {
            //print("내려가는게 빠르다")
            result += (check/Int(pow(10.0, Double(Int(i)))))
            storey -= check
        } else {
            // 올라가는게 빠르다면
            //print("올라가는게 빠르다")
            result += (Int(now)-check)/Int(pow(10.0,Double(Int(i))))
            storey += (Int(now)-check)
        }
        //print(storey)
        //print("현재 개수 \(result)")
    }
    return result
}
```
두번째 제출   
전체 자리수가 0이 될때까지 반복하면서 계산하였다.   
자세한 내용은 주석 참고   
```
import Foundation

func solution(_ storey:Int) -> Int {
    var result = 0
    var storey = String(storey).map{Int(String($0))!}
    
    // storey의 각각의 자리에서 0의 개수가 전체 개수와 동일해질때까지
    // 즉 전부 0으로 바뀔때까지 반복
    while storey.filter{$0==0}.count != storey.count {
        // 맨 오른쪽부터 0이 아닌 위치를 찾는다
        var idx = storey.count - 1
        while storey[idx] == 0 && idx > 0 {
            idx -= 1
        }
        
        // 올라가는 경우
        if storey[idx] > 5 {
            result += 10 - storey[idx]
            storey[idx] = 0
            // 맨 왼쪽 자리가 아닐 경우
            if idx > 0 {
                // 찾은 자리수에서 높여서 맞췄기 때문에 그 윗 자리 +1
                storey[idx-1] += 1
            } else {
                // 맨 왼쪽자리이라면 전체 자리수가 증가하므로
                // [0]의 위치에 1 추가
                storey.insert(1, at: 0)
            }
        } else if storey[idx] < 5 {
            // 내려가는 경우
            result += storey[idx]
            storey[idx] = 0
        } else {
            // 5이라면 앞자리와 비교하여 계산한다.
            // 맨앞자리가 아니라면
            if idx-1 > 0 {
                if storey[idx-1] >= 5 {
                    result += 10-storey[idx]
                    storey[idx] = 0
                    storey[idx-1] += 1
                } else {
                    result += storey[idx]
                    storey[idx] = 0
                }
            } else {
                // 맨앞자리였다면
                result += 5
                storey[idx] = 0
            }
        }
        
    }
    return result
}
```
