첫 제출   
Set과 Dictionary 배열을 이용하여 중복을 제거해가며 풀이해갔다.   
하지만 테스트케이스 3번과 11번이 시간초과가 발생   
저 i_ban_person 즉, Dictionary안의 [String:[String]]을 이용해야할 것 같다.   
```
import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var report = Set<String>(report)
    var check_ban: [String:Int] = [:]
    var i_ban_person: [String:[String]] = [:]
    //print(report)
    for r in report {
        let list = r.split(separator:" ")
        //print(list)
        let cnt = check_ban["\(list[1])"] ?? 0
        check_ban["\(list[1])"] = cnt + 1
        //print(check_ban)
        
    }
    var result = Array(repeating: 0, count: id_list.count)
    for r in report {
        let list = r.split(separator:" ")
        let cnt = check_ban["\(list[1])"]
        //print(list[0])
        if let index = id_list.firstIndex(of:"\(list[0])") {
            if cnt! >= k {
                result[index] += 1
            }
        }
        //print(id_list.firstIndex(of:"\(list[0])"))
    }
    //print(result)
    return result
}
```
2차 제출
밑의 코드는 비슷하지만 윗 코드의 dictionary의 구성이 바뀌었다.   
[String:[]] 또한 사용이 가능   

```
import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var report = Set<String>(report)
    var check_ban: [String:Int] = [:]
    var i_ban_person: [String:[String]] = [:]
    for r in report {
        let split = r.split(separator:" ").map{String($0)}
        i_ban_person[split[0]] = (i_ban_person[split[0]] ?? []) + [split[1]]
        check_ban[split[1]] = (check_ban[split[1]] ?? 0 ) + 1
    }
    //print(check_ban)
    //print(i_ban_person)
    var result = Array(repeating:0, count: id_list.count)
    for i in i_ban_person {
        //print(i.value)
        let index = id_list.firstIndex(of:"\(i.key)")!
        for j in i.value {
            if check_ban["\(j)"] != nil {
                if check_ban["\(j)"]! >= k {result[index]+=1}
            }
        }
    }
    //print(result)
    return result
}
```
