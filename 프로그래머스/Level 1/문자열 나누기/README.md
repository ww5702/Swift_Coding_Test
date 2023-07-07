첫 제출   
단어를 한글자씩 나눈 뒤 조건에 맞춰서 값들을 카운팅해준다.   
단어의 길이는 10,000개가 끝이라 단순 반복으로 처리 가능하다고 판단하였다.   

```
import Foundation

func solution(_ s:String) -> Int {
    let word : [String] = s.map{String($0)}
    //print(word)
    var cnt = 1
    var temp = word[0]
    var result = 0
    for i in 1..<word.count {
        // 단어가 0이 된다음 다음 단어로 바뀌었다면
        // 초기화 과정 진행후 넘김
        if cnt == 0 {
            temp = word[i]
            cnt = 1
            continue
        }
        
        // 만약 다음글자가 지정된글자와 같다면 cnt += 1
        if word[i] == temp {
            cnt += 1
        } else {
            cnt -= 1
        }
        
        // 확인할 글자와 같지 않았던 개수가 같아서 0이 된다면 result + 1
        if cnt == 0 { result += 1 }
    }
    // 만약 0으로 딱 나눠떨어지지 않았다면 +1
    if cnt != 0 { result += 1 }
    //print(result)
    return result
}
```
