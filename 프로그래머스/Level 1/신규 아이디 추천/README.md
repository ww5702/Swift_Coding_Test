주어진 조건에 맞춰서 하나씩 조건문을 집어넣으면 되는 문제이다.   
구현을 요구하는 문제   
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
    // 4단계
    var a = newId.map{String($0)}
    if a[0] == "." {
        a.removeSubrange(0..<1)
    }
    if a.last == "." {
        a.removeSubrange(a.count-1...a.count-1)
    }
    //newId = a.joined()
    // 5단계
    if a.count == 0 {
        a.append("a")
    }
    // 6단계
    if a.count >= 16 {
        a.removeSubrange(15...)
    }
    if a.last == "." {
        // 16번째부터 삭제했을때 마지막 글자가 .이라면 다시 삭제
        a.removeSubrange(a.count-1...a.count-1)
    }
    // 7단계
    while a.count <= 2{
        a.append(a.last!)
    }
    
    newId = a.joined(separator:"")
    
    return newId
}
func solution(_ new_id:String) -> String {
    return checkId(new_id)
}
```
