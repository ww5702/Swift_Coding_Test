-가 나올떄까지 반복시켜주면서 해당 조건을 만족시키며 이득들을 더해준다.   

```
import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    /*
    각 판매원의 이름을 담은 배열 enroll
    자신을 추천해준 인물을 담은 배열 referral
    seller와 amount를 연결해서 해당 인물이 해당 갯수만큼 판매
    
    내 위에 누가 있는지를 dictionary로 연결
    */
    // 누가 나를 추천해줬는지, 해당 판매원의 실적을 dictionary로 연결
    var graph: [String: String] = [:]
    var result: [String:Int] = [:]
    var answer: [Int] = []
    for i in 0..<enroll.count {
        var value = graph[enroll[i]] ?? ""
        var money = result[enroll[i]] ?? 0
        graph[enroll[i]] = referral[i]
        result[enroll[i]] = money
    }
    // print(graph)
    // print(result)
    for i in 0..<seller.count {
        var name = seller[i]
        var count = amount[i] * 100
        var recommendPerson = graph[name]!
        // 제일 위까지 올라가도록
        while name != "-" {
            // 판매원은 90프로를 가져감
            var value = result[name] ?? 0
            var earn = count - (Int(Double(count)/100*10))
            
            // 만약 10프로가 1보다 작다면
            if Double(count)/100*10 < 1.0 {
                result[name] = value + earn
                break
            }
            // 아니라면 그대로 진행
            result[name] = value + earn
            //print(result)
            
            // 추천인은 10프로를 가져감
            count -= earn
            //print(count)
            name = recommendPerson
            if name == "-" { break }
            recommendPerson = graph[name]!
            //print(name,recommendPerson)
        }
    }
    
    for i in 0..<enroll.count {
        let name = enroll[i]
        answer.append(result[name]!)
    }
    return answer
}
```
