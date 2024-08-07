```
import Foundation
func solution() {
    let input = Array(readLine()!)
    let word = Array(readLine()!)
    //print(input)
    var idx = 0
    var wordIdx = 0
    var result = 0
    
    while idx <= input.count-1 {
        wordIdx = 0
        if input[idx] == word[wordIdx] {
            var temp = idx
            while true {
                if wordIdx >= word.count || idx >= input.count || input[idx] != word[wordIdx] {
                    break
                } else {
                    idx += 1
                    wordIdx += 1
                }
            }
            
            if wordIdx == word.count {
                result += 1
            } else {
                idx = temp+1
            }
            
        } else {
            idx += 1
        }
        
    }
    
    print(result)
}


solution()
/*
 */

```
