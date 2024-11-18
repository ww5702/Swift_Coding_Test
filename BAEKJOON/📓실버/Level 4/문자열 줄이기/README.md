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
