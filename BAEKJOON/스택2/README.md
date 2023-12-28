# 스택을 사용하여 더욱 어려운 문제를 해결해 봅시다.	
## 9935 문자열 폭발
문자열의 substring을 이용하여 풀이해보았지만 실패하였다.   

```
import Foundation
func solution() {
    var words = Array(readLine()!)
    let bomb = readLine()!
    var result = ""
    func checkOk(_ addWord: String) -> String{
        var word = addWord
        //print("check",word)
        while true {
            if word.suffix(bomb.count) != bomb { break }
            let start = word.index(word.startIndex, offsetBy: 0)
            let end = word.index(word.startIndex, offsetBy: word.count-bomb.count)
            word = word.substring(with: start..<end)
            //print("delete",word)
        }
        return word
    }
    var temp = ""
    for i in 0..<words.count {
        temp.append(words[i])
        
        // bomb 확인
        if temp.count >= bomb.count {
            //print(temp.suffix(bomb.count))
            if bomb == temp.suffix(bomb.count) {
                
                let start = temp.index(temp.startIndex, offsetBy: 0)
                let end = temp.index(temp.startIndex, offsetBy: temp.count-bomb.count)
                result.append(temp.substring(with: start..<end))
                
                //print("adding",result)
                temp = ""
            }
            
        }
    }
    result.append(temp)
    let answer = checkOk(result)
    answer.count == 0 ? print("FRULA") : print(answer)
}

solution()

```
문제를 너무 어렵게 생각한것 같았다.   
stack을 이용하여 popLast를 반복해준다.   
```
import Foundation
func solution() {
    var words = String(readLine()!)
    let bomb = readLine()!
    var stack: [Character] = []
    
    for word in words {
        stack.append(word)
        if bomb.last! == word {
            let cnt = stack.count
            if cnt >= bomb.count && String(stack[(cnt-bomb.count)...]) == bomb {
                for _ in 0..<bomb.count {
                    stack.popLast()
                }
            }
        }
    }
    stack.count == 0 ? print("FRULA") : print(String(stack))
}

solution()

```
