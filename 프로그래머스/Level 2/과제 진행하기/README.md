```
import Foundation

func solution(_ plans:[[String]]) -> [String] {
    var data = plans
    data.sort(by: { $0[1] < $1[1]})
    var nowdoing = data[0][0]
    var nowtime = Int(data[0][1].split(separator:":").joined())
    var nowduring = Int(data[0][2])
    var result: [String] = []
    var remain: [String: Int] = [:]
    for i in 1..<data.count {
        var willtime = Int(data[i][1].split(separator:":").joined())
        if (nowtime! += nowduring!) <= willtime {
            result.insert(nowdoing)
        } else {
            remain.insert(nowdoing,(nowduring - (willtime-nowtime)))
        }
        print(willtime)
        print(result)
        print(remain)
    }
    return []
}
```
미완.   
