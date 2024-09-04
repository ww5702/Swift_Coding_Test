```
import Foundation
func solution() {
    let sp = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (s,p) = (sp[0],sp[1])
    var word = readLine()!.map{String($0)}
    var list = readLine()!.split(separator: " ").map{Int(String($0))!}
    //print(word)
    
    var dict: [String:Int] = [:]
    dict["A"] = 0
    dict["C"] = 0
    dict["G"] = 0
    dict["T"] = 0
    for i in 0..<p {
        let value = dict[word[i]] ?? 0
        dict[word[i]] = value + 1
    }
    //print(dict)
    var result = 0
    if dict["A"]! >= list[0] && dict["C"]! >= list[1] && dict["G"]! >= list[2] && dict["T"]! >= list[3] {
        result += 1
    }
    //print(result)
    
    for i in p..<s {
        //print(word[i])
        var value = dict[word[i]] ?? 0
        dict[word[i]] = value + 1
        
        
        value = dict[word[i-p]] ?? 0
        dict[word[i-p]] = value - 1
        
        //print(dict)
        if dict["A"]! >= list[0] && dict["C"]! >= list[1] && dict["G"]! >= list[2] && dict["T"]! >= list[3] {
            result += 1
        }
        //print(result)
    }
    print(result)
}

solution()
/*
 */

```
