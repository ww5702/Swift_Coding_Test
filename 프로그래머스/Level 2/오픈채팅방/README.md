딕셔너리 만들어 uid에 따른 닉네임의 변화를 가져온다.   
그리고 uid+입장 혹은 퇴장문구를 result에 저장한다.   
마지막으로 바뀐 닉네임을 가져와 result 문구를 전부 치환해준다.   
```
import Foundation

func solution(_ record:[String]) -> [String] {
    var result1: [String:String] = [:]
    var result2: [String] = []
    for r in record {
        let value = r.split(separator:" ")
        var nickname = result1["\(value[1])"] ?? "nil"
        if nickname == "nil" {
            result1["\(value[1])"] = String(value[2])
        } else if nickname != "nil" && value[0] == "Enter" {
            result1["\(value[1])"] = String(value[2])
        }
        
        // 닉네임 변경
        if value[0] == "Change" {
            result1["\(value[1])"] = String(value[2])
        } else if value[0] == "Enter" {
            result2.append("\(value[1])님이 들어왔습니다.")
        } else {
            result2.append("\(value[1])님이 나갔습니다.")
        }
        //print(result1)
        
    }
    //print(result2)
    for r in 0..<result2.count {
        for i in result1 {
            //print(i.key)
            result2[r] = result2[r].replacingOccurrences(of: i.key, with: i.value)
        }
    }
    //print(result2)
    return result2
}
```
