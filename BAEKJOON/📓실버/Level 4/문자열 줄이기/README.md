요즘 실버가 왜 더 어려운지..   

```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    var (n,m) = (nm[0],nm[1])
    var word = readLine()!.map{String($0)}
    var dict: [String: Int] = [:]
    for w in word {
        let value = dict[w] ?? 0
        dict[w] = value + 1
    }
    //print(dict)
    // 97 ~ 122
    
    var num = 97
    
    while m > 0 {
        var value = dict[String(UnicodeScalar(num)!)]
        //print(String(UnicodeScalar(num)!), value, m)
        if value == nil {
            num += 1
            continue
        }
        
        if value! <= m {
            while value != 0 {
                word.remove(at: word.firstIndex(of: String(UnicodeScalar(num)!))!)
                value! -= 1
            }
            m -= dict[String(UnicodeScalar(num)!)]!
        } else {
            for _ in 0..<m {
                word.remove(at: word.firstIndex(of: String(UnicodeScalar(num)!))!)
            }
            break
        }
        
        //print(word)
        
        num += 1
    }
    print(word.joined(separator: ""))
}

solution()
/*
 */
  

```
딕셔너리는 사용하되 남긴 글자로 생각한다.   
그리고 다시 word를 순환하면서 만약 dict에 1이상의 value가 남아있다면 result에 넣어준다.   
하지만 a가 2개 있고 지워야하는 a는 1개라면 앞에서부터 지우라는 조건이있었으므로   
뒤에서부터 순환하면서 넣어주고, 다시 결과값을 뒤집어준다.   

```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    var (n,m) = (nm[0],nm[1])
    let word = readLine()!.map{String($0)}
    var dict: [String: Int] = [:]
    for w in word {
        let value = dict[w] ?? 0
        dict[w] = value + 1
    }
    //print(dict)
    for d in dict.sorted(by: {$0.key < $1.key}) {
        if m >= d.value {
            m -= d.value
            dict[d.key] = 0
        } else {
            dict[d.key]! -= m
            break
        }
    }
    
    //print(dict)
    var result = ""
    for w in word.reversed() {
        if dict[w] != 0 {
            result += w
            dict[w]! -= 1
        }
        
    }
    print(String(result.reversed()))
}

solution()
/*
 */
  

```
