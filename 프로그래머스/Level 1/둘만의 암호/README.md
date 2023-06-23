첫 제출   
UnicodeScalar를 통해 변화시켜 풀이하였다.   
```
import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let s = Array(s.map{String($0)})
    var skip = Array(skip.map{String($0)})
    skip.sort(by:<)
    var result = ""
    for i in s {
        var word = Int(UnicodeScalar(i)!.value)
        //print("지금 단어 \(String(UnicodeScalar(word)!))")
        var count = 0
        while count != index {
            word += 1
            for i in skip {
                // skip에 포함되어 있다면 + 1
                if String(UnicodeScalar(word)!) == i {
                    word += 1
                }
                // z가 넘는다면 다시 a로
                if word == 123 {
                    word = 97
                }
            }
            count += 1
        }
        //print("입력")
        result.append(String(UnicodeScalar(word)!))
    }
    return result
}
```
