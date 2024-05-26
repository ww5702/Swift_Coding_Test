```
import Foundation
func solution(){
    var dic = [String: String]()
    dic["@"] = "a"
    dic["["] = "c"
    dic["!"] = "i"
    dic[";"] = "j"
    dic["^"] = "n"
    dic["0"] = "o"
    dic["7"] = "t"

    let n = Int(readLine()!)!
    for _ in 0..<n {
        var check = true
        
        var str = readLine()!.map{ String($0) }
        var strCount = Double(str.count)
        var slashCount = 0
        var changed = 0.0
        for i in 0..<str.count {
            if !("a"..."z").contains(str[i]) {
                if let letter = dic[str[i]] {
                    str[i] = letter
                    changed += 1
                } else {
                    if str[i] == "\\" {
                        slashCount += 1
                        strCount -= 1
                        str[i] = ""
                    } else if str[i] == "'" {
                        switch slashCount {
                        case 1:
                            str[i] = "v"
                        case 2:
                            str[i] = "w"
                        default:
                            check = false
                        }
                        changed += 1
                        slashCount = 0
                    } else {
                        check = false
                        break
                    }
                }
            }
        }
        
        if check && strCount / 2 > changed {
            print(str.joined())
        } else {
            print("I don't understand")
        }
    }
}
solution()

```
