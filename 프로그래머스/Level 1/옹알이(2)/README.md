첫 제출   
주어진 단어를 map하여 한글자씩 append하면서 말할 수 있는 글자가 나온다면 remove   
그리고 중복된 단어는 말할 수 없으니 isSame을 통해 확인   
만약 주어진 글자를 전부 말할 수 있는 글자여서 check가 남아있지 않다면 +1   
하지만 뭔가 좀 지저분한 느낌   
```
import Foundation

func solution(_ babbling:[String]) -> Int {
    var result = 0
    for i in babbling {
        let word = i.map{String($0)}
        var isSame = ""
        var check = ""
        for w in word {
            check.append(w)
            // 앞에서 말했던단어와 동일한 단어가 만들어진다면
            if isSame == check { break }
            if check == "aya" || check == "ye" || check == "woo" || check == "ma" {
                // 단어가 맞다면 +=1, 중복단어 확인, 초기화
                //print("단어 동일 \(check)")
                isSame = check
                check = ""
            }
        }
        //print("지금 남은 단어 ",check)
        // 현재 말할수잇는 단어들을 전부 지웠을때 남아있는 단어가 없다면
        if check.isEmpty { result += 1 }
    }
    //print(result)
    return result
}
```
