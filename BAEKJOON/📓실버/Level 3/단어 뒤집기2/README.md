```
import Foundation
func solution(){
    let input = readLine()!.map{String($0)}
    //print(input)
    var result = ""
    var temp = ""
    //print(result)
    var isGualho = false
    for i in 0..<input.count {
        if isGualho {
            temp += input[i]
            if input[i] == ">" {
                result += temp
                temp = ""
                isGualho = false
            }
        } else {
            if input[i] == " " {
                result += temp.reversed()
                result += " "
                temp = ""
            } else {
                if input[i] == "<" {
                    isGualho = true
                    result += temp.reversed()
                    temp = ""
                }
                temp += input[i]
            }
        }
//        print(result)
//        print(temp, isGualho)
//        print()
    }
    if !isGualho {
        result += temp.reversed()
    }
    print(result)
}
solution()
/*
 */

```
