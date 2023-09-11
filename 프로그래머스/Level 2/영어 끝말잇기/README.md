계속해서 테스트케이스 3 8 13번이 안되길래 질문지를 살펴봤더니   
분명 문제에는 2글자 이상의 글자만 나온다고 명시되어있는데   
한글자의 단어도 테스트케이스로 나온다는 것이 문제였다.   

```
import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var list: [String] = []
    // 마지막 단어로 이어지는지 확인
    var lastword = words[0].map{String($0)}.last!
    list.append(words[0])
        for w in 1..<words.count {
        //print("현재순서",index)
        // 현재 단어
        let now = words[w]
        // 만약 한글자를 말한다
        if now.map{String($0)}.count < 1 {
            return [w%n + 1, w/n + 1]
        }
            
        let firstword = now.map{String($0)}.first!
        // 만약 단어가 이어지지않는다면 break
        if lastword != firstword {
            return [w%n + 1, w/n + 1]
        } else {
            lastword = now.map{String($0)}.last!
        }
            
        // 만약 이미 말한 단어라면
        if list.contains(now) {
            return [w%n + 1, w/n + 1]
        }
        // 단어 추가
        list.append(now)
        //print("단어추가",list)
    }
    
    // 만약 전부 통과되었다면
    return [0,0]
}
```
