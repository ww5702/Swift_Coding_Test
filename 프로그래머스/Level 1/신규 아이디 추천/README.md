
```
import Foundation
func checkId(_ id: String) -> String{
    var newId = id
    // 1단계
    newId = newId.lowercased()
    // 2단계
    newId = newId.components(separatedBy: ["~","!","@","#","$","%","^","&","*","(",")","+","=","[","]","{","}",":","?",",","<",">","/"]).joined()
    // 3단계
    var name = Array(newId)
    var temp = name[0]
    var word = "\(name[0])"
    for i in 1..<name.count {
        if temp == "." && name[i] == "." { continue }
        else {
            word.append(name[i])
            temp = name[i]
        }
    }
    newId = word
    //4단계
    var a = Array(newId)
    if a[0] == "." {
        var b = a[1..<a.count]
    }
    // if a[a.count-1] == "." {
    //     b = b[0..<b.count-1]
    // }
    
    return newId
}
func solution(_ new_id:String) -> String {
    print(checkId(new_id))
    return ""
}
```
