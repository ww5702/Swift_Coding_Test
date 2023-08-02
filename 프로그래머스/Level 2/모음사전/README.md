첫 제출   
처음으로 푼 방법은 딕셔너리를 만들어 a,e,i,o,u를 dfs로 순환하다가 aeiou의 갯수가 같아진다면
return을 해주는 방법이다.   
```
import Foundation
var wordDict = [String:Int]()
var count = 0
func solution(_ word:String) -> Int {
    dfs([])
    return wordDict[word]!
}
func dfs(_ wordLetters: [String]) {
        let word = wordLetters.joined()
        wordDict[word] = count
    
        if wordLetters.count == 5 {
            return
        } else {
            let letters = ["A","E","I","O","U"]
            for l in letters {
                count += 1
                dfs(wordLetters+[l])
            }
        }
    }
```
두번째 풀이   
같은 dfs이지만 전부 배열에 하나씩 저장해 startindex를 통해 Index의 값을 return해주는 풀이 방법이다.   
```
import Foundation
func solution(_ word:String) -> Int {
    let w = "AEIOU".map{String($0)}
    var result = [String]()
    func dfs(_ str: String) {
        result.append(str)
        if str.count == 5 {return}
        for i in 0..<w.count {
            dfs(str+w[i])
        }
    }
    dfs("")
    return result.firstIndex(of: word)!
}
```
