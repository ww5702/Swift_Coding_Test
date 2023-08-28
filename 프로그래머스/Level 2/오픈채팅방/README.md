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
시간초과와 몇개의 테스트케이스의 실패에 따라   
코드를 바꾸었다.   
맥락은 비슷하다   
먼저 forEach를 이용해 uid에 따른 nickname을 지정해준다.   
Change를 제외한 record들을 반복하면서 미리 Enter와 Leave에 따른 문구들을 저장하여   
해당 문구를 해당 uid의 닉네임과 함께 str에 저장하여 result에 appen해준다.   

```
import Foundation

func solution(_ record:[String]) -> [String] {
    let action = ["Enter":"님이 들어왔습니다.", "Leave":"님이 나갔습니다."]
    var list = [String:String]()
    
    record.forEach {
        let value = $0.components(separatedBy:" ")
        //print(value)
        // 닉네임 변경
        if value.count > 2 {
            list[value[1]] = value[2]
        }
    }
    //print(list)
    var result: [String] = []
    for r in record.filter{!$0.contains("Change")} {
        let value = r.components(separatedBy:" ")
        let name = list[value[1]]!
        let str = action[value[0]]!
        result.append(name + str)
    }
    //print(result)
    return result
}
```
