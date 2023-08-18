문제를 이해하는데 더 오래 걸린 경우이다.   
차근차근 주어진 조건을 해결하다보면 문제가 풀리게 된다.   
```
import Foundation

func solution(_ p:String) -> String {
    // 1단계 입력이 빈 문자열인 경우 빈 문자열 반환
    if p == "" { return "" }
    
    var count = 0, index = p.startIndex
    
    // 균형잡힌 괄호 문자열인지 확인
    // ( 이라면 +1, ) 이라면 -1
    // 0이 된다면 break
    repeat {
        count += String(p[index]) == "(" ? 1 : -1
        index = p.index(after: index)
    } while count != 0
    
    // 0이 된 기점으로 index까지는 균형잡힌 괄호 문자열이다
    var u = String(p[..<index]), v = String(p[index...])
    //print(u,v)
    
    // 올바른 괄호 문자열인지 확인
    // 시작이 (이라면 어차피 위의 과정에서 괄호가 제대로 닫힐때까지 확인헀으므로 올바른 괄호 문자열이다.
    // 올바른 괄호 문자열이라면 v를 다시 위의 과정을 반복
    if String(u.first!) == "(" {
        return u + solution(v)
    } else {
        var temp = "("
        temp.append(solution(v))
        temp.append(")")
        u.removeFirst()
        u.removeLast()
        temp.append(u.map{String($0) == "(" ? ")" : "("}.joined())
        return temp
        // return "(\(solution(v)))\(u.map{String($0) == "(" ? ")" : "("}.joined())"
    }
}
```
return을 한줄로 더 간결하게 표현또한 가능했다.   
