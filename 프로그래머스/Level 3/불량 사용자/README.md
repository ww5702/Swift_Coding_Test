*을 제외한 글자와 같은 글자라면 불량사용자로 지정할 가능성이 있다.   
이를 구하는 반복문을 실행한다음   
만약 같은 불량사용자가 있다면 중복을 제거하여 조합을 구한다.   

```
import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var cnt: [Int] = Array(repeating: 0, count: banned_id.count)
    for ban in 0..<banned_id.count {
        let banid = banned_id[ban].map{String($0)}
        print(banid)
        for user in user_id {
            let userid = user.map{String($0)}
            var isSame = true
            print(userid)
            if banid.count != userid.count { 
                isSame = false
                continue 
            }
            for i in 0..<banid.count {
                if banid[i] != "*" {
                    if userid[i] != banid[i] {
                        print("다른 글자")
                        isSame = false
                        continue
                    }
                }
            }
            if isSame == true {
                cnt[ban] += 1
            }
            print("나옴",banid,userid)
        }
        print(cnt)
    }
    return 0
}
```
값이 가능하다면 숫자를 +1해주는것이 아닌 해당 userid를 넣어준다.   
넣어준 값들을 dfs로 돌려준다.   
0번째 값부터 시작해서 만약 이미 포함된 값이라면 continue로 패스해주고, 새로운 값이라면 append해준다.   
순서가 바뀐채로 중복된 값이 있을수도 있으므로   
정렬한 뒤 Set를 이용해 중복을 제거해준다.   

```
import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var bannedList = [[String]]()
    for ban in 0..<banned_id.count {
        var temp = [String]()
        let banid = banned_id[ban].map{String($0)}
        for user in user_id {
            let userid = user.map{String($0)}
            var isSame = true
            if banid.count != userid.count { 
                isSame = false
                continue 
            }
            for i in 0..<banid.count {
                if banid[i] != "*" {
                    if userid[i] != banid[i] {
                        isSame = false
                        continue
                    }
                }
            }
            if isSame { temp.append(user) }
        }
        bannedList.append(temp)
    }
    //print(bannedList)
    var stack = [(idx: Int, idList: [String])]()
    // 처음 0번째 값들을 넣어준다.
    for id in bannedList[0] {
        stack.append((0,[id]))
    }
    var q: [[String]] = []
    var result = 0
    while stack.count > 0 {
        let now = stack.removeLast()
        // 만약 현재 index가 마지막이라면 해당값을 append
        if now.idx == banned_id.count-1 {
            q.append(now.idList)
            continue
        }
        // 0번째 값이 초기값이니 그 다음 1번째값부터 시작
        let idx = now.idx+1
        for user in bannedList[idx] {
            var idList = now.idList
            // 이미 포함된 값이라면 패스
            if idList.contains(user) { continue }
            idList.append(user)
            stack.append((idx, idList))
        }
    }
    // 중복을 제거해주기 위해 모든값들을 정렬해준뒤 set
    return Set(q.map{$0.sorted()}).count
}
```
