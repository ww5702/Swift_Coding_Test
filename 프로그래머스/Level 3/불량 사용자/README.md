*을 제외한 글자와 같은 글자라면 불량사용자로 지정할 가능성이 있다.   
이를 구하는 반복문을 실행한다음   
만약 같은 불량사용자가 있다면 중복을 제거하여 조합을 구한다.   

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
