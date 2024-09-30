```
import Foundation
func solution() {
    var moem = ["a","e","i","o","u"]
    
    func ruleOne(_ word: [String]) -> Bool {
        for i in 0..<word.count {
            if moem.contains(word[i]) {
                return true
            }
        }
        return false
    }
    
    
    while(true) {
        let input = readLine()!.map{String($0)}
        if input.joined(separator: "") == "end" { break }
        //print(input)
        var oneRule = ruleOne(input)
        if !oneRule {
            //print("1번룰 어김")
            print("<\(input.joined(separator: ""))> is not acceptable.")
            continue
        }
        
        var twoRule = true, threeRule = true
        var isMoem = false
        if moem.contains(input[0]) {
            isMoem = true
        }
        
        var cnt = 1
        var prevword = input[0]
        
        for i in 1..<input.count {
            let now = input[i]
            if now == prevword && now != "e" && now != "o" {
                //print("<\(input.joined(separator: ""))> is not acceptable")
                threeRule = false
                //print("3번룰 어김")
                break
            } else {
                prevword = now
            }
            
            if moem.contains(now) && isMoem {
                cnt += 1
            } else if !moem.contains(now) && !isMoem {
                cnt += 1
            } else {
                if isMoem { isMoem = false }
                else { isMoem = true}
                cnt = 1
            }
            
            //print(cnt)
            
            if cnt == 3 {
                //print("<\(input.joined(separator: ""))> is not acceptable")
                twoRule = false
                //print("2번룰 어김")
                break
            }
            
        }
        if twoRule && threeRule {
            print("<\(input.joined(separator: ""))> is acceptable.")
        } else {
            print("<\(input.joined(separator: ""))> is not acceptable.")
        }
        
    }
}

solution()
/*
 */


```
